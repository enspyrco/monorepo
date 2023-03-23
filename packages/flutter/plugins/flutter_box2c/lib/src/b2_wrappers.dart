import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'bindings/extensions_on_bindings.dart';
import 'bindings/generated_bindings.dart';
import 'bindings/global_bindings.dart';

WorldId createWorld(WorldDef worldDef) {
  return globalBindings
      .b2CreateWorld(worldDef._nativeB2WorldDef)
      .toDartObject();
}

class WorldId {
  WorldId(int index, int revision) : _nativeB2WorldId = calloc<b2WorldId>() {
    _nativeB2WorldId.ref.index = index;
    _nativeB2WorldId.ref.revision = revision;
  }

  WorldId._(this._nativeB2WorldId);

  final Pointer<b2WorldId> _nativeB2WorldId;

  int get index => _nativeB2WorldId.ref.index;
  int get revision => _nativeB2WorldId.ref.revision;
}

class Vec2 {
  Vec2(double x, double y) : _nativeB2Vec2 = malloc<b2Vec2>() {
    _nativeB2Vec2.ref.x = x;
    _nativeB2Vec2.ref.y = y;
  }

  Vec2._(this._nativeB2Vec2);

  final Pointer<b2Vec2> _nativeB2Vec2;

  void dispose() {
    calloc.free(_nativeB2Vec2);
  }
}

/// From `box2c/types.h` :
/// Make a world definition with default values.
/// static inline b2WorldDef b2DefaultWorldDef()
/// {
/// 	b2WorldDef def = {0};
/// 	def.gravity = B2_LITERAL(b2Vec2){0.0f, -10.0f};
/// 	def.restitutionThreshold = 1.0f * b2_lengthUnitsPerMeter;
/// 	def.enableSleep = true;
/// 	def.bodyCapacity = 8;
/// 	def.shapeCapacity = 8;
/// 	return def;
/// }
class WorldDef {
  WorldDef() : _nativeB2WorldDef = calloc<b2WorldDef>() {
    _nativeB2WorldDef.ref.gravity.x = 0.0;
    _nativeB2WorldDef.ref.gravity.y = -10.0;
    _nativeB2WorldDef.ref.restitutionThreshold = 1.0;
    _nativeB2WorldDef.ref.enableSleep = true;
    _nativeB2WorldDef.ref.bodyCapacity = 8;
    _nativeB2WorldDef.ref.shapeCapacity = 8;
  }
  WorldDef._(this._nativeB2WorldDef);

  final Pointer<b2WorldDef> _nativeB2WorldDef;

  /// Gravity vector. Box2D has no up-vector defined.
  Vec2 get gravity => _nativeB2WorldDef.ref.gravity.toDartObject();

  /// Restitution velocity threshold, usually in m/s. Collisions above this
  /// speed have restitution applied (will bounce).
  double get restitutionThreshold => _nativeB2WorldDef.ref.restitutionThreshold;

  /// Can bodies go to sleep to improve performance
  bool get enableSleep => _nativeB2WorldDef.ref.enableSleep;

  /// initial capacity for bodies
  int get bodyCapacity => _nativeB2WorldDef.ref.bodyCapacity;

  /// initial capacity for shapes
  int get shapeCapacity => _nativeB2WorldDef.ref.shapeCapacity;
}
