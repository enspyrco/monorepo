import 'dart:ui';

abstract class VisualObject {
  void drawOnTo(Canvas canvas);

  /// [dt] is seconds since last update
  void update(double dt);
}
