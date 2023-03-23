part of b2;

class FFIWorld implements World {
  FFIWorld({
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
    /// Make a world definition in C memory, and set values
    final worldDefPtr = calloc<b2WorldDef>();
    worldDefPtr.ref.gravity.x = gravityY;
    worldDefPtr.ref.gravity.y = gravityX;
    worldDefPtr.ref.restitutionThreshold = restitutionThreshold;
    worldDefPtr.ref.enableSleep = enableSleep;
    worldDefPtr.ref.bodyCapacity = bodyCapacity;
    worldDefPtr.ref.shapeCapacity = shapeCapacity;
    _worldId = globalBindings.b2CreateWorld(worldDefPtr);
    calloc.free(worldDefPtr);
  }

  final List<b2BodyId> _bodyIds = [];
  late final b2WorldId _worldId;

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
  }) {
    /// Create a b2BodyDef in C memory
    final bodyDefPtr = calloc<b2BodyDef>();

    /// Define the values for the b2Body we want
    bodyDefPtr.ref.type = type.index;
    bodyDefPtr.ref.position.x = xPosition;
    bodyDefPtr.ref.position.y = yPosition;
    bodyDefPtr.ref.angle = angle;
    bodyDefPtr.ref.linearVelocity.x = linearVelocityX;
    bodyDefPtr.ref.linearVelocity.y = linearVelocityY;
    bodyDefPtr.ref.angularVelocity = angularVelocity;
    bodyDefPtr.ref.linearDamping = linearDamping;
    bodyDefPtr.ref.angularDamping = angularDamping;
    bodyDefPtr.ref.gravityScale = gravityScale;
    bodyDefPtr.ref.userData = nullptr;
    bodyDefPtr.ref.enableSleep = enableSleep;
    bodyDefPtr.ref.isAwake = isAwake;
    bodyDefPtr.ref.fixedRotation = fixedRotation;
    bodyDefPtr.ref.isEnabled = isEnabled;

    // Call the body factory which allocates memory for the body
    // from a pool and creates the box shape (also from a pool).
    // The body is also added to the world.
    b2BodyId bodyId = globalBindings.b2World_CreateBody(_worldId, bodyDefPtr);

    /// Free memory for the definition as we won't use it again.
    calloc.free(bodyDefPtr);

    /// We keep track of bodies in the world with a list member
    _bodyIds.add(bodyId);

    return FFIBody._(bodyId);
  }

  enableSleeping(bool flag) {
    globalBindings.b2World_EnableSleeping(_worldId, flag);
  }
}

// class Vec2 {
//   Vec2(double x, double y) : _nativeB2Vec2 = malloc<b2Vec2>() {
//     _nativeB2Vec2.ref.x = x;
//     _nativeB2Vec2.ref.y = y;
//   }

//   Vec2._(this._nativeB2Vec2);

//   final Pointer<b2Vec2> _nativeB2Vec2;

//   void dispose() {
//     calloc.free(_nativeB2Vec2);
//   }
// }
