import 'package:flutter/material.dart';

import '../../shared/models/dependency.dart';

class DependencyGraphPainter extends CustomPainter {
  const DependencyGraphPainter(this.dependencies);

  final List<Dependency> dependencies;

  @override
  void paint(Canvas canvas, Size size) {
    var depsPaint = Paint()
      ..color = const Color(0xff63aa65)
      ..style = PaintingStyle.fill;
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30,
    );

    for (int i = 0; i < dependencies.length; i++) {
      canvas.drawCircle(Offset(200, 200 + 50 * i.toDouble()), 10, depsPaint);

      TextPainter(
          text: TextSpan(text: dependencies[i].name, style: textStyle),
          textDirection: TextDirection.ltr)
        ..layout()
        ..paint(canvas, Offset(220, 180 + 50 * i.toDouble()));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  // @override
  // void paint(Canvas canvas, Size size) {
  //   final Rect rect = Offset.zero & size;
  //   const RadialGradient gradient = RadialGradient(
  //     center: Alignment(-0.5, 0.0),
  //     radius: 0.03,
  //     colors: <Color>[
  //       Color(0xFFFFFF00),
  //       Color(0xFF009900)
  //     ], // Color(0xFF0099FF)
  //     stops: <double>[0.4, 1.0],
  //   );
  //   canvas.drawRect(
  //     rect,
  //     Paint()..shader = gradient.createShader(rect),
  //   );
  // }

  // @override
  // bool shouldRepaint(DependencyGraphPainter oldDelegate) => false;
  // @override
  // bool shouldRebuildSemantics(DependencyGraphPainter oldDelegate) => false;
}
