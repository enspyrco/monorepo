part of b2;

class _FFIWorld implements World {
  _FFIWorld(
    double gravityX,
    double gravityY,
    double restitutionThreshold,
    bool enableSleep,
    int bodyCapacity,
    int shapeCapacity,
  ) {
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

  // Typically we use a time step of 1/60 of a second (60Hz) and 10 iterations.
  // This provides a high quality simulation in most game scenarios.
  final double _timeStep = 1.0 / 60.0;
  final int _velocityIterations = 6;
  final int _positionIterations = 2;

  @override
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

  @override
  enableSleeping(bool flag) {
    globalBindings.b2World_EnableSleeping(_worldId, flag);
  }

  @override
  void step() {
    // Instruct the world to perform a single step of simulation.
    // It is generally best to keep the time step and iterations fixed.
    globalBindings.b2World_Step(
        _worldId, _timeStep, _velocityIterations, _positionIterations);
  }

  @override
  void destroy() {
    globalBindings.b2DestroyWorld(_worldId);
  }
}
