import 'dart:ui';

abstract class VisualObject {
  void paintOnto(Canvas canvas);

  /// [dt] is seconds since last update
  void moveForwardInTimeBy(double dt);
}
