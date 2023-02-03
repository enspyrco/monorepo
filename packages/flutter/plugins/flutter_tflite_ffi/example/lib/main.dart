import 'dart:io' as io;
import 'dart:ui' as ui;

import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart' as tflite;

const inputImageWidth = 256;
const inputImageHeight = 256;
const inputImageTotalPixels = 256 * 256;
const modelPath =
    'assets/lite-model_movenet_multipose_lightning_tflite_float16_1.tflite';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late tflite.Interpreter _interpreter;

  bool _ready = false;
  ByteData? _inputImageData;
  ui.Image? _paintableImage;
  Uint8List? _rgbData;
  final List<Keypoint> _keypoints = [];

  @override
  void initState() {
    super.initState();
    _doAllTheWorkThenRebuild();
  }

  List<double> _runInference(Uint8List imageData) {
    _interpreter.setInputTensorData(
        data: imageData, format: ImageFormat.rgb888);

    // Execute inference.
    _interpreter.invoke();

    // Extract the output tensor data.
    return _interpreter.getOutputTensorData<double>();
  }

  /// Assets are not individually stored on disk but together in a single asset
  /// bundle so we extract the model, save it as an individual file and return
  /// the path.
  Future<String> _extractModelFromBundle(String path) async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    ByteData data = await rootBundle.load(path);
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    final file = io.File('${directory.path}/model_metadata.tflite')
      ..writeAsBytesSync(bytes);

    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Native Packages'),
            ),
            body: (_ready)
                ? CustomPaint(
                    size: const Size(256, 256),
                    painter: PosePainter(_paintableImage!, _keypoints),
                  )
                : const Center(child: CircularProgressIndicator())));
  }

  Future<void> _doAllTheWorkThenRebuild() async {
    // Extract model from bundle & create interpreter.
    final savedModelPath = await _extractModelFromBundle(modelPath);
    _interpreter = tflite.createInterpreter(
      pathToModel: savedModelPath,
      numThreads: 2,
    );

    // Reshape input tensor to fit our image & allocate tensors
    _interpreter
        .reshapeInputTensor(shape: [1, inputImageWidth, inputImageHeight, 3]);
    _interpreter.allocateTensors();

    _inputImageData = await rootBundle.load('assets/input_image.jpeg');
    _paintableImage = await _convertDataToPaintableImage(
        _inputImageData!.buffer.asUint8List(),
        inputImageWidth,
        inputImageHeight);
    _rgbData = await _extractRgbData(_paintableImage!, inputImageTotalPixels);

    // Populate the input tensor data & invoke to get to get output
    List<double> outputData = _runInference(_rgbData!);
    
    for (int i = 0; i < 17; i++) {
      var offset = i * 3;
      _keypoints.add(Keypoint(
          outputData[offset + 1], outputData[offset], outputData[offset + 2]));
    }

    _ready = true;
    if (mounted) setState(() {});
  }

  Future<Uint8List> _extractRgbData(
      ui.Image paintableImage, int numPixels) async {
    final rgbaByteData =
        (await paintableImage.toByteData(format: ui.ImageByteFormat.rawRgba))!;

    // TODO: avoid axtra copy by using a Uint8List backed by C memory
    //  But can we only read C memory that way?
    //  If we can get hold of the original C memory maybe we could avoid the
    //  extra copy by manipulating the data with C?
    final rgbBytes = Uint8List(numPixels * 3);
    for (var i = 0; i < numPixels; i++) {
      final rgbOffset = i * 3;
      final rgbaOffset = i * 4;
      rgbBytes[rgbOffset] = rgbaByteData.getUint8(rgbaOffset); // red
      rgbBytes[rgbOffset + 1] = rgbaByteData.getUint8(rgbaOffset + 1); // green
      rgbBytes[rgbOffset + 2] = rgbaByteData.getUint8(rgbaOffset + 2); // blue
    }

    return rgbBytes;
  }

  Future<ui.Image> _convertDataToPaintableImage(
      Uint8List imageData, int imageWidth, int imageHeight) async {
    final ui.ImmutableBuffer buffer =
        await ui.ImmutableBuffer.fromUint8List(imageData);
    final ui.ImageDescriptor descriptor =
        await ui.ImageDescriptor.encoded(buffer);
    buffer.dispose();

    final codec = await descriptor.instantiateCodec(
      targetWidth: imageWidth,
      targetHeight: imageHeight,
    );
    ui.FrameInfo frameInfo = await codec.getNextFrame();

    return frameInfo.image;
  }

  @override
  void dispose() {
    // Dispose of the interpreter (along with model & tensors)
    _interpreter.delete();
    super.dispose();
  }
}

class Keypoint {
  Keypoint(this.x, this.y, this.s);
  final double x;
  final double y;
  final double s;
}

class PosePainter extends CustomPainter {
  PosePainter(this.background, this.keypoints);

  ui.Image background;
  List<Keypoint> keypoints;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;
    canvas.drawImage(background, Offset.zero, paint);
    for (var keypoint in keypoints) {
      canvas.drawCircle(
          Offset(size.width * keypoint.x, size.height * keypoint.y), 10, paint);
    }
  }

  @override
  bool shouldRepaint(PosePainter oldDelegate) => false;
}
