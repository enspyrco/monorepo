import 'dart:ui' as ui;
import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart' as tflite;
import 'package:path_provider/path_provider.dart';

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
  late tflite.TensorImage _tensorImage;

  bool _ready = false;
  final List<Keypoint> _keypoints = [];

  @override
  void initState() {
    super.initState();
    _doAllTheWorkThenRebuild();
  }

  List<double> _runInference() {
    _interpreter.setInputTensorData(_tensorImage);

    // Execute inference.
    _interpreter.invoke();

    // Extract the output tensor data.
    return _interpreter.getOutputTensorData<double>();
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
                    painter:
                        PosePainter(_tensorImage.paintableImage, _keypoints))
                : const Center(child: CircularProgressIndicator())));
  }

  /// Assets are not individually stored on disk but together in a single asset
  /// bundle so we extract the model, save it as an individual file and return
  /// the path.
  static Future<Uint8List> _extractModel({required String key}) async {
    ByteData data = await rootBundle.load(key);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  static Future<io.File> _saveModel({required Uint8List bytes}) async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    final file = io.File('${directory.path}/model.tflite')
      ..writeAsBytesSync(bytes);
    return file;
  }

  Future<void> _doAllTheWorkThenRebuild() async {
    final modelData =
        await _extractModel(key: 'assets/model_movenet_multipose.tflite');
    final modelFile = await _saveModel(bytes: modelData);

    // Load the model & create the interpreter.
    _interpreter = tflite.createInterpreter(
      pathToModel: modelFile.path,
      numThreads: 2,
    );

    // Preprocess an image into a tensor image
    _tensorImage = await TensorImage.loadFromBundle(
        key: 'assets/input_image.jpeg',
        inputFormat: ImageFormat.rgba8888,
        targetWidth: 256,
        targetHeight: 256);

    // Reshape input tensor to fit our image & allocate tensors
    _interpreter.reshapeInputTensor(
        shape: [1, _tensorImage.targetWidth, _tensorImage.targetHeight, 3]);
    _interpreter.allocateTensors();

    // Populate the input tensor data & invoke to get to get output
    List<double> outputData = _runInference();

    for (int i = 0; i < 17; i++) {
      var offset = i * 3;
      _keypoints.add(Keypoint(
          outputData[offset + 1], outputData[offset], outputData[offset + 2]));
    }

    _ready = true;
    if (mounted) setState(() {});
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
