import 'package:vector_math/vector_math.dart';

class Vector2Percentage {
  final Vector2 v;
  final Vector2 previous;
  final double startAt;
  final double endAt;

  Vector2Percentage(
    this.v,
    this.previous,
    this.startAt,
    this.endAt,
  );
}
