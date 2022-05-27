import 'package:flutter/material.dart';
import 'package:flutter_box2d/flutter_box2d.dart';

import 'extensions.dart';

const timeStep = 1.0 / 60.0;
const velocityIterations = 6;
const positionIterations = 2;

void step(double deltaMs) {}

class GameWorld {
  GameWorld() {
    var gravity = B2Vec2.from2(0, 10);
    world = B2World.from1(gravity);

    square = world.createBoxEntity(1, 1);
    circle = world.createCircleEntity(0.2);
    ground = world.createBoxEntity(5, 0.1,
        x: 100, y: 200, gravityScale: 0.0, color: Colors.green);
  }

  late final B2World world;
  late final BoxEntity square;
  late final BoxEntity ground;
  late final CircleEntity circle;

  // Advance the world's physics by timeStep seconds.
  void update(double dt) {
    world.step(timeStep, velocityIterations, positionIterations);
    // print(world.getContactCount());
  }

  void paintOn(Canvas canvas) {
    square.paintOn(canvas);
    ground.paintOn(canvas);
    circle.paintOn(canvas);
  }
}
