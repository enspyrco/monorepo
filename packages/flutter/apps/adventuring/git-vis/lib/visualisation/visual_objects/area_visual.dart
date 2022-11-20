import 'package:flutter/rendering.dart';
import 'package:git_vis/interfaces/visual_object.dart';

class AreaVisual extends VisualObject {
  AreaVisual(double width, double height, Color color)
      : _paint = Paint()..color = color,
        _rect = Offset.zero & Size(width, height);

  AreaVisual.from(BoxConstraints constraints, {Color? color})
      : _paint = Paint()
          ..color = color ?? const Color.fromARGB(170, 9, 116, 165),
        _rect = Offset.zero & Size(constraints.maxWidth, constraints.maxHeight);

  final Paint _paint;
  final Rect _rect;

  Rect get rect => _rect;

  @override
  void paintOnto(Canvas canvas) {
    canvas.drawRect(_rect, _paint);
  }

  @override
  void moveForwardInTimeBy(double dt) {
    // TODO: implement update
  }
}
