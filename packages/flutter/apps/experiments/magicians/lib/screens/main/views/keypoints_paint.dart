import 'package:flutter/material.dart';
import '../../../models/keypoints.dart';

class KeypointsPaint extends StatelessWidget {
  const KeypointsPaint(this.notifier, {super.key});

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
  final _dotsPaint = Paint()
    ..color = Colors.green
    ..style = PaintingStyle.fill;
  final _borderPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    for (var keypoint in notifier.value) {
      canvas.drawCircle(
        Offset(size.width * keypoint.x, size.height * keypoint.y),
        5,
        _dotsPaint,
      );
    }
    canvas.drawRect(
        Rect.fromCenter(
          center: Offset(size.width * 0.5, size.height * 0.5),
          width: 256,
          height: 256,
        ),
        _borderPaint);
  }

  @override
  bool shouldRepaint(KeypointsPainter oldDelegate) => true;
}
