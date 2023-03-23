import 'dart:math';

import 'src/b2_enums.dart';

abstract class World {
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

  enableSleeping(bool flag);
}

abstract class Body {
  Point get position;
}
