import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
          return CameraView(cameras: snapshot.data!);
        },
      ),
    );
  }
}
