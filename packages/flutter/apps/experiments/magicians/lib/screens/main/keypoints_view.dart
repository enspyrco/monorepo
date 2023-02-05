import 'package:flutter/material.dart';
import '../../models/keypoints.dart';

class KeypointsView extends StatelessWidget {
  const KeypointsView(this.notifier, {super.key});

  final ValueNotifier<List<Keypoint>> notifier;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: const Size(256, 256), painter: KeypointsPainter(notifier));
  }
}

class KeypointsPainter extends CustomPainter {
  KeypointsPainter(this.notifier) : super(repaint: notifier);

  final ValueNotifier<List<Keypoint>> notifier;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;
    for (var keypoint in notifier.value) {
      canvas.drawCircle(
          Offset(size.width * keypoint.x, size.height * keypoint.y), 10, paint);
    }
  }

  @override
  bool shouldRepaint(KeypointsPainter oldDelegate) => true;
}
