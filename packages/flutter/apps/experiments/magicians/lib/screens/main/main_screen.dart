import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:magicians/inference_runner_isolate.dart';
import 'package:magicians/screens/main/views/snapped_rgb_image_view.dart';

import '../../inference_runner.dart';
import '../../models/keypoints.dart';
import '../../models/model_extractor.dart';
import 'views/camera_view.dart';
import 'views/keypoints_paint.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ValueNotifier<List<Keypoint>> notifier = ValueNotifier([]);
  ValueNotifier<Uint8List> snappedRgbNotifier = ValueNotifier(Uint8List(0));
  InferenceRunner? runner;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<CameraDescription>>(
        future: availableCameras(),
        builder: (context, camerasSnapshot) {
          if (!camerasSnapshot.hasData) {
            return Container();
          }
          return FutureBuilder<ModelExtractor>(
            future: ModelExtractor.loadFromAsset(
                key: 'assets/model_movenet_multipose.tflite'),
            builder: (context, modelSnapshot) {
              if (!modelSnapshot.hasData) {
                return Container();
              }

              runner = InferenceRunnerIsolate(notifier: notifier)
                ..load(modelSnapshot.data!, 256, 256);

              return Stack(
                children: [
                  CameraView(
                    snappedRgbNotifier: snappedRgbNotifier,
                    cameras: camerasSnapshot.data!,
                    runner: runner!,
                  ),
                  RotatedBox(
                    quarterTurns: (Platform.isAndroid) ? 1 : 0,
                    child: KeypointsPaint(notifier),
                  ),
                  SnappedRGBImageView(snappedRgbNotifier),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
