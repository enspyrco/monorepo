import 'dart:developer';

import 'package:flutter_box2c/flutter_box2c.dart' as b2;
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// Adapted from box2c/test_world.c
  /// https://github.com/erincatto/box2c/blob/main/test/test_world.c
  test('World..', () {
    // Construct a world object, which will hold and simulate the rigid bodies.
    b2.World world = b2.createWorld(gravityX: 0.0, gravityY: -10.0);

    // Create the ground body.
    b2.Body groundBody = world.createBody(xPosition: 0.0, yPosition: -10.0);
    groundBody.createBoxShape(width: 50.0, height: 10.0);

    // Define the dynamic body. We set its position and the world calls the body
    // factory.
    b2.Body dynamicBody = world.createBody(
        xPosition: 0.0, yPosition: 4.0, type: b2.BodyType.dynamicBody);

    // Define another box shape for our dynamic body.
    // Define the dynamic body fixture.
    // Set the box density to be non-zero, so it will be dynamic.
    // Override the default friction.
    dynamicBody.createBoxShape(
        width: 1.0, height: 1.0, density: 1.0, friction: 0.3);

    // Perform the simulation.
    // This is our little game loop.
    for (int i = 0; i < 60; ++i) {
      log('${dynamicBody.position} ${dynamicBody.angle}');
      world.step();
    }

    // When the world destructor is called, all bodies and joints are freed. This can
    // create orphaned ids, so be careful about your world management.
    world.destroy();

    // ENSURE(B2_ABS(position.x) < 0.01f);
    // ENSURE(B2_ABS(position.y - 1.01f) < 0.01f);
    // ENSURE(B2_ABS(angle) < 0.01f);
  });
}
