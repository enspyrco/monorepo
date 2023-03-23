import 'dart:math';

import 'enums.dart';

abstract class World {
  void step();

  Body createBody({
    BodyType type = BodyType.staticBody,
    double xPosition = 0.0,
    double yPosition = 0.0,
    double angle = 0.0,
    double linearVelocityX = 0.0,
    double linearVelocityY = 0.0,
    double angularVelocity = 0.0,
    double linearDamping = 0.0,
    double angularDamping = 0.0,
    double gravityScale = 0.0,
    bool enableSleep = true,
    bool isAwake = true,
    bool fixedRotation = false,
    bool isEnabled = true,
  });

  void enableSleeping(bool flag);

  void destroy();
}

abstract class Body {
  Shape createBoxShape({
    required double width,
    required double height,
    double density,
    double friction,
  });
  Point get position;
  double get angle;
}

abstract class Shape {}
