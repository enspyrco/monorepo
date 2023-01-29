import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(widget.cameras[0], ResolutionPreset.low);

    _controller.initialize().then((_) {
      if (!mounted) return;

      // now the controller is initialized, build the CameraPreview
      setState(() {});

      // Setup an image stream that creates input tensors and runs inference
      _controller.startImageStream((CameraImage image) {});
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
    return CameraPreview(_controller);
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
