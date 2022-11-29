import 'dart:ui';

import '../../interfaces/visual_object.dart';

class KinshipVisual extends VisualObject {
  KinshipVisual(Offset start, Offset end)
      : _start = start,
        _end = end;

  final Offset _start;
  final Offset _end;

  @override
  void paintOnto(Canvas canvas) {
    // TODO: implement drawOnTo
  }

  @override
  void moveForwardInTimeBy(double dt) {
    // TODO: implement update
  }
}
