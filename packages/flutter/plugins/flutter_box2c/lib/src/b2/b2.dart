library b2;

import 'dart:ffi';
import 'dart:math';

import 'package:ffi/ffi.dart';

import '../types.dart';
import '../bindings/generated_bindings.dart';
import '../bindings/global_bindings.dart';
import '../enums.dart';

part 'b2_world.dart';
part 'b2_body.dart';
part 'b2_shape.dart';

World createWorld({
  /// Default values from `box2c/types.h`
  ///
  /// Gravity vector. Box2D has no up-vector defined.
  double gravityX = 0.0,
  double gravityY = -10.0,

  /// Restitution velocity threshold, usually in m/s. Collisions above this
  /// speed have restitution applied (will bounce).
  double restitutionThreshold = 1.0,

  /// Can bodies go to sleep to improve performance
  bool enableSleep = true,

  /// initial capacity for bodies
  int bodyCapacity = 8,

  /// initial capacity for shapes
  int shapeCapacity = 8,
}) {
  return _FFIWorld(
    gravityX,
    gravityY,
    restitutionThreshold,
    enableSleep,
    bodyCapacity,
    shapeCapacity,
  );
}
