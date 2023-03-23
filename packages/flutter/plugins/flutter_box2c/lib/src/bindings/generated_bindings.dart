// ignore_for_file: always_specify_types
// ignore_for_file: camel_case_types
// ignore_for_file: non_constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings for `src/flutter_box2c.h`.
class FlutterBox2cBindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  FlutterBox2cBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  FlutterBox2cBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  late final ffi.Pointer<b2WorldId> _b2_nullWorldId =
      _lookup<b2WorldId>('b2_nullWorldId');

  b2WorldId get b2_nullWorldId => _b2_nullWorldId.ref;

  late final ffi.Pointer<b2BodyId> _b2_nullBodyId =
      _lookup<b2BodyId>('b2_nullBodyId');

  b2BodyId get b2_nullBodyId => _b2_nullBodyId.ref;

  late final ffi.Pointer<b2ShapeId> _b2_nullShapeId =
      _lookup<b2ShapeId>('b2_nullShapeId');

  b2ShapeId get b2_nullShapeId => _b2_nullShapeId.ref;

  late final ffi.Pointer<b2JointId> _b2_nullJointId =
      _lookup<b2JointId>('b2_nullJointId');

  b2JointId get b2_nullJointId => _b2_nullJointId.ref;

  /// box2d bases all length units on meters, but you may need different units for your game.
  /// You can adjust this value to use different units, normally at application startup.
  late final ffi.Pointer<ffi.Float> _b2_lengthUnitsPerMeter =
      _lookup<ffi.Float>('b2_lengthUnitsPerMeter');

  double get b2_lengthUnitsPerMeter => _b2_lengthUnitsPerMeter.value;

  set b2_lengthUnitsPerMeter(double value) =>
      _b2_lengthUnitsPerMeter.value = value;

  /// Current version.
  late final ffi.Pointer<b2Version> _b2_version =
      _lookup<b2Version>('b2_version');

  b2Version get b2_version => _b2_version.ref;

  late final ffi.Pointer<b2Filter> _b2_defaultFilter =
      _lookup<b2Filter>('b2_defaultFilter');

  b2Filter get b2_defaultFilter => _b2_defaultFilter.ref;

  /// Create a world for rigid body simulation. This contains all the bodies, shapes, and constraints.
  b2WorldId b2CreateWorld(
    ffi.Pointer<b2WorldDef> def,
  ) {
    return _b2CreateWorld(
      def,
    );
  }

  late final _b2CreateWorldPtr =
      _lookup<ffi.NativeFunction<b2WorldId Function(ffi.Pointer<b2WorldDef>)>>(
          'b2CreateWorld');
  late final _b2CreateWorld = _b2CreateWorldPtr
      .asFunction<b2WorldId Function(ffi.Pointer<b2WorldDef>)>();

  /// Destroy a world.
  void b2DestroyWorld(
    b2WorldId worldId,
  ) {
    return _b2DestroyWorld(
      worldId,
    );
  }

  late final _b2DestroyWorldPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(b2WorldId)>>(
          'b2DestroyWorld');
  late final _b2DestroyWorld =
      _b2DestroyWorldPtr.asFunction<void Function(b2WorldId)>();

  /// Create a rigid body given a definition. No reference to the definition is retained.
  /// @warning This function is locked during callbacks.
  b2BodyId b2World_CreateBody(
    b2WorldId worldId,
    ffi.Pointer<b2BodyDef> def,
  ) {
    return _b2World_CreateBody(
      worldId,
      def,
    );
  }

  late final _b2World_CreateBodyPtr = _lookup<
      ffi.NativeFunction<
          b2BodyId Function(
              b2WorldId, ffi.Pointer<b2BodyDef>)>>('b2World_CreateBody');
  late final _b2World_CreateBody = _b2World_CreateBodyPtr
      .asFunction<b2BodyId Function(b2WorldId, ffi.Pointer<b2BodyDef>)>();

  /// Destroy a rigid body given an id.
  /// @warning This function is locked during callbacks.
  void b2World_DestroyBody(
    b2BodyId bodyId,
  ) {
    return _b2World_DestroyBody(
      bodyId,
    );
  }

  late final _b2World_DestroyBodyPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(b2BodyId)>>(
          'b2World_DestroyBody');
  late final _b2World_DestroyBody =
      _b2World_DestroyBodyPtr.asFunction<void Function(b2BodyId)>();

  /// Take a time step. This performs collision detection, integration,
  /// and constraint solution.
  /// @param timeStep the amount of time to simulate, this should not vary.
  /// @param velocityIterations for the velocity constraint solver.
  /// @param positionIterations for the position constraint solver.
  void b2World_Step(
    b2WorldId worldId,
    double timeStep,
    int velocityIterations,
    int positionIterations,
  ) {
    return _b2World_Step(
      worldId,
      timeStep,
      velocityIterations,
      positionIterations,
    );
  }

  late final _b2World_StepPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              b2WorldId, ffi.Float, ffi.Int32, ffi.Int32)>>('b2World_Step');
  late final _b2World_Step =
      _b2World_StepPtr.asFunction<void Function(b2WorldId, double, int, int)>();

  /// Call this to draw shapes and other debug draw data. This is intentionally non-const.
  void b2World_Draw(
    b2WorldId worldId,
    ffi.Pointer<b2DebugDraw> debugDraw,
  ) {
    return _b2World_Draw(
      worldId,
      debugDraw,
    );
  }

  late final _b2World_DrawPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              b2WorldId, ffi.Pointer<b2DebugDraw>)>>('b2World_Draw');
  late final _b2World_Draw = _b2World_DrawPtr
      .asFunction<void Function(b2WorldId, ffi.Pointer<b2DebugDraw>)>();

  /// Enable/disable sleep.
  void b2World_EnableSleeping(
    b2WorldId worldId,
    bool flag,
  ) {
    return _b2World_EnableSleeping(
      worldId,
      flag,
    );
  }

  late final _b2World_EnableSleepingPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(b2WorldId, ffi.Bool)>>(
          'b2World_EnableSleeping');
  late final _b2World_EnableSleeping =
      _b2World_EnableSleepingPtr.asFunction<void Function(b2WorldId, bool)>();

  /// Get the current profile.
  ffi.Pointer<b2Profile> b2World_GetProfile(
    b2WorldId worldId,
  ) {
    return _b2World_GetProfile(
      worldId,
    );
  }

  late final _b2World_GetProfilePtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<b2Profile> Function(b2WorldId)>>(
          'b2World_GetProfile');
  late final _b2World_GetProfile = _b2World_GetProfilePtr
      .asFunction<ffi.Pointer<b2Profile> Function(b2WorldId)>();

  /// Create a shape and attach it to a body. Contacts are not created until the next time step.
  /// @warning This function is locked during callbacks.
  b2ShapeId b2Body_CreatePolygon(
    b2BodyId bodyId,
    ffi.Pointer<b2ShapeDef> def,
    ffi.Pointer<b2Polygon> polygon,
  ) {
    return _b2Body_CreatePolygon(
      bodyId,
      def,
      polygon,
    );
  }

  late final _b2Body_CreatePolygonPtr = _lookup<
      ffi.NativeFunction<
          b2ShapeId Function(b2BodyId, ffi.Pointer<b2ShapeDef>,
              ffi.Pointer<b2Polygon>)>>('b2Body_CreatePolygon');
  late final _b2Body_CreatePolygon = _b2Body_CreatePolygonPtr.asFunction<
      b2ShapeId Function(
          b2BodyId, ffi.Pointer<b2ShapeDef>, ffi.Pointer<b2Polygon>)>();

  b2Vec2 b2Body_GetPosition(
    b2BodyId bodyId,
  ) {
    return _b2Body_GetPosition(
      bodyId,
    );
  }

  late final _b2Body_GetPositionPtr =
      _lookup<ffi.NativeFunction<b2Vec2 Function(b2BodyId)>>(
          'b2Body_GetPosition');
  late final _b2Body_GetPosition =
      _b2Body_GetPositionPtr.asFunction<b2Vec2 Function(b2BodyId)>();

  double b2Body_GetAngle(
    b2BodyId bodyId,
  ) {
    return _b2Body_GetAngle(
      bodyId,
    );
  }

  late final _b2Body_GetAnglePtr =
      _lookup<ffi.NativeFunction<ffi.Float Function(b2BodyId)>>(
          'b2Body_GetAngle');
  late final _b2Body_GetAngle =
      _b2Body_GetAnglePtr.asFunction<double Function(b2BodyId)>();
}

/// mbstate_t is an opaque object to keep conversion state, during multibyte
/// stream conversions.  The content must not be referenced by user programs.
class __mbstate_t extends ffi.Union {
  @ffi.Array.multi([128])
  external ffi.Array<ffi.Char> __mbstate8;

  /// for alignment
  @ffi.LongLong()
  external int _mbstateL;
}

class __darwin_pthread_handler_rec extends ffi.Struct {
  /// Routine to call
  external ffi
          .Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>
      __routine;

  /// Argument to pass
  external ffi.Pointer<ffi.Void> __arg;

  external ffi.Pointer<__darwin_pthread_handler_rec> __next;
}

class _opaque_pthread_attr_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([56])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_cond_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([40])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_condattr_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([8])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_mutex_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([56])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_mutexattr_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([8])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_once_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([8])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_rwlock_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([192])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_rwlockattr_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([16])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  external ffi.Pointer<__darwin_pthread_handler_rec> __cleanup_stack;

  @ffi.Array.multi([8176])
  external ffi.Array<ffi.Char> __opaque;
}

/// References a world instance
class b2WorldId extends ffi.Struct {
  @ffi.Int16()
  external int index;

  @ffi.Uint16()
  external int revision;
}

/// References a rigid body instance
class b2BodyId extends ffi.Struct {
  @ffi.Int32()
  external int index;

  @ffi.Int16()
  external int world;

  @ffi.Uint16()
  external int revision;
}

/// References a shape instance
class b2ShapeId extends ffi.Struct {
  @ffi.Int32()
  external int index;

  @ffi.Int16()
  external int world;

  @ffi.Uint16()
  external int revision;
}

/// References a joint instance
class b2JointId extends ffi.Struct {
  @ffi.Int32()
  external int index;

  @ffi.Int16()
  external int world;

  @ffi.Uint16()
  external int revision;
}

/// Version numbering scheme.
/// See http://en.wikipedia.org/wiki/Software_versioning
class b2Version extends ffi.Struct {
  @ffi.Int()
  external int major;

  @ffi.Int()
  external int minor;

  @ffi.Int()
  external int revision;
}

/// 2D vector
class b2Vec2 extends ffi.Struct {
  @ffi.Float()
  external double x;

  @ffi.Float()
  external double y;
}

/// 2D rotation
class b2Rot extends ffi.Struct {
  /// Sine and cosine
  @ffi.Float()
  external double s;

  @ffi.Float()
  external double c;
}

/// A 2D rigid transform
class b2Transform extends ffi.Struct {
  external b2Vec2 p;

  external b2Rot q;
}

/// A 2-by-2 Matrix
class b2Mat22 extends ffi.Struct {
  /// columns
  external b2Vec2 cx;

  external b2Vec2 cy;
}

/// This describes the motion of a body/shape for TOI computation. Shapes are defined with respect to the body origin,
/// which may not coincide with the center of mass. However, to support dynamics we must interpolate the center of mass
/// position.
class b2Sweep extends ffi.Struct {
  /// local center of mass position
  external b2Vec2 localCenter;

  /// center world positions
  external b2Vec2 c1;

  external b2Vec2 c2;

  /// world angles
  @ffi.Float()
  external double a1;

  @ffi.Float()
  external double a2;
}

/// Axis-aligned bounding box
class b2AABB extends ffi.Struct {
  external b2Vec2 lowerBound;

  external b2Vec2 upperBound;
}

/// Color for debug drawing. Each value has the range [0,1].
class b2Color extends ffi.Struct {
  @ffi.Float()
  external double r;

  @ffi.Float()
  external double g;

  @ffi.Float()
  external double b;

  @ffi.Float()
  external double a;
}

/// Ray-cast input data. The ray extends from p1 to p1 + maxFraction * (p2 - p1).
class b2RayCastInput extends ffi.Struct {
  external b2Vec2 p1;

  external b2Vec2 p2;

  @ffi.Float()
  external double maxFraction;
}

/// Ray-cast output data. The ray hits at p1 + fraction * (p2 - p1), where p1 and p2 come from b2RayCastInput.
class b2RayCastOutput extends ffi.Struct {
  external b2Vec2 normal;

  @ffi.Float()
  external double fraction;

  @ffi.Bool()
  external bool hit;
}

class b2WorldDef extends ffi.Struct {
  /// Gravity vector. Box2D has no up-vector defined.
  external b2Vec2 gravity;

  /// Restitution velocity threshold, usually in m/s. Collisions above this
  /// speed have restitution applied (will bounce).
  @ffi.Float()
  external double restitutionThreshold;

  /// Can bodies go to sleep to improve performance
  @ffi.Bool()
  external bool enableSleep;

  /// initial capacity for bodies
  @ffi.Int32()
  external int bodyCapacity;

  /// initial capacity for shapes
  @ffi.Int32()
  external int shapeCapacity;
}

/// The body type.
/// static: zero mass, zero velocity, may be manually moved
/// kinematic: zero mass, non-zero velocity set by user, moved by solver
/// dynamic: positive mass, non-zero velocity determined by forces, moved by solver
abstract class b2BodyType {
  static const int b2_staticBody = 0;
  static const int b2_kinematicBody = 1;
  static const int b2_dynamicBody = 2;
  static const int b2_bodyTypeCount = 3;
}

/// A body definition holds all the data needed to construct a rigid body.
/// You can safely re-use body definitions. Shapes are added to a body after construction.
class b2BodyDef extends ffi.Struct {
  /// The body type: static, kinematic, or dynamic.
  /// Note: if a dynamic body would have zero mass, the mass is set to one.
  @ffi.Int32()
  external int type;

  /// The world position of the body. Avoid creating bodies at the origin
  /// since this can lead to many overlapping shapes.
  external b2Vec2 position;

  /// The world angle of the body in radians.
  @ffi.Float()
  external double angle;

  /// The linear velocity of the body's origin in world co-ordinates.
  external b2Vec2 linearVelocity;

  /// The angular velocity of the body.
  @ffi.Float()
  external double angularVelocity;

  /// Linear damping is use to reduce the linear velocity. The damping parameter
  /// can be larger than 1.0f but the damping effect becomes sensitive to the
  /// time step when the damping parameter is large.
  @ffi.Float()
  external double linearDamping;

  /// Angular damping is use to reduce the angular velocity. The damping parameter
  /// can be larger than 1.0f but the damping effect becomes sensitive to the
  /// time step when the damping parameter is large.
  @ffi.Float()
  external double angularDamping;

  /// Scale the gravity applied to this body.
  @ffi.Float()
  external double gravityScale;

  /// Use this to store application specific body data.
  external ffi.Pointer<ffi.Void> userData;

  /// Set this flag to false if this body should never fall asleep. Note that
  /// this increases CPU usage.
  @ffi.Bool()
  external bool enableSleep;

  /// Is this body initially awake or sleeping?
  @ffi.Bool()
  external bool isAwake;

  /// Should this body be prevented from rotating? Useful for characters.
  @ffi.Bool()
  external bool fixedRotation;

  /// Does this body start out enabled?
  @ffi.Bool()
  external bool isEnabled;
}

/// This holds contact filtering data.
class b2Filter extends ffi.Struct {
  /// The collision category bits. Normally you would just set one bit.
  @ffi.Uint32()
  external int categoryBits;

  /// The collision mask bits. This states the categories that this
  /// shape would accept for collision.
  @ffi.Uint32()
  external int maskBits;

  /// Collision groups allow a certain group of objects to never collide (negative)
  /// or always collide (positive). Zero means no collision group. Non-zero group
  /// filtering always wins against the mask bits.
  @ffi.Int32()
  external int groupIndex;
}

/// Used to create a shape
class b2ShapeDef extends ffi.Struct {
  /// Use this to store application specific shape data.
  external ffi.Pointer<ffi.Void> userData;

  /// The friction coefficient, usually in the range [0,1].
  @ffi.Float()
  external double friction;

  /// The restitution (elasticity) usually in the range [0,1].
  @ffi.Float()
  external double restitution;

  /// The density, usually in kg/m^2.
  @ffi.Float()
  external double density;

  /// Contact filtering data.
  external b2Filter filter;

  /// A sensor shape collects contact information but never generates a collision
  /// response.
  @ffi.Bool()
  external bool isSensor;
}

class b2Polygon extends ffi.Opaque {}

class b2DebugDraw extends ffi.Opaque {}

class b2Profile extends ffi.Opaque {}

const int __WORDSIZE = 64;

const int __DARWIN_ONLY_64_BIT_INO_T = 1;

const int __DARWIN_ONLY_UNIX_CONFORMANCE = 1;

const int __DARWIN_ONLY_VERS_1050 = 1;

const int __DARWIN_UNIX03 = 1;

const int __DARWIN_64_BIT_INO_T = 1;

const int __DARWIN_VERS_1050 = 1;

const int __DARWIN_NON_CANCELABLE = 0;

const String __DARWIN_SUF_EXTSN = '\$DARWIN_EXTSN';

const int __DARWIN_C_ANSI = 4096;

const int __DARWIN_C_FULL = 900000;

const int __DARWIN_C_LEVEL = 900000;

const int __STDC_WANT_LIB_EXT1__ = 1;

const int __DARWIN_NO_LONG_LONG = 0;

const int _DARWIN_FEATURE_64_BIT_INODE = 1;

const int _DARWIN_FEATURE_ONLY_64_BIT_INODE = 1;

const int _DARWIN_FEATURE_ONLY_VERS_1050 = 1;

const int _DARWIN_FEATURE_ONLY_UNIX_CONFORMANCE = 1;

const int _DARWIN_FEATURE_UNIX_CONFORMANCE = 3;

const int __has_ptrcheck = 0;

const int __DARWIN_NULL = 0;

const int __PTHREAD_SIZE__ = 8176;

const int __PTHREAD_ATTR_SIZE__ = 56;

const int __PTHREAD_MUTEXATTR_SIZE__ = 8;

const int __PTHREAD_MUTEX_SIZE__ = 56;

const int __PTHREAD_CONDATTR_SIZE__ = 8;

const int __PTHREAD_COND_SIZE__ = 40;

const int __PTHREAD_ONCE_SIZE__ = 8;

const int __PTHREAD_RWLOCK_SIZE__ = 192;

const int __PTHREAD_RWLOCKATTR_SIZE__ = 16;

const int INT8_MAX = 127;

const int INT16_MAX = 32767;

const int INT32_MAX = 2147483647;

const int INT64_MAX = 9223372036854775807;

const int INT8_MIN = -128;

const int INT16_MIN = -32768;

const int INT32_MIN = -2147483648;

const int INT64_MIN = -9223372036854775808;

const int UINT8_MAX = 255;

const int UINT16_MAX = 65535;

const int UINT32_MAX = 4294967295;

const int UINT64_MAX = -1;

const int INT_LEAST8_MIN = -128;

const int INT_LEAST16_MIN = -32768;

const int INT_LEAST32_MIN = -2147483648;

const int INT_LEAST64_MIN = -9223372036854775808;

const int INT_LEAST8_MAX = 127;

const int INT_LEAST16_MAX = 32767;

const int INT_LEAST32_MAX = 2147483647;

const int INT_LEAST64_MAX = 9223372036854775807;

const int UINT_LEAST8_MAX = 255;

const int UINT_LEAST16_MAX = 65535;

const int UINT_LEAST32_MAX = 4294967295;

const int UINT_LEAST64_MAX = -1;

const int INT_FAST8_MIN = -128;

const int INT_FAST16_MIN = -32768;

const int INT_FAST32_MIN = -2147483648;

const int INT_FAST64_MIN = -9223372036854775808;

const int INT_FAST8_MAX = 127;

const int INT_FAST16_MAX = 32767;

const int INT_FAST32_MAX = 2147483647;

const int INT_FAST64_MAX = 9223372036854775807;

const int UINT_FAST8_MAX = 255;

const int UINT_FAST16_MAX = 65535;

const int UINT_FAST32_MAX = 4294967295;

const int UINT_FAST64_MAX = -1;

const int INTPTR_MAX = 9223372036854775807;

const int INTPTR_MIN = -9223372036854775808;

const int UINTPTR_MAX = -1;

const int INTMAX_MAX = 9223372036854775807;

const int UINTMAX_MAX = -1;

const int INTMAX_MIN = -9223372036854775808;

const int PTRDIFF_MIN = -9223372036854775808;

const int PTRDIFF_MAX = 9223372036854775807;

const int SIZE_MAX = -1;

const int RSIZE_MAX = 9223372036854775807;

const int WCHAR_MAX = 2147483647;

const int WCHAR_MIN = -2147483648;

const int WINT_MIN = -2147483648;

const int WINT_MAX = 2147483647;

const int SIG_ATOMIC_MIN = -2147483648;

const int SIG_ATOMIC_MAX = 2147483647;

const double b2_pi = 3.1415927410125732;

const double b2_aabbMultiplier = 4.0;

const double b2_angularSlop = 0.03490658849477768;

const int b2_maxPolygonVertices = 8;

const int b2_maxSubSteps = 8;

const int b2_maxTOIContacts = 32;

const int b2_maxWorlds = 32;

const double b2_maxAngularCorrection = 0.13962635397911072;

const double b2_maxRotation = 1.5707963705062866;

const double b2_maxRotationSquared = 2.4674012660980225;

const double b2_baumgarte = 0.5;

const double b2_toiBaumgarte = 0.75;

const double b2_timeToSleep = 0.5;

const double b2_angularSleepTolerance = 0.03490658849477768;

const int true1 = 1;

const int false1 = 0;

const int __bool_true_false_are_defined = 1;

const int __DARWIN_WCHAR_MAX = 2147483647;

const int __DARWIN_WCHAR_MIN = -2147483648;

const int _FORTIFY_SOURCE = 2;

const int NULL = 0;

const int B2_NULL_INDEX = -1;
