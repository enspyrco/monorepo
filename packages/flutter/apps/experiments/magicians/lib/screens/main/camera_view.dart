import 'dart:io' as io;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart' as tflite;
import 'package:path_provider/path_provider.dart';

import '../../models/keypoints.dart';

const targetWidth = 256;
const targetHeight = 256;
const numPixels = targetWidth * targetHeight;

class CameraView extends StatefulWidget {
  const CameraView(this.notifier, {super.key, required this.cameras});

  final List<CameraDescription> cameras;
  final ValueNotifier<List<Keypoint>> notifier;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  late CameraController _controller;
  late tflite.Interpreter _interpreter;
  final _rgbBytes = Uint8List(numPixels * 3);

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.low,
      imageFormatGroup: ImageFormatGroup.bgra8888,
    );

    _controller.initialize().then((_) {
      if (!mounted) return;

      // now the controller is initialized, build the CameraPreview
      setState(() {});

      /// Setup an image stream with a callback that:
      ///  - converts a [CameraImage] to a [flutter_tflite_ffi.TensorImage]
      ///  - passes the [flutter_tflite_ffi.TensorImage] in to the
      ///    [flutter_tflite_ffi.Interpreper]'s input tensor
      ///  - runs inference
      _controller.startImageStream((CameraImage cameraImage) {
        if (cameraImage.format.group == ImageFormatGroup.bgra8888) {
          Uint8List cameraBytes = cameraImage.planes.first.bytes;
          int numCameraBytes = cameraImage.planes.first.bytes.length;
          int numCameraRows =
              numCameraBytes ~/ cameraImage.planes.first.bytesPerRow;
          int numCameraCols = cameraImage.planes.first.bytesPerRow ~/ 4;

          String s =
              '$numCameraRows x $numCameraCols = ${numCameraRows * numCameraCols} pixels = $numCameraBytes bytes';

          for (var x = 0; x < targetWidth; x++) {
            for (var y = 0; y < targetHeight; y++) {
              final int rgbaIndex = y * numCameraCols + x;
              final int rgbIndex = y * targetWidth + x;
              final rgbOffset = rgbIndex * 3;
              final rgbaOffset = rgbaIndex * 4;
              _rgbBytes[rgbOffset] = cameraBytes[rgbaOffset + 2]; // red
              _rgbBytes[rgbOffset + 1] = cameraBytes[rgbaOffset + 1]; // green
              _rgbBytes[rgbOffset + 2] = cameraBytes[rgbaOffset]; // blue
            }
          }

          _interpreter.setInputTensorData(_rgbBytes);
          _interpreter.invoke();

          List<double> outputData = _interpreter.getOutputTensorData<double>();
          List<Keypoint> keypoints = [];
          for (int i = 0; i < 17; i++) {
            var offset = i * 3;
            keypoints.add(Keypoint(outputData[offset + 1], outputData[offset],
                outputData[offset + 2]));
          }
          widget.notifier.value = keypoints;
        } else {
          throw UnsupportedError('${cameraImage.format} is not supported.');
        }
      });
    }).catchError((e) => _handleInitializationError(e));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // TODO: add something here, this code came from camera plugin README but is incomplete
      // onNewCameraSelected(cameraController.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return FutureBuilder<io.File>(
        future: _extractModel(key: 'assets/model_movenet_multipose.tflite'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          // Load the model & create the interpreter.
          _interpreter = tflite.createInterpreter(
            pathToModel: snapshot.data!.path,
            numThreads: 2,
          );

          // Reshape input tensor to fit our image & allocate tensors
          _interpreter
              .reshapeInputTensor(shape: [1, targetWidth, targetHeight, 3]);
          _interpreter.allocateTensors();

          return CameraPreview(_controller);
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// If there is an initialization error... // TODO: handle error and add comment
dynamic _handleInitializationError(Object e) async {
  if (e is CameraException) {
    switch (e.code) {
      case 'CameraAccessDenied':
        // Handle access errors here.
        break;
      default:
        // Handle other errors here.
        break;
    }
  }
}

Future<io.File> _extractModel({required String key}) async {
  ByteData data = await rootBundle.load(key);
  Uint8List bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  io.Directory directory = await getApplicationDocumentsDirectory();
  final file = io.File('${directory.path}/model.tflite')
    ..writeAsBytesSync(bytes);
  return file;
}
