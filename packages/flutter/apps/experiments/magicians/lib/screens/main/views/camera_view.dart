import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:magicians/inference_runner.dart';
import 'package:magicians/models/inference_input.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.cameras, required this.runner});

  final List<CameraDescription> cameras;
  final InferenceRunner runner;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.cameras[0],

      /// ResolutionPreset.low (should) = 352x288 on iOS, 240p (320x240) on Android.
      ResolutionPreset.low,

      /// Set the format explicitly so we can catch errors if setting fails.
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.yuv420
          : Platform.isIOS
              ? ImageFormatGroup.bgra8888
              : ImageFormatGroup.unknown,
    );

    _controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
      _controller.startImageStream(_handleCameraImage);
    }).catchError((e) => _handleCameraInitializationError(e));
  }

  /// Convert each [CameraImage] to the correct format for the input
  /// tensor, then runs inference.
  void _handleCameraImage(CameraImage cameraImage) {
    final inferenceInput =
        cameraImage.toInferenceInput(targetWidth: 256, targetHeight: 256);

    final stopwatch = Stopwatch()..start();
    widget.runner.runInferenceOn(inferenceInput.data);
    print('inference ran in ${stopwatch.elapsedMilliseconds} ms');
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return CameraPreview(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// If there is an initialization error... // TODO: handle error and add comment
dynamic _handleCameraInitializationError(Object e) async {
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
