import 'dart:math';
import 'dart:ui';

import 'package:flutter_box2d/flutter_box2d.dart';
import 'package:flutter_box2d_example/square_object.dart';

const maxTimeStepMs = 1 / 60;
const velocityIterations = 1;
const positionIterations = 1;

void step(double deltaMs) {}

class GameWorld {
  GameWorld() {
    var gravity = B2Vec2.from2(0, 10);
    _b2World = B2World.from1(gravity);

    _square = SquareObject(_b2World);
  }

  late final B2World _b2World;
  late final SquareObject _square;

  /// Advances the world's physics by the requested number of seconds.
  /// Calculate no more than a 60th of a second during one world.Step() call
  void update(double dt) {
    _b2World.step(
        min(dt, maxTimeStepMs), velocityIterations, positionIterations);
  }

  void paintOn(Canvas canvas) {
    _square.paintOn(canvas);
  }
}
