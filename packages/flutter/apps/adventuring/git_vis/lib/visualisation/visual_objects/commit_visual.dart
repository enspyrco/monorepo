import 'dart:ui';

import '../../git/models/git_objects/commit.dart';
import '../../interfaces/visual_object.dart';

class CommitVisual extends VisualObject {
  CommitVisual(CommitState state, {Offset? initialPosition})
      : _pos = initialPosition ?? const Offset(20, 20);

  final _paint = Paint()..color = const Color(0xFF009AAA);
  final _radius = 10.0;
  Offset _pos;

  Offset get pos => _pos;

  @override
  void paintOnto(Canvas canvas) => canvas.drawCircle(_pos, _radius, _paint);

  @override
  void moveForwardInTimeBy(double dt) {
    _pos = Offset(_pos.dx, _pos.dy + dt * 10);
  }
}
