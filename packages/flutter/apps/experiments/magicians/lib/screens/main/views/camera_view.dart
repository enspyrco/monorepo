import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:magicians/inference_runner.dart';
import 'package:magicians/models/inference_input.dart';
import 'dart:ui' as ui;

class CameraView extends StatefulWidget {
  const CameraView(
      {super.key,
      required this.snappedRgbNotifier,
      required this.cameras,
      required this.runner});

  final ValueNotifier<Uint8List> snappedRgbNotifier;
  final List<CameraDescription> cameras;
  final InferenceRunner runner;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  late CameraController _controller;
  int count = 0;
  GlobalKey globalKey = GlobalKey();

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
    count++;

    final inferenceInput =
        cameraImage.toInferenceInput(targetWidth: 256, targetHeight: 256);
    if (count == 10) {
      // img.Image image = img.Image.fromBytes(
      //     width: 256, height: 256, bytes: inferenceInput.data.buffer);
      // widget.snappedRgbNotifier.value = img.encodePng(image);
      final RenderRepaintBoundary boundary = globalKey.currentContext!
          .findRenderObject()! as RenderRepaintBoundary;
      final ui.Image uiImage = boundary.toImageSync();
      print('Image dimensions: ${uiImage.width}x${uiImage.height}');
      uiImage.toByteData(format: ui.ImageByteFormat.png).then((value) =>
          widget.snappedRgbNotifier.value = value!.buffer.asUint8List());
    }
    if (count == 100) {}

    final stopwatch = Stopwatch()..start();
    widget.runner.runInferenceOn(inferenceInput.data);
    print('inference ran in ${stopwatch.elapsedMilliseconds} ms');
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return RepaintBoundary(
      key: globalKey,
      child: CameraPreview(_controller),
    );
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
