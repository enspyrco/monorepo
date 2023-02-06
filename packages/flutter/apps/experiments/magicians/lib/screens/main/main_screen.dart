import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../inference_runner.dart';
import '../../models/keypoints.dart';
import '../../models/tflite_model.dart';
import 'views/camera_view.dart';
import 'views/keypoints_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ValueNotifier<List<Keypoint>> notifier = ValueNotifier([]);
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
          return FutureBuilder<TfliteModel>(
            future: TfliteModel.loadFromAsset(
                key: 'assets/model_movenet_multipose.tflite'),
            builder: (context, modelSnapshot) {
              if (!modelSnapshot.hasData) {
                return Container();
              }

              runner = InferenceRunner(notifier: notifier)
                ..load(modelSnapshot.data!, 256, 256);

              return Stack(
                children: [
                  CameraView(
                    cameras: camerasSnapshot.data!,
                    runner: runner!,
                  ),
                  KeypointsView(notifier),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
