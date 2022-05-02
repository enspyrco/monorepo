import 'b2_enums.dart';

abstract class B2ShapePlatform {
  B2ShapeType getType();
  int getChildCount();
  bool testPoint(covariant B2TransformPlatform xf, covariant B2Vec2Platform p);
  bool rayCast(
      covariant B2RayCastOutputPlatform output,
      covariant B2RayCastInputPlatform input,
      covariant B2TransformPlatform transform,
      int childIndex);
  void computeAABB(covariant B2AABBPlatform aabb,
      covariant B2TransformPlatform xf, int childIndex);
  void computeMass(covariant B2MassDataPlatform massData, double density);
  B2ShapeType get_m_type();
  void set_m_type(B2ShapeType arg0);
  double get_m_radius();
  void set_m_radius(double arg0);
  void dispose();
}

abstract class B2JointDefPlatform {
  B2JointDefPlatform();

  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2JointPlatform {
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dump();
}

abstract class VoidPtrPlatform {
  void dispose();
}

abstract class B2ContactPlatform {
  B2ManifoldPlatform getManifold();
  void getWorldManifold(covariant B2WorldManifoldPlatform manifold);
  bool isTouching();
  void setEnabled(bool flag);
  bool isEnabled();
  B2ContactPlatform getNext();
  B2FixturePlatform getFixtureA();
  int getChildIndexA();
  B2FixturePlatform getFixtureB();
  int getChildIndexB();
  void setFriction(double friction);
  double getFriction();
  void resetFriction();
  void setRestitution(double restitution);
  double getRestitution();
  void resetRestitution();
  void setRestitutionThreshold(double threshold);
  double getRestitutionThreshold();
  void resetRestitutionThreshold();
  void setTangentSpeed(double speed);
  double getTangentSpeed();
}

abstract class B2ContactListenerPlatform {
  void dispose();
}

abstract class JSContactListenerPlatform {
  JSContactListenerPlatform();

  void beginContact(covariant B2ContactPlatform contact);
  void endContact(covariant B2ContactPlatform contact);
  void preSolve(covariant B2ContactPlatform contact,
      covariant B2ManifoldPlatform oldManifold);
  void postSolve(covariant B2ContactPlatform contact,
      covariant B2ContactImpulsePlatform impulse);
  void dispose();
}

abstract class B2WorldPlatform {
  B2WorldPlatform.from1(B2Vec2Platform gravity);

  //void setDestructionListener(covariant B2DestructionListenerPlatform listener);
  //void setContactFilter(covariant JSContactFilterPlatform filter);
  //void setContactListener(covariant JSContactListenerPlatform listener);
  //void setDebugDraw(covariant B2DrawPlatform debugDraw);
  B2BodyPlatform createBody(covariant B2BodyDefPlatform def);
  void destroyBody(covariant B2BodyPlatform body);
  B2JointPlatform createJoint(covariant B2JointDefPlatform def);
  void destroyJoint(covariant B2JointPlatform joint);
  void step(double timeStep, int velocityIterations, int positionIterations);
  void clearForces();
  void debugDraw();
  //void queryAABB(covariant B2QueryCallbackPlatform callback, covariant B2AABBPlatform aabb);
  //void rayCast(covariant B2RayCastCallbackPlatform callback, covariant B2Vec2Platform point1, covariant B2Vec2Platform point2);
  B2BodyPlatform getBodyList();
  B2JointPlatform getJointList();
  B2ContactPlatform getContactList();
  void setAllowSleeping(bool flag);
  bool getAllowSleeping();
  void setWarmStarting(bool flag);
  bool getWarmStarting();
  void setContinuousPhysics(bool flag);
  bool getContinuousPhysics();
  void setSubStepping(bool flag);
  bool getSubStepping();
  int getProxyCount();
  int getBodyCount();
  int getJointCount();
  int getContactCount();
  int getTreeHeight();
  int getTreeBalance();
  double getTreeQuality();
  void setGravity(covariant B2Vec2Platform gravity);
  B2Vec2Platform getGravity();
  bool isLocked();
  void setAutoClearForces(bool flag);
  bool getAutoClearForces();
  B2ProfilePlatform getProfile();
  void dump();
  void dispose();
}

abstract class B2FixtureUserDataPlatform {
  int get_pointer();
  void set_pointer(int arg0);
  void dispose();
}

abstract class B2FixtureDefPlatform {
  B2FixtureDefPlatform();

  B2ShapePlatform get_shape();
  void set_shape(covariant B2ShapePlatform arg0);
  B2FixtureUserDataPlatform get_userData();
  void set_userData(covariant B2FixtureUserDataPlatform arg0);
  double get_friction();
  void set_friction(double arg0);
  double get_restitution();
  void set_restitution(double arg0);
  double get_restitutionThreshold();
  void set_restitutionThreshold(double arg0);
  double get_density();
  void set_density(double arg0);
  bool get_isSensor();
  void set_isSensor(bool arg0);
  B2FilterPlatform get_filter();
  void set_filter(covariant B2FilterPlatform arg0);
  void dispose();
}

abstract class B2FixturePlatform {
  B2ShapeType getType();
  B2ShapePlatform getShape();
  void setSensor(bool sensor);
  bool isSensor();
  void setFilterData(covariant B2FilterPlatform filter);
  B2FilterPlatform getFilterData();
  void refilter();
  B2BodyPlatform getBody();
  B2FixturePlatform getNext();
  B2FixtureUserDataPlatform getUserData();
  bool testPoint(covariant B2Vec2Platform p);
  bool rayCast(covariant B2RayCastOutputPlatform output,
      covariant B2RayCastInputPlatform input, int childIndex);
  void getMassData(covariant B2MassDataPlatform massData);
  void setDensity(double density);
  double getDensity();
  double getFriction();
  void setFriction(double friction);
  double getRestitution();
  void setRestitution(double restitution);
  double getRestitutionThreshold();
  void setRestitutionThreshold(double threshold);
  B2AABBPlatform getAABB(int childIndex);
  void dump(int bodyIndex);
  void dispose();
}

abstract class B2TransformPlatform {
  B2TransformPlatform();

  B2TransformPlatform.from2(B2Vec2Platform position, B2RotPlatform rotation);

  void setIdentity();
  void set(covariant B2Vec2Platform position, double angle);
  B2Vec2Platform get_p();
  void set_p(covariant B2Vec2Platform arg0);
  B2RotPlatform get_q();
  void set_q(covariant B2RotPlatform arg0);
  void dispose();
}

abstract class B2RayCastCallbackPlatform {
  void dispose();
}

abstract class JSRayCastCallbackPlatform {
  JSRayCastCallbackPlatform();

  double reportFixture(
      covariant B2FixturePlatform fixture,
      covariant B2Vec2Platform point,
      covariant B2Vec2Platform normal,
      double fraction);
  void dispose();
}

abstract class B2QueryCallbackPlatform {
  void dispose();
}

abstract class JSQueryCallbackPlatform {
  JSQueryCallbackPlatform();

  bool reportFixture(covariant B2FixturePlatform fixture);
  void dispose();
}

abstract class B2MassDataPlatform {
  B2MassDataPlatform();

  double get_mass();
  void set_mass(double arg0);
  B2Vec2Platform get_center();
  void set_center(covariant B2Vec2Platform arg0);
  double get_I();
  void set_I(double arg0);
  void dispose();
}

abstract class B2Vec2Platform {
  B2Vec2Platform();

  B2Vec2Platform.from2(double x, double y);

  void setZero();
  void set(double x, double y);
  void op_add(covariant B2Vec2Platform v);
  void op_sub(covariant B2Vec2Platform v);
  void op_mul(double s);
  double length();
  double lengthSquared();
  double normalize();
  bool isValid();
  B2Vec2Platform skew();
  double get_x();
  void set_x(double arg0);
  double get_y();
  void set_y(double arg0);
  void dispose();
}

abstract class B2Vec3Platform {
  B2Vec3Platform();

  B2Vec3Platform.from3(double x, double y, double z);

  void setZero();
  void set(double x, double y, double z);
  void op_add(covariant B2Vec3Platform v);
  void op_sub(covariant B2Vec3Platform v);
  void op_mul(double s);
  double get_x();
  void set_x(double arg0);
  double get_y();
  void set_y(double arg0);
  double get_z();
  void set_z(double arg0);
  void dispose();
}

abstract class B2BodyUserDataPlatform {
  int get_pointer();
  void set_pointer(int arg0);
  void dispose();
}

abstract class B2BodyPlatform {
  B2FixturePlatform createFixture1(covariant B2FixtureDefPlatform shape);
  B2FixturePlatform createFixture2(
      covariant B2ShapePlatform shape, double density);
  void destroyFixture(covariant B2FixturePlatform fixture);
  void setTransform(covariant B2Vec2Platform position, double angle);
  B2TransformPlatform getTransform();
  B2Vec2Platform getPosition();
  double getAngle();
  B2Vec2Platform getWorldCenter();
  B2Vec2Platform getLocalCenter();
  void setLinearVelocity(covariant B2Vec2Platform v);
  B2Vec2Platform getLinearVelocity();
  void setAngularVelocity(double omega);
  double getAngularVelocity();
  void applyForce(covariant B2Vec2Platform force,
      covariant B2Vec2Platform point, bool wake);
  void applyForceToCenter(covariant B2Vec2Platform force, bool wake);
  void applyTorque(double torque, bool awake);
  void applyLinearImpulse(covariant B2Vec2Platform impulse,
      covariant B2Vec2Platform point, bool wake);
  void applyLinearImpulseToCenter(covariant B2Vec2Platform impulse, bool wake);
  void applyAngularImpulse(double impulse, bool wake);
  double getMass();
  double getInertia();
  void getMassData(covariant B2MassDataPlatform data);
  void setMassData(covariant B2MassDataPlatform data);
  void resetMassData();
  B2Vec2Platform getWorldPoint(covariant B2Vec2Platform localPoint);
  B2Vec2Platform getWorldVector(covariant B2Vec2Platform localVector);
  B2Vec2Platform getLocalPoint(covariant B2Vec2Platform worldPoint);
  B2Vec2Platform getLocalVector(covariant B2Vec2Platform worldVector);
  B2Vec2Platform getLinearVelocityFromWorldPoint(
      covariant B2Vec2Platform worldPoint);
  B2Vec2Platform getLinearVelocityFromLocalPoint(
      covariant B2Vec2Platform localPoint);
  double getLinearDamping();
  void setLinearDamping(double linearDamping);
  double getAngularDamping();
  void setAngularDamping(double angularDamping);
  double getGravityScale();
  void setGravityScale(double scale);
  void setType(B2BodyType type);
  B2BodyType getType();
  void setBullet(bool flag);
  bool isBullet();
  void setSleepingAllowed(bool flag);
  bool isSleepingAllowed();
  void setAwake(bool flag);
  bool isAwake();
  void setEnabled(bool flag);
  bool isEnabled();
  void setFixedRotation(bool flag);
  bool isFixedRotation();
  B2FixturePlatform getFixtureList();
  B2JointEdgePlatform getJointList();
  B2ContactEdgePlatform getContactList();
  B2BodyPlatform getNext();
  B2BodyUserDataPlatform getUserData();
  B2WorldPlatform getWorld();
  void dump();
}

abstract class B2BodyDefPlatform {
  B2BodyDefPlatform();

  B2BodyType get_type();
  void set_type(B2BodyType arg0);
  B2Vec2Platform get_position();
  void set_position(covariant B2Vec2Platform arg0);
  double get_angle();
  void set_angle(double arg0);
  B2Vec2Platform get_linearVelocity();
  void set_linearVelocity(covariant B2Vec2Platform arg0);
  double get_angularVelocity();
  void set_angularVelocity(double arg0);
  double get_linearDamping();
  void set_linearDamping(double arg0);
  double get_angularDamping();
  void set_angularDamping(double arg0);
  bool get_allowSleep();
  void set_allowSleep(bool arg0);
  bool get_awake();
  void set_awake(bool arg0);
  bool get_fixedRotation();
  void set_fixedRotation(bool arg0);
  bool get_bullet();
  void set_bullet(bool arg0);
  bool get_enabled();
  void set_enabled(bool arg0);
  B2BodyUserDataPlatform get_userData();
  void set_userData(covariant B2BodyUserDataPlatform arg0);
  double get_gravityScale();
  void set_gravityScale(double arg0);
  void dispose();
}

abstract class B2FilterPlatform {
  B2FilterPlatform();

  int get_categoryBits();
  void set_categoryBits(int arg0);
  int get_maskBits();
  void set_maskBits(int arg0);
  int get_groupIndex();
  void set_groupIndex(int arg0);
  void dispose();
}

abstract class B2AABBPlatform {
  B2AABBPlatform();

  bool isValid();
  B2Vec2Platform getCenter();
  B2Vec2Platform getExtents();
  double getPerimeter();
  void combine1(covariant B2AABBPlatform aabb1);
  void combine2(covariant B2AABBPlatform aabb1, covariant B2AABBPlatform aabb2);
  bool contains(covariant B2AABBPlatform aabb);
  bool rayCast(covariant B2RayCastOutputPlatform output,
      covariant B2RayCastInputPlatform input);
  B2Vec2Platform get_lowerBound();
  void set_lowerBound(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_upperBound();
  void set_upperBound(covariant B2Vec2Platform arg0);
  void dispose();
}

abstract class B2CircleShapePlatform implements B2ShapePlatform {
  B2CircleShapePlatform();

  B2ShapeType getType();
  int getChildCount();
  bool testPoint(covariant B2TransformPlatform xf, covariant B2Vec2Platform p);
  bool rayCast(
      covariant B2RayCastOutputPlatform output,
      covariant B2RayCastInputPlatform input,
      covariant B2TransformPlatform transform,
      int childIndex);
  void computeAABB(covariant B2AABBPlatform aabb,
      covariant B2TransformPlatform xf, int childIndex);
  void computeMass(covariant B2MassDataPlatform massData, double density);
  B2Vec2Platform get_m_p();
  void set_m_p(covariant B2Vec2Platform arg0);
  B2ShapeType get_m_type();
  void set_m_type(B2ShapeType arg0);
  double get_m_radius();
  void set_m_radius(double arg0);
  void dispose();
}

abstract class B2EdgeShapePlatform implements B2ShapePlatform {
  B2EdgeShapePlatform();

  void setOneSided(covariant B2Vec2Platform v0, covariant B2Vec2Platform v1,
      covariant B2Vec2Platform v2, covariant B2Vec2Platform v3);
  void setTwoSided(covariant B2Vec2Platform v1, covariant B2Vec2Platform v2);
  B2ShapeType getType();
  int getChildCount();
  bool testPoint(covariant B2TransformPlatform xf, covariant B2Vec2Platform p);
  bool rayCast(
      covariant B2RayCastOutputPlatform output,
      covariant B2RayCastInputPlatform input,
      covariant B2TransformPlatform transform,
      int childIndex);
  void computeAABB(covariant B2AABBPlatform aabb,
      covariant B2TransformPlatform xf, int childIndex);
  void computeMass(covariant B2MassDataPlatform massData, double density);
  B2Vec2Platform get_m_vertex1();
  void set_m_vertex1(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_m_vertex2();
  void set_m_vertex2(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_m_vertex0();
  void set_m_vertex0(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_m_vertex3();
  void set_m_vertex3(covariant B2Vec2Platform arg0);
  bool get_m_oneSided();
  void set_m_oneSided(bool arg0);
  B2ShapeType get_m_type();
  void set_m_type(B2ShapeType arg0);
  double get_m_radius();
  void set_m_radius(double arg0);
  void dispose();
}

abstract class B2JointUserDataPlatform {
  int get_pointer();
  void set_pointer(int arg0);
  void dispose();
}

abstract class B2WeldJointPlatform implements B2JointPlatform {
  B2Vec2Platform getLocalAnchorA();
  B2Vec2Platform getLocalAnchorB();
  double getReferenceAngle();
  void setStiffness(double stiffness);
  double getStiffness();
  void setDamping(double damping);
  double getDamping();
  void dump();
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dispose();
}

abstract class B2WeldJointDefPlatform implements B2JointDefPlatform {
  B2WeldJointDefPlatform();

  void initialize(covariant B2BodyPlatform bodyA,
      covariant B2BodyPlatform bodyB, covariant B2Vec2Platform anchor);
  B2Vec2Platform get_localAnchorA();
  void set_localAnchorA(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localAnchorB();
  void set_localAnchorB(covariant B2Vec2Platform arg0);
  double get_referenceAngle();
  void set_referenceAngle(double arg0);
  double get_stiffness();
  void set_stiffness(double arg0);
  double get_damping();
  void set_damping(double arg0);
  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2ChainShapePlatform implements B2ShapePlatform {
  B2ChainShapePlatform();

  void clear();
  void createLoop(covariant B2Vec2Platform vertices, int count);
  void createChain(covariant B2Vec2Platform vertices, int count,
      covariant B2Vec2Platform prevVertex, covariant B2Vec2Platform nextVertex);
  void getChildEdge(covariant B2EdgeShapePlatform edge, int index);
  B2ShapeType getType();
  int getChildCount();
  bool testPoint(covariant B2TransformPlatform xf, covariant B2Vec2Platform p);
  bool rayCast(
      covariant B2RayCastOutputPlatform output,
      covariant B2RayCastInputPlatform input,
      covariant B2TransformPlatform transform,
      int childIndex);
  void computeAABB(covariant B2AABBPlatform aabb,
      covariant B2TransformPlatform xf, int childIndex);
  void computeMass(covariant B2MassDataPlatform massData, double density);
  B2Vec2Platform get_m_vertices();
  void set_m_vertices(covariant B2Vec2Platform arg0);
  int get_m_count();
  void set_m_count(int arg0);
  B2Vec2Platform get_m_prevVertex();
  void set_m_prevVertex(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_m_nextVertex();
  void set_m_nextVertex(covariant B2Vec2Platform arg0);
  B2ShapeType get_m_type();
  void set_m_type(B2ShapeType arg0);
  double get_m_radius();
  void set_m_radius(double arg0);
  void dispose();
}

abstract class B2ColorPlatform {
  B2ColorPlatform();

  B2ColorPlatform.from3(double r, double g, double b);

  void set(double ri, double gi, double bi);
  double get_r();
  void set_r(double arg0);
  double get_g();
  void set_g(double arg0);
  double get_b();
  void set_b(double arg0);
  void dispose();
}

abstract class B2ContactEdgePlatform {
  B2ContactEdgePlatform();

  B2BodyPlatform get_other();
  void set_other(covariant B2BodyPlatform arg0);
  B2ContactPlatform get_contact();
  void set_contact(covariant B2ContactPlatform arg0);
  B2ContactEdgePlatform get_prev();
  void set_prev(covariant B2ContactEdgePlatform arg0);
  B2ContactEdgePlatform get_next();
  void set_next(covariant B2ContactEdgePlatform arg0);
  void dispose();
}

abstract class B2ContactFeaturePlatform {
  int get_indexA();
  void set_indexA(int arg0);
  int get_indexB();
  void set_indexB(int arg0);
  int get_typeA();
  void set_typeA(int arg0);
  int get_typeB();
  void set_typeB(int arg0);
  void dispose();
}

abstract class B2ContactFilterPlatform {
  void dispose();
}

abstract class JSContactFilterPlatform {
  JSContactFilterPlatform();

  bool shouldCollide(covariant B2FixturePlatform fixtureA,
      covariant B2FixturePlatform fixtureB);
  void dispose();
}

abstract class B2ContactIDPlatform {
  B2ContactFeaturePlatform get_cf();
  void set_cf(covariant B2ContactFeaturePlatform arg0);
  int get_key();
  void set_key(int arg0);
  void dispose();
}

abstract class B2ContactImpulsePlatform {
  double get_normalImpulses(int arg0);
  void set_normalImpulses(int arg0, double arg1);
  double get_tangentImpulses(int arg0);
  void set_tangentImpulses(int arg0, double arg1);
  int get_count();
  void set_count(int arg0);
  void dispose();
}

abstract class B2DestructionListenerPlatform {
  void dispose();
}

abstract class B2DestructionListenerWrapperPlatform {
  void dispose();
}

abstract class JSDestructionListenerPlatform {
  JSDestructionListenerPlatform();

  void sayGoodbyeJoint(covariant B2JointPlatform joint);
  void sayGoodbyeFixture(covariant B2FixturePlatform joint);
  void dispose();
}

abstract class B2DistanceJointPlatform implements B2JointPlatform {
  B2Vec2Platform getLocalAnchorA();
  B2Vec2Platform getLocalAnchorB();
  double getLength();
  void setLength(double length);
  double getMinLength();
  void setMinLength(double minLength);
  double getMaxLength();
  void setMaxLength(double maxLength);
  double getCurrentLength();
  void setStiffness(double stiffness);
  double getStiffness();
  void setDamping(double damping);
  double getDamping();
  void dump();
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dispose();
}

abstract class B2DistanceJointDefPlatform implements B2JointDefPlatform {
  B2DistanceJointDefPlatform();

  void initialize(
      covariant B2BodyPlatform bodyA,
      covariant B2BodyPlatform bodyB,
      covariant B2Vec2Platform anchorA,
      covariant B2Vec2Platform anchorB);
  B2Vec2Platform get_localAnchorA();
  void set_localAnchorA(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localAnchorB();
  void set_localAnchorB(covariant B2Vec2Platform arg0);
  double get_length();
  void set_length(double arg0);
  double get_minLength();
  void set_minLength(double arg0);
  double get_maxLength();
  void set_maxLength(double arg0);
  double get_stiffness();
  void set_stiffness(double arg0);
  double get_damping();
  void set_damping(double arg0);
  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2DrawPlatform {
  void setFlags(int flags);
  int getFlags();
  void appendFlags(int flags);
  void clearFlags(int flags);
  void dispose();
}

abstract class JSDrawPlatform {
  JSDrawPlatform();

  void drawPolygon(covariant B2Vec2Platform vertices, int vertexCount,
      covariant B2ColorPlatform color);
  void drawSolidPolygon(covariant B2Vec2Platform vertices, int vertexCount,
      covariant B2ColorPlatform color);
  void drawCircle(covariant B2Vec2Platform center, double radius,
      covariant B2ColorPlatform color);
  void drawSolidCircle(covariant B2Vec2Platform center, double radius,
      covariant B2Vec2Platform axis, covariant B2ColorPlatform color);
  void drawSegment(covariant B2Vec2Platform p1, covariant B2Vec2Platform p2,
      covariant B2ColorPlatform color);
  void drawTransform(covariant B2TransformPlatform xf);
  void drawPoint(
      covariant B2Vec2Platform p, double size, covariant B2ColorPlatform color);
  void dispose();
}

abstract class B2FrictionJointPlatform implements B2JointPlatform {
  B2Vec2Platform getLocalAnchorA();
  B2Vec2Platform getLocalAnchorB();
  void setMaxForce(double force);
  double getMaxForce();
  void setMaxTorque(double torque);
  double getMaxTorque();
  void dump();
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dispose();
}

abstract class B2FrictionJointDefPlatform implements B2JointDefPlatform {
  B2FrictionJointDefPlatform();

  void initialize(covariant B2BodyPlatform bodyA,
      covariant B2BodyPlatform bodyB, covariant B2Vec2Platform anchor);
  B2Vec2Platform get_localAnchorA();
  void set_localAnchorA(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localAnchorB();
  void set_localAnchorB(covariant B2Vec2Platform arg0);
  double get_maxForce();
  void set_maxForce(double arg0);
  double get_maxTorque();
  void set_maxTorque(double arg0);
  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2GearJointPlatform implements B2JointPlatform {
  B2JointPlatform getJoint1();
  B2JointPlatform getJoint2();
  void setRatio(double ratio);
  double getRatio();
  void dump();
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dispose();
}

abstract class B2GearJointDefPlatform implements B2JointDefPlatform {
  B2GearJointDefPlatform();

  B2JointPlatform get_joint1();
  void set_joint1(covariant B2JointPlatform arg0);
  B2JointPlatform get_joint2();
  void set_joint2(covariant B2JointPlatform arg0);
  double get_ratio();
  void set_ratio(double arg0);
  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2JointEdgePlatform {
  B2JointEdgePlatform();

  B2BodyPlatform get_other();
  void set_other(covariant B2BodyPlatform arg0);
  B2JointPlatform get_joint();
  void set_joint(covariant B2JointPlatform arg0);
  B2JointEdgePlatform get_prev();
  void set_prev(covariant B2JointEdgePlatform arg0);
  B2JointEdgePlatform get_next();
  void set_next(covariant B2JointEdgePlatform arg0);
  void dispose();
}

abstract class B2ManifoldPlatform {
  B2ManifoldPlatform();

  B2ManifoldPointPlatform get_points(int arg0);
  void set_points(int arg0, covariant B2ManifoldPointPlatform arg1);
  B2Vec2Platform get_localNormal();
  void set_localNormal(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localPoint();
  void set_localPoint(covariant B2Vec2Platform arg0);
  B2ManifoldType get_type();
  void set_type(B2ManifoldType arg0);
  int get_pointCount();
  void set_pointCount(int arg0);
  void dispose();
}

abstract class B2WorldManifoldPlatform {
  B2WorldManifoldPlatform();

  void initialize(
      covariant B2ManifoldPlatform manifold,
      covariant B2TransformPlatform xfA,
      double radiusA,
      covariant B2TransformPlatform xfB,
      double radiusB);
  B2Vec2Platform get_normal();
  void set_normal(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_points(int arg0);
  void set_points(int arg0, covariant B2Vec2Platform arg1);
  double get_separations(int arg0);
  void set_separations(int arg0, double arg1);
  void dispose();
}

abstract class B2ManifoldPointPlatform {
  B2ManifoldPointPlatform();

  B2Vec2Platform get_localPoint();
  void set_localPoint(covariant B2Vec2Platform arg0);
  double get_normalImpulse();
  void set_normalImpulse(double arg0);
  double get_tangentImpulse();
  void set_tangentImpulse(double arg0);
  B2ContactIDPlatform get_id();
  void set_id(covariant B2ContactIDPlatform arg0);
  void dispose();
}

abstract class B2Mat22Platform {
  B2Mat22Platform();

  B2Mat22Platform.from2(B2Vec2Platform a11, B2Vec2Platform a12);

  B2Mat22Platform.from4(double a11, double a12, double a21, double a22);

  void set(covariant B2Vec2Platform c1, covariant B2Vec2Platform c2);
  void setIdentity();
  void setZero();
  B2Mat22Platform getInverse();
  B2Vec2Platform solve(covariant B2Vec2Platform b);
  B2Vec2Platform get_ex();
  void set_ex(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_ey();
  void set_ey(covariant B2Vec2Platform arg0);
  void dispose();
}

abstract class B2Mat33Platform {
  B2Mat33Platform();

  B2Mat33Platform.from3(
      B2Vec3Platform c1, B2Vec3Platform c2, B2Vec3Platform c3);

  void setZero();
  B2Vec3Platform solve33(covariant B2Vec3Platform b);
  B2Vec2Platform solve22(covariant B2Vec2Platform b);
  void getInverse22(covariant B2Mat33Platform M);
  void getSymInverse33(covariant B2Mat33Platform M);
  B2Vec3Platform get_ex();
  void set_ex(covariant B2Vec3Platform arg0);
  B2Vec3Platform get_ey();
  void set_ey(covariant B2Vec3Platform arg0);
  B2Vec3Platform get_ez();
  void set_ez(covariant B2Vec3Platform arg0);
  void dispose();
}

abstract class B2MouseJointPlatform implements B2JointPlatform {
  void setTarget(covariant B2Vec2Platform target);
  B2Vec2Platform getTarget();
  void setMaxForce(double force);
  double getMaxForce();
  void setStiffness(double stiffness);
  double getStiffness();
  void setDamping(double damping);
  double getDamping();
  void dump();
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dispose();
}

abstract class B2MouseJointDefPlatform implements B2JointDefPlatform {
  B2MouseJointDefPlatform();

  B2Vec2Platform get_target();
  void set_target(covariant B2Vec2Platform arg0);
  double get_maxForce();
  void set_maxForce(double arg0);
  double get_stiffness();
  void set_stiffness(double arg0);
  double get_damping();
  void set_damping(double arg0);
  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2PolygonShapePlatform implements B2ShapePlatform {
  B2PolygonShapePlatform();

  void set(covariant B2Vec2Platform vertices, int vertexCount);
  void setAsBox2(double hx, double hy);
  void setAsBox4(
      double hx, double hy, covariant B2Vec2Platform center, double angle);
  B2ShapeType getType();
  int getChildCount();
  bool testPoint(covariant B2TransformPlatform xf, covariant B2Vec2Platform p);
  bool rayCast(
      covariant B2RayCastOutputPlatform output,
      covariant B2RayCastInputPlatform input,
      covariant B2TransformPlatform transform,
      int childIndex);
  void computeAABB(covariant B2AABBPlatform aabb,
      covariant B2TransformPlatform xf, int childIndex);
  void computeMass(covariant B2MassDataPlatform massData, double density);
  B2Vec2Platform get_m_centroid();
  void set_m_centroid(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_m_vertices(int arg0);
  void set_m_vertices(int arg0, covariant B2Vec2Platform arg1);
  B2Vec2Platform get_m_normals(int arg0);
  void set_m_normals(int arg0, covariant B2Vec2Platform arg1);
  int get_m_count();
  void set_m_count(int arg0);
  B2ShapeType get_m_type();
  void set_m_type(B2ShapeType arg0);
  double get_m_radius();
  void set_m_radius(double arg0);
  void dispose();
}

abstract class B2PrismaticJointPlatform implements B2JointPlatform {
  B2Vec2Platform getLocalAnchorA();
  B2Vec2Platform getLocalAnchorB();
  B2Vec2Platform getLocalAxisA();
  double getReferenceAngle();
  double getJointTranslation();
  double getJointSpeed();
  bool isLimitEnabled();
  void enableLimit(bool flag);
  double getLowerLimit();
  double getUpperLimit();
  void setLimits(double lower, double upper);
  bool isMotorEnabled();
  void enableMotor(bool flag);
  void setMotorSpeed(double speed);
  double getMotorSpeed();
  void setMaxMotorForce(double force);
  double getMaxMotorForce();
  double getMotorForce(double inv_dt);
  void dump();
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dispose();
}

abstract class B2PrismaticJointDefPlatform implements B2JointDefPlatform {
  B2PrismaticJointDefPlatform();

  void initialize(
      covariant B2BodyPlatform bodyA,
      covariant B2BodyPlatform bodyB,
      covariant B2Vec2Platform anchor,
      covariant B2Vec2Platform axis);
  B2Vec2Platform get_localAnchorA();
  void set_localAnchorA(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localAnchorB();
  void set_localAnchorB(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localAxisA();
  void set_localAxisA(covariant B2Vec2Platform arg0);
  double get_referenceAngle();
  void set_referenceAngle(double arg0);
  bool get_enableLimit();
  void set_enableLimit(bool arg0);
  double get_lowerTranslation();
  void set_lowerTranslation(double arg0);
  double get_upperTranslation();
  void set_upperTranslation(double arg0);
  bool get_enableMotor();
  void set_enableMotor(bool arg0);
  double get_maxMotorForce();
  void set_maxMotorForce(double arg0);
  double get_motorSpeed();
  void set_motorSpeed(double arg0);
  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2ProfilePlatform {
  double get_step();
  void set_step(double arg0);
  double get_collide();
  void set_collide(double arg0);
  double get_solve();
  void set_solve(double arg0);
  double get_solveInit();
  void set_solveInit(double arg0);
  double get_solveVelocity();
  void set_solveVelocity(double arg0);
  double get_solvePosition();
  void set_solvePosition(double arg0);
  double get_broadphase();
  void set_broadphase(double arg0);
  double get_solveTOI();
  void set_solveTOI(double arg0);
  void dispose();
}

abstract class B2PulleyJointPlatform implements B2JointPlatform {
  B2Vec2Platform getGroundAnchorA();
  B2Vec2Platform getGroundAnchorB();
  double getLengthA();
  double getLengthB();
  double getRatio();
  double getCurrentLengthA();
  double getCurrentLengthB();
  void dump();
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dispose();
}

abstract class B2PulleyJointDefPlatform implements B2JointDefPlatform {
  B2PulleyJointDefPlatform();

  void initialize(
      covariant B2BodyPlatform bodyA,
      covariant B2BodyPlatform bodyB,
      covariant B2Vec2Platform groundAnchorA,
      covariant B2Vec2Platform groundAnchorB,
      covariant B2Vec2Platform anchorA,
      covariant B2Vec2Platform anchorB,
      double ratio);
  B2Vec2Platform get_groundAnchorA();
  void set_groundAnchorA(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_groundAnchorB();
  void set_groundAnchorB(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localAnchorA();
  void set_localAnchorA(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localAnchorB();
  void set_localAnchorB(covariant B2Vec2Platform arg0);
  double get_lengthA();
  void set_lengthA(double arg0);
  double get_lengthB();
  void set_lengthB(double arg0);
  double get_ratio();
  void set_ratio(double arg0);
  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2RayCastInputPlatform {
  B2Vec2Platform get_p1();
  void set_p1(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_p2();
  void set_p2(covariant B2Vec2Platform arg0);
  double get_maxFraction();
  void set_maxFraction(double arg0);
  void dispose();
}

abstract class B2RayCastOutputPlatform {
  B2Vec2Platform get_normal();
  void set_normal(covariant B2Vec2Platform arg0);
  double get_fraction();
  void set_fraction(double arg0);
  void dispose();
}

abstract class B2RevoluteJointPlatform implements B2JointPlatform {
  B2Vec2Platform getLocalAnchorA();
  B2Vec2Platform getLocalAnchorB();
  double getReferenceAngle();
  double getJointAngle();
  double getJointSpeed();
  bool isLimitEnabled();
  void enableLimit(bool flag);
  double getLowerLimit();
  double getUpperLimit();
  void setLimits(double lower, double upper);
  bool isMotorEnabled();
  void enableMotor(bool flag);
  void setMotorSpeed(double speed);
  double getMotorSpeed();
  void setMaxMotorTorque(double torque);
  double getMaxMotorTorque();
  double getMotorTorque(double inv_dt);
  void dump();
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dispose();
}

abstract class B2RevoluteJointDefPlatform implements B2JointDefPlatform {
  B2RevoluteJointDefPlatform();

  void initialize(covariant B2BodyPlatform bodyA,
      covariant B2BodyPlatform bodyB, covariant B2Vec2Platform anchor);
  B2Vec2Platform get_localAnchorA();
  void set_localAnchorA(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localAnchorB();
  void set_localAnchorB(covariant B2Vec2Platform arg0);
  double get_referenceAngle();
  void set_referenceAngle(double arg0);
  bool get_enableLimit();
  void set_enableLimit(bool arg0);
  double get_lowerAngle();
  void set_lowerAngle(double arg0);
  double get_upperAngle();
  void set_upperAngle(double arg0);
  bool get_enableMotor();
  void set_enableMotor(bool arg0);
  double get_motorSpeed();
  void set_motorSpeed(double arg0);
  double get_maxMotorTorque();
  void set_maxMotorTorque(double arg0);
  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2RotPlatform {
  B2RotPlatform();

  B2RotPlatform.from1(double angle);

  void set(double angle);
  void setIdentity();
  double getAngle();
  B2Vec2Platform getXAxis();
  B2Vec2Platform getYAxis();
  double get_s();
  void set_s(double arg0);
  double get_c();
  void set_c(double arg0);
  void dispose();
}

abstract class B2WheelJointPlatform implements B2JointPlatform {
  B2Vec2Platform getLocalAnchorA();
  B2Vec2Platform getLocalAnchorB();
  B2Vec2Platform getLocalAxisA();
  double getJointTranslation();
  double getJointLinearSpeed();
  double getJointAngle();
  double getJointAngularSpeed();
  bool isLimitEnabled();
  void enableLimit(bool flag);
  double getLowerLimit();
  double getUpperLimit();
  void setLimits(double lower, double upper);
  bool isMotorEnabled();
  void enableMotor(bool flag);
  void setMotorSpeed(double speed);
  double getMotorSpeed();
  void setMaxMotorTorque(double torque);
  double getMaxMotorTorque();
  double getMotorTorque(double inv_dt);
  void setStiffness(double stiffness);
  double getStiffness();
  void setDamping(double damping);
  double getDamping();
  void dump();
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dispose();
}

abstract class B2WheelJointDefPlatform implements B2JointDefPlatform {
  B2WheelJointDefPlatform();

  void initialize(
      covariant B2BodyPlatform bodyA,
      covariant B2BodyPlatform bodyB,
      covariant B2Vec2Platform anchor,
      covariant B2Vec2Platform axis);
  B2Vec2Platform get_localAnchorA();
  void set_localAnchorA(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localAnchorB();
  void set_localAnchorB(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_localAxisA();
  void set_localAxisA(covariant B2Vec2Platform arg0);
  bool get_enableLimit();
  void set_enableLimit(bool arg0);
  double get_lowerTranslation();
  void set_lowerTranslation(double arg0);
  double get_upperTranslation();
  void set_upperTranslation(double arg0);
  bool get_enableMotor();
  void set_enableMotor(bool arg0);
  double get_maxMotorTorque();
  void set_maxMotorTorque(double arg0);
  double get_motorSpeed();
  void set_motorSpeed(double arg0);
  double get_stiffness();
  void set_stiffness(double arg0);
  double get_damping();
  void set_damping(double arg0);
  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2MotorJointPlatform implements B2JointPlatform {
  void setLinearOffset(covariant B2Vec2Platform linearOffset);
  B2Vec2Platform getLinearOffset();
  void setAngularOffset(double angularOffset);
  double getAngularOffset();
  void setMaxForce(double force);
  double getMaxForce();
  void setMaxTorque(double torque);
  double getMaxTorque();
  void setCorrectionFactor(double factor);
  double getCorrectionFactor();
  void dump();
  B2JointType getType();
  B2BodyPlatform getBodyA();
  B2BodyPlatform getBodyB();
  B2Vec2Platform getAnchorA();
  B2Vec2Platform getAnchorB();
  B2Vec2Platform getReactionForce(double inv_dt);
  double getReactionTorque(double inv_dt);
  B2JointPlatform getNext();
  B2JointUserDataPlatform getUserData();
  bool getCollideConnected();
  void dispose();
}

abstract class B2MotorJointDefPlatform implements B2JointDefPlatform {
  B2MotorJointDefPlatform();

  void initialize(
      covariant B2BodyPlatform bodyA, covariant B2BodyPlatform bodyB);
  B2Vec2Platform get_linearOffset();
  void set_linearOffset(covariant B2Vec2Platform arg0);
  double get_angularOffset();
  void set_angularOffset(double arg0);
  double get_maxForce();
  void set_maxForce(double arg0);
  double get_maxTorque();
  void set_maxTorque(double arg0);
  double get_correctionFactor();
  void set_correctionFactor(double arg0);
  B2JointType get_type();
  void set_type(B2JointType arg0);
  B2JointUserDataPlatform get_userData();
  void set_userData(covariant B2JointUserDataPlatform arg0);
  B2BodyPlatform get_bodyA();
  void set_bodyA(covariant B2BodyPlatform arg0);
  B2BodyPlatform get_bodyB();
  void set_bodyB(covariant B2BodyPlatform arg0);
  bool get_collideConnected();
  void set_collideConnected(bool arg0);
  void dispose();
}

abstract class B2RopeTuningPlatform {
  B2RopeTuningPlatform();

  B2StretchingModel get_stretchingModel();
  void set_stretchingModel(B2StretchingModel arg0);
  B2BendingModel get_bendingModel();
  void set_bendingModel(B2BendingModel arg0);
  double get_damping();
  void set_damping(double arg0);
  double get_stretchStiffness();
  void set_stretchStiffness(double arg0);
  double get_stretchHertz();
  void set_stretchHertz(double arg0);
  double get_stretchDamping();
  void set_stretchDamping(double arg0);
  double get_bendStiffness();
  void set_bendStiffness(double arg0);
  double get_bendHertz();
  void set_bendHertz(double arg0);
  double get_bendDamping();
  void set_bendDamping(double arg0);
  bool get_isometric();
  void set_isometric(bool arg0);
  bool get_fixedEffectiveMass();
  void set_fixedEffectiveMass(bool arg0);
  bool get_warmStart();
  void set_warmStart(bool arg0);
  void dispose();
}

abstract class B2RopeDefPlatform {
  B2RopeDefPlatform();

  B2Vec2Platform get_position();
  void set_position(covariant B2Vec2Platform arg0);
  B2Vec2Platform get_vertices();
  void set_vertices(covariant B2Vec2Platform arg0);
  int get_count();
  void set_count(int arg0);
  B2Vec2Platform get_gravity();
  void set_gravity(covariant B2Vec2Platform arg0);
  B2RopeTuningPlatform get_tuning();
  void set_tuning(covariant B2RopeTuningPlatform arg0);
  void dispose();
}

abstract class B2RopePlatform {
  B2RopePlatform();

  void create(covariant B2RopeDefPlatform def);
  void setTuning(covariant B2RopeTuningPlatform tuning);
  void step(double timeStep, int iterations, covariant B2Vec2Platform position);
  void reset(covariant B2Vec2Platform position);
  //void draw(covariant B2DrawPlatform draw);
  void dispose();
}

abstract class B2ClipVertexPlatform {
  B2ClipVertexPlatform();

  B2Vec2Platform get_v();
  void set_v(covariant B2Vec2Platform arg0);
  B2ContactIDPlatform get_id();
  void set_id(covariant B2ContactIDPlatform arg0);
  void dispose();
}
