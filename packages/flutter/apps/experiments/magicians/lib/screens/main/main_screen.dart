import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../models/keypoints.dart';
import 'camera_view.dart';
import 'keypoints_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ValueNotifier<List<Keypoint>> notifier = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<CameraDescription>>(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return Stack(
            children: [
              CameraView(notifier, cameras: snapshot.data!),
              KeypointsView(notifier)
            ],
          );
        },
      ),
    );
  }
}
