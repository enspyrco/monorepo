// ignore_for_file: non_constant_identifier_names
// ignore_for_file: annotate_overrides
@JS()
library box2d;

import 'package:flutter_box2d_platform_interface/b2_delegates.dart';
import 'package:flutter_box2d_platform_interface/b2_enums.dart';
import 'package:js/js.dart';

class B2ShapeJSAdapter implements B2ShapePlatform {
  B2ShapeJSAdapter._(B2ShapeJSImpl impl) : _impl = impl;

  final B2ShapeJSImpl _impl;

  B2ShapeType getType() => _impl.GetType();
  int getChildCount() => _impl.GetChildCount().toInt();
  bool testPoint(B2TransformJSAdapter xf, B2Vec2JSAdapter p) =>
      _impl.TestPoint(xf._impl, p._impl);
  bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input,
          B2TransformJSAdapter transform, int childIndex) =>
      _impl.RayCast(output._impl, input._impl, transform._impl, childIndex);
  void computeAABB(
          B2AABBJSAdapter aabb, B2TransformJSAdapter xf, int childIndex) =>
      _impl.ComputeAABB(aabb._impl, xf._impl, childIndex);
  void computeMass(B2MassDataJSAdapter massData, double density) =>
      _impl.ComputeMass(massData._impl, density);
  B2ShapeType get_m_type() => _impl.get_m_type();
  void set_m_type(B2ShapeType arg0) => _impl.set_m_type(arg0);
  double get_m_radius() => _impl.get_m_radius().toDouble();
  void set_m_radius(double arg0) => _impl.set_m_radius(arg0);
  void dispose() => _impl.__destroy__();
}

class B2JointDefJSAdapter implements B2JointDefPlatform {
  B2JointDefJSAdapter._(B2JointDefJSImpl impl) : _impl = impl;

  final B2JointDefJSImpl _impl;

  B2JointDefJSAdapter() : _impl = B2JointDefJSImpl();

  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2JointJSAdapter implements B2JointPlatform {
  B2JointJSAdapter._(B2JointJSImpl impl) : _impl = impl;

  final B2JointJSImpl _impl;

  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dump() => _impl.Dump();
}

class VoidPtrJSAdapter implements VoidPtrPlatform {
  VoidPtrJSAdapter._(VoidPtrJSImpl impl) : _impl = impl;

  final VoidPtrJSImpl _impl;

  void dispose() => _impl.__destroy__();
}

class B2ContactJSAdapter implements B2ContactPlatform {
  B2ContactJSAdapter._(B2ContactJSImpl impl) : _impl = impl;

  final B2ContactJSImpl _impl;

  B2ManifoldJSAdapter getManifold() =>
      B2ManifoldJSAdapter._(_impl.GetManifold());
  void getWorldManifold(B2WorldManifoldJSAdapter manifold) =>
      _impl.GetWorldManifold(manifold._impl);
  bool isTouching() => _impl.IsTouching();
  void setEnabled(bool flag) => _impl.SetEnabled(flag);
  bool isEnabled() => _impl.IsEnabled();
  B2ContactJSAdapter getNext() => B2ContactJSAdapter._(_impl.GetNext());
  B2FixtureJSAdapter getFixtureA() => B2FixtureJSAdapter._(_impl.GetFixtureA());
  int getChildIndexA() => _impl.GetChildIndexA().toInt();
  B2FixtureJSAdapter getFixtureB() => B2FixtureJSAdapter._(_impl.GetFixtureB());
  int getChildIndexB() => _impl.GetChildIndexB().toInt();
  void setFriction(double friction) => _impl.SetFriction(friction);
  double getFriction() => _impl.GetFriction().toDouble();
  void resetFriction() => _impl.ResetFriction();
  void setRestitution(double restitution) => _impl.SetRestitution(restitution);
  double getRestitution() => _impl.GetRestitution().toDouble();
  void resetRestitution() => _impl.ResetRestitution();
  void setRestitutionThreshold(double threshold) =>
      _impl.SetRestitutionThreshold(threshold);
  double getRestitutionThreshold() =>
      _impl.GetRestitutionThreshold().toDouble();
  void resetRestitutionThreshold() => _impl.ResetRestitutionThreshold();
  void setTangentSpeed(double speed) => _impl.SetTangentSpeed(speed);
  double getTangentSpeed() => _impl.GetTangentSpeed().toDouble();
}

class B2ContactListenerJSAdapter implements B2ContactListenerPlatform {
  B2ContactListenerJSAdapter._(B2ContactListenerJSImpl impl) : _impl = impl;

  final B2ContactListenerJSImpl _impl;

  void dispose() => _impl.__destroy__();
}

class JSContactListenerJSAdapter implements JSContactListenerPlatform {
  JSContactListenerJSAdapter._(JSContactListenerJSImpl impl) : _impl = impl;

  final JSContactListenerJSImpl _impl;

  JSContactListenerJSAdapter() : _impl = JSContactListenerJSImpl();

  void beginContact(B2ContactJSAdapter contact) =>
      _impl.BeginContact(contact._impl);
  void endContact(B2ContactJSAdapter contact) =>
      _impl.EndContact(contact._impl);
  void preSolve(B2ContactJSAdapter contact, B2ManifoldJSAdapter oldManifold) =>
      _impl.PreSolve(contact._impl, oldManifold._impl);
  void postSolve(
          B2ContactJSAdapter contact, B2ContactImpulseJSAdapter impulse) =>
      _impl.PostSolve(contact._impl, impulse._impl);
  void dispose() => _impl.__destroy__();
}

class B2WorldJSAdapter implements B2WorldPlatform {
  B2WorldJSAdapter._(B2WorldJSImpl impl) : _impl = impl;

  final B2WorldJSImpl _impl;

  B2WorldJSAdapter.from1(B2Vec2JSAdapter gravity)
      : _impl = B2WorldJSImpl.from1(gravity._impl);

  //void setDestructionListener(B2DestructionListenerJSAdapter listener) => _impl.SetDestructionListener(listener._impl);
  //void setContactFilter(JSContactFilterJSAdapter filter) => _impl.SetContactFilter(filter._impl);
  //void setContactListener(JSContactListenerJSAdapter listener) => _impl.SetContactListener(listener._impl);
  //void setDebugDraw(B2DrawJSAdapter debugDraw) => _impl.SetDebugDraw(debugDraw._impl);
  B2BodyJSAdapter createBody(B2BodyDefJSAdapter def) =>
      B2BodyJSAdapter._(_impl.CreateBody(def._impl));
  void destroyBody(B2BodyJSAdapter body) => _impl.DestroyBody(body._impl);
  B2JointJSAdapter createJoint(B2JointDefJSAdapter def) =>
      B2JointJSAdapter._(_impl.CreateJoint(def._impl));
  void destroyJoint(B2JointJSAdapter joint) => _impl.DestroyJoint(joint._impl);
  void step(double timeStep, int velocityIterations, int positionIterations) =>
      _impl.Step(timeStep, velocityIterations, positionIterations);
  void clearForces() => _impl.ClearForces();
  void debugDraw() => _impl.DebugDraw();
  //void queryAABB(B2QueryCallbackJSAdapter callback, B2AABBJSAdapter aabb) => _impl.QueryAABB(callback._impl, aabb._impl);
  //void rayCast(B2RayCastCallbackJSAdapter callback, B2Vec2JSAdapter point1, B2Vec2JSAdapter point2) => _impl.RayCast(callback._impl, point1._impl, point2._impl);
  B2BodyJSAdapter getBodyList() => B2BodyJSAdapter._(_impl.GetBodyList());
  B2JointJSAdapter getJointList() => B2JointJSAdapter._(_impl.GetJointList());
  B2ContactJSAdapter getContactList() =>
      B2ContactJSAdapter._(_impl.GetContactList());
  void setAllowSleeping(bool flag) => _impl.SetAllowSleeping(flag);
  bool getAllowSleeping() => _impl.GetAllowSleeping();
  void setWarmStarting(bool flag) => _impl.SetWarmStarting(flag);
  bool getWarmStarting() => _impl.GetWarmStarting();
  void setContinuousPhysics(bool flag) => _impl.SetContinuousPhysics(flag);
  bool getContinuousPhysics() => _impl.GetContinuousPhysics();
  void setSubStepping(bool flag) => _impl.SetSubStepping(flag);
  bool getSubStepping() => _impl.GetSubStepping();
  int getProxyCount() => _impl.GetProxyCount().toInt();
  int getBodyCount() => _impl.GetBodyCount().toInt();
  int getJointCount() => _impl.GetJointCount().toInt();
  int getContactCount() => _impl.GetContactCount().toInt();
  int getTreeHeight() => _impl.GetTreeHeight().toInt();
  int getTreeBalance() => _impl.GetTreeBalance().toInt();
  double getTreeQuality() => _impl.GetTreeQuality().toDouble();
  void setGravity(B2Vec2JSAdapter gravity) => _impl.SetGravity(gravity._impl);
  B2Vec2JSAdapter getGravity() => B2Vec2JSAdapter._(_impl.GetGravity());
  bool isLocked() => _impl.IsLocked();
  void setAutoClearForces(bool flag) => _impl.SetAutoClearForces(flag);
  bool getAutoClearForces() => _impl.GetAutoClearForces();
  B2ProfileJSAdapter getProfile() => B2ProfileJSAdapter._(_impl.GetProfile());
  void dump() => _impl.Dump();
  void dispose() => _impl.__destroy__();
}

class B2FixtureUserDataJSAdapter implements B2FixtureUserDataPlatform {
  B2FixtureUserDataJSAdapter._(B2FixtureUserDataJSImpl impl) : _impl = impl;

  final B2FixtureUserDataJSImpl _impl;

  int get_pointer() => _impl.get_pointer();
  void set_pointer(int arg0) => _impl.set_pointer(arg0);
  void dispose() => _impl.__destroy__();
}

class B2FixtureDefJSAdapter implements B2FixtureDefPlatform {
  B2FixtureDefJSAdapter._(B2FixtureDefJSImpl impl) : _impl = impl;

  final B2FixtureDefJSImpl _impl;

  B2FixtureDefJSAdapter() : _impl = B2FixtureDefJSImpl();

  B2ShapeJSAdapter get_shape() => B2ShapeJSAdapter._(_impl.get_shape());
  void set_shape(B2ShapeJSAdapter arg0) => _impl.set_shape(arg0._impl);
  B2FixtureUserDataJSAdapter get_userData() =>
      B2FixtureUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2FixtureUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  double get_friction() => _impl.get_friction().toDouble();
  void set_friction(double arg0) => _impl.set_friction(arg0);
  double get_restitution() => _impl.get_restitution().toDouble();
  void set_restitution(double arg0) => _impl.set_restitution(arg0);
  double get_restitutionThreshold() =>
      _impl.get_restitutionThreshold().toDouble();
  void set_restitutionThreshold(double arg0) =>
      _impl.set_restitutionThreshold(arg0);
  double get_density() => _impl.get_density().toDouble();
  void set_density(double arg0) => _impl.set_density(arg0);
  bool get_isSensor() => _impl.get_isSensor();
  void set_isSensor(bool arg0) => _impl.set_isSensor(arg0);
  B2FilterJSAdapter get_filter() => B2FilterJSAdapter._(_impl.get_filter());
  void set_filter(B2FilterJSAdapter arg0) => _impl.set_filter(arg0._impl);
  void dispose() => _impl.__destroy__();
}

class B2FixtureJSAdapter implements B2FixturePlatform {
  B2FixtureJSAdapter._(B2FixtureJSImpl impl) : _impl = impl;

  final B2FixtureJSImpl _impl;

  B2ShapeType getType() => _impl.GetType();
  B2ShapeJSAdapter getShape() => B2ShapeJSAdapter._(_impl.GetShape());
  void setSensor(bool sensor) => _impl.SetSensor(sensor);
  bool isSensor() => _impl.IsSensor();
  void setFilterData(B2FilterJSAdapter filter) =>
      _impl.SetFilterData(filter._impl);
  B2FilterJSAdapter getFilterData() =>
      B2FilterJSAdapter._(_impl.GetFilterData());
  void refilter() => _impl.Refilter();
  B2BodyJSAdapter getBody() => B2BodyJSAdapter._(_impl.GetBody());
  B2FixtureJSAdapter getNext() => B2FixtureJSAdapter._(_impl.GetNext());
  B2FixtureUserDataJSAdapter getUserData() =>
      B2FixtureUserDataJSAdapter._(_impl.GetUserData());
  bool testPoint(B2Vec2JSAdapter p) => _impl.TestPoint(p._impl);
  bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input,
          int childIndex) =>
      _impl.RayCast(output._impl, input._impl, childIndex);
  void getMassData(B2MassDataJSAdapter massData) =>
      _impl.GetMassData(massData._impl);
  void setDensity(double density) => _impl.SetDensity(density);
  double getDensity() => _impl.GetDensity().toDouble();
  double getFriction() => _impl.GetFriction().toDouble();
  void setFriction(double friction) => _impl.SetFriction(friction);
  double getRestitution() => _impl.GetRestitution().toDouble();
  void setRestitution(double restitution) => _impl.SetRestitution(restitution);
  double getRestitutionThreshold() =>
      _impl.GetRestitutionThreshold().toDouble();
  void setRestitutionThreshold(double threshold) =>
      _impl.SetRestitutionThreshold(threshold);
  B2AABBJSAdapter getAABB(int childIndex) =>
      B2AABBJSAdapter._(_impl.GetAABB(childIndex));
  void dump(int bodyIndex) => _impl.Dump(bodyIndex);
  void dispose() => _impl.__destroy__();
}

class B2TransformJSAdapter implements B2TransformPlatform {
  B2TransformJSAdapter._(B2TransformJSImpl impl) : _impl = impl;

  final B2TransformJSImpl _impl;

  B2TransformJSAdapter() : _impl = B2TransformJSImpl();

  B2TransformJSAdapter.from2(B2Vec2JSAdapter position, B2RotJSAdapter rotation)
      : _impl = B2TransformJSImpl.from2(position._impl, rotation._impl);

  void setIdentity() => _impl.SetIdentity();
  void set(B2Vec2JSAdapter position, double angle) =>
      _impl.Set(position._impl, angle);
  B2Vec2JSAdapter get_p() => B2Vec2JSAdapter._(_impl.get_p());
  void set_p(B2Vec2JSAdapter arg0) => _impl.set_p(arg0._impl);
  B2RotJSAdapter get_q() => B2RotJSAdapter._(_impl.get_q());
  void set_q(B2RotJSAdapter arg0) => _impl.set_q(arg0._impl);
  void dispose() => _impl.__destroy__();
}

class B2RayCastCallbackJSAdapter implements B2RayCastCallbackPlatform {
  B2RayCastCallbackJSAdapter._(B2RayCastCallbackJSImpl impl) : _impl = impl;

  final B2RayCastCallbackJSImpl _impl;

  void dispose() => _impl.__destroy__();
}

class JSRayCastCallbackJSAdapter implements JSRayCastCallbackPlatform {
  JSRayCastCallbackJSAdapter._(JSRayCastCallbackJSImpl impl) : _impl = impl;

  final JSRayCastCallbackJSImpl _impl;

  JSRayCastCallbackJSAdapter() : _impl = JSRayCastCallbackJSImpl();

  double reportFixture(B2FixtureJSAdapter fixture, B2Vec2JSAdapter point,
          B2Vec2JSAdapter normal, double fraction) =>
      _impl.ReportFixture(fixture._impl, point._impl, normal._impl, fraction)
          .toDouble();
  void dispose() => _impl.__destroy__();
}

class B2QueryCallbackJSAdapter implements B2QueryCallbackPlatform {
  B2QueryCallbackJSAdapter._(B2QueryCallbackJSImpl impl) : _impl = impl;

  final B2QueryCallbackJSImpl _impl;

  void dispose() => _impl.__destroy__();
}

class JSQueryCallbackJSAdapter implements JSQueryCallbackPlatform {
  JSQueryCallbackJSAdapter._(JSQueryCallbackJSImpl impl) : _impl = impl;

  final JSQueryCallbackJSImpl _impl;

  JSQueryCallbackJSAdapter() : _impl = JSQueryCallbackJSImpl();

  bool reportFixture(B2FixtureJSAdapter fixture) =>
      _impl.ReportFixture(fixture._impl);
  void dispose() => _impl.__destroy__();
}

class B2MassDataJSAdapter implements B2MassDataPlatform {
  B2MassDataJSAdapter._(B2MassDataJSImpl impl) : _impl = impl;

  final B2MassDataJSImpl _impl;

  B2MassDataJSAdapter() : _impl = B2MassDataJSImpl();

  double get_mass() => _impl.get_mass().toDouble();
  void set_mass(double arg0) => _impl.set_mass(arg0);
  B2Vec2JSAdapter get_center() => B2Vec2JSAdapter._(_impl.get_center());
  void set_center(B2Vec2JSAdapter arg0) => _impl.set_center(arg0._impl);
  double get_I() => _impl.get_I().toDouble();
  void set_I(double arg0) => _impl.set_I(arg0);
  void dispose() => _impl.__destroy__();
}

class B2Vec2JSAdapter implements B2Vec2Platform {
  B2Vec2JSAdapter._(B2Vec2JSImpl impl) : _impl = impl;

  final B2Vec2JSImpl _impl;

  B2Vec2JSAdapter() : _impl = B2Vec2JSImpl();

  B2Vec2JSAdapter.from2(double x, double y) : _impl = B2Vec2JSImpl.from2(x, y);

  void setZero() => _impl.SetZero();
  void set(double x, double y) => _impl.Set(x, y);
  void op_add(B2Vec2JSAdapter v) => _impl.op_add(v._impl);
  void op_sub(B2Vec2JSAdapter v) => _impl.op_sub(v._impl);
  void op_mul(double s) => _impl.op_mul(s);
  double length() => _impl.Length().toDouble();
  double lengthSquared() => _impl.LengthSquared().toDouble();
  double normalize() => _impl.Normalize().toDouble();
  bool isValid() => _impl.IsValid();
  B2Vec2JSAdapter skew() => B2Vec2JSAdapter._(_impl.Skew());
  double get_x() => _impl.get_x().toDouble();
  void set_x(double arg0) => _impl.set_x(arg0);
  double get_y() => _impl.get_y().toDouble();
  void set_y(double arg0) => _impl.set_y(arg0);
  void dispose() => _impl.__destroy__();
}

class B2Vec3JSAdapter implements B2Vec3Platform {
  B2Vec3JSAdapter._(B2Vec3JSImpl impl) : _impl = impl;

  final B2Vec3JSImpl _impl;

  B2Vec3JSAdapter() : _impl = B2Vec3JSImpl();

  B2Vec3JSAdapter.from3(double x, double y, double z)
      : _impl = B2Vec3JSImpl.from3(x, y, z);

  void setZero() => _impl.SetZero();
  void set(double x, double y, double z) => _impl.Set(x, y, z);
  void op_add(B2Vec3JSAdapter v) => _impl.op_add(v._impl);
  void op_sub(B2Vec3JSAdapter v) => _impl.op_sub(v._impl);
  void op_mul(double s) => _impl.op_mul(s);
  double get_x() => _impl.get_x().toDouble();
  void set_x(double arg0) => _impl.set_x(arg0);
  double get_y() => _impl.get_y().toDouble();
  void set_y(double arg0) => _impl.set_y(arg0);
  double get_z() => _impl.get_z().toDouble();
  void set_z(double arg0) => _impl.set_z(arg0);
  void dispose() => _impl.__destroy__();
}

class B2BodyUserDataJSAdapter implements B2BodyUserDataPlatform {
  B2BodyUserDataJSAdapter._(B2BodyUserDataJSImpl impl) : _impl = impl;

  final B2BodyUserDataJSImpl _impl;

  int get_pointer() => _impl.get_pointer();
  void set_pointer(int arg0) => _impl.set_pointer(arg0);
  void dispose() => _impl.__destroy__();
}

class B2BodyJSAdapter implements B2BodyPlatform {
  B2BodyJSAdapter._(B2BodyJSImpl impl) : _impl = impl;

  final B2BodyJSImpl _impl;

  B2FixtureJSAdapter createFixture1(B2FixtureDefJSAdapter shape) =>
      B2FixtureJSAdapter._(_impl.CreateFixture(shape.get_shape()._impl, null));
  B2FixtureJSAdapter createFixture2(B2ShapeJSAdapter shape, double density) =>
      B2FixtureJSAdapter._(_impl.CreateFixture(shape._impl, density));
  void destroyFixture(B2FixtureJSAdapter fixture) =>
      _impl.DestroyFixture(fixture._impl);
  void setTransform(B2Vec2JSAdapter position, double angle) =>
      _impl.SetTransform(position._impl, angle);
  B2TransformJSAdapter getTransform() =>
      B2TransformJSAdapter._(_impl.GetTransform());
  B2Vec2JSAdapter getPosition() => B2Vec2JSAdapter._(_impl.GetPosition());
  double getAngle() => _impl.GetAngle().toDouble();
  B2Vec2JSAdapter getWorldCenter() => B2Vec2JSAdapter._(_impl.GetWorldCenter());
  B2Vec2JSAdapter getLocalCenter() => B2Vec2JSAdapter._(_impl.GetLocalCenter());
  void setLinearVelocity(B2Vec2JSAdapter v) => _impl.SetLinearVelocity(v._impl);
  B2Vec2JSAdapter getLinearVelocity() =>
      B2Vec2JSAdapter._(_impl.GetLinearVelocity());
  void setAngularVelocity(double omega) => _impl.SetAngularVelocity(omega);
  double getAngularVelocity() => _impl.GetAngularVelocity().toDouble();
  void applyForce(B2Vec2JSAdapter force, B2Vec2JSAdapter point, bool wake) =>
      _impl.ApplyForce(force._impl, point._impl, wake);
  void applyForceToCenter(B2Vec2JSAdapter force, bool wake) =>
      _impl.ApplyForceToCenter(force._impl, wake);
  void applyTorque(double torque, bool awake) =>
      _impl.ApplyTorque(torque, awake);
  void applyLinearImpulse(
          B2Vec2JSAdapter impulse, B2Vec2JSAdapter point, bool wake) =>
      _impl.ApplyLinearImpulse(impulse._impl, point._impl, wake);
  void applyLinearImpulseToCenter(B2Vec2JSAdapter impulse, bool wake) =>
      _impl.ApplyLinearImpulseToCenter(impulse._impl, wake);
  void applyAngularImpulse(double impulse, bool wake) =>
      _impl.ApplyAngularImpulse(impulse, wake);
  double getMass() => _impl.GetMass().toDouble();
  double getInertia() => _impl.GetInertia().toDouble();
  void getMassData(B2MassDataJSAdapter data) => _impl.GetMassData(data._impl);
  void setMassData(B2MassDataJSAdapter data) => _impl.SetMassData(data._impl);
  void resetMassData() => _impl.ResetMassData();
  B2Vec2JSAdapter getWorldPoint(B2Vec2JSAdapter localPoint) =>
      B2Vec2JSAdapter._(_impl.GetWorldPoint(localPoint._impl));
  B2Vec2JSAdapter getWorldVector(B2Vec2JSAdapter localVector) =>
      B2Vec2JSAdapter._(_impl.GetWorldVector(localVector._impl));
  B2Vec2JSAdapter getLocalPoint(B2Vec2JSAdapter worldPoint) =>
      B2Vec2JSAdapter._(_impl.GetLocalPoint(worldPoint._impl));
  B2Vec2JSAdapter getLocalVector(B2Vec2JSAdapter worldVector) =>
      B2Vec2JSAdapter._(_impl.GetLocalVector(worldVector._impl));
  B2Vec2JSAdapter getLinearVelocityFromWorldPoint(B2Vec2JSAdapter worldPoint) =>
      B2Vec2JSAdapter._(
          _impl.GetLinearVelocityFromWorldPoint(worldPoint._impl));
  B2Vec2JSAdapter getLinearVelocityFromLocalPoint(B2Vec2JSAdapter localPoint) =>
      B2Vec2JSAdapter._(
          _impl.GetLinearVelocityFromLocalPoint(localPoint._impl));
  double getLinearDamping() => _impl.GetLinearDamping().toDouble();
  void setLinearDamping(double linearDamping) =>
      _impl.SetLinearDamping(linearDamping);
  double getAngularDamping() => _impl.GetAngularDamping().toDouble();
  void setAngularDamping(double angularDamping) =>
      _impl.SetAngularDamping(angularDamping);
  double getGravityScale() => _impl.GetGravityScale().toDouble();
  void setGravityScale(double scale) => _impl.SetGravityScale(scale);
  void setType(B2BodyType type) => _impl.SetType(type);
  B2BodyType getType() => _impl.GetType();
  void setBullet(bool flag) => _impl.SetBullet(flag);
  bool isBullet() => _impl.IsBullet();
  void setSleepingAllowed(bool flag) => _impl.SetSleepingAllowed(flag);
  bool isSleepingAllowed() => _impl.IsSleepingAllowed();
  void setAwake(bool flag) => _impl.SetAwake(flag);
  bool isAwake() => _impl.IsAwake();
  void setEnabled(bool flag) => _impl.SetEnabled(flag);
  bool isEnabled() => _impl.IsEnabled();
  void setFixedRotation(bool flag) => _impl.SetFixedRotation(flag);
  bool isFixedRotation() => _impl.IsFixedRotation();
  B2FixtureJSAdapter getFixtureList() =>
      B2FixtureJSAdapter._(_impl.GetFixtureList());
  B2JointEdgeJSAdapter getJointList() =>
      B2JointEdgeJSAdapter._(_impl.GetJointList());
  B2ContactEdgeJSAdapter getContactList() =>
      B2ContactEdgeJSAdapter._(_impl.GetContactList());
  B2BodyJSAdapter getNext() => B2BodyJSAdapter._(_impl.GetNext());
  B2BodyUserDataJSAdapter getUserData() =>
      B2BodyUserDataJSAdapter._(_impl.GetUserData());
  B2WorldJSAdapter getWorld() => B2WorldJSAdapter._(_impl.GetWorld());
  void dump() => _impl.Dump();
}

class B2BodyDefJSAdapter implements B2BodyDefPlatform {
  B2BodyDefJSAdapter._(B2BodyDefJSImpl impl) : _impl = impl;

  final B2BodyDefJSImpl _impl;

  B2BodyDefJSAdapter() : _impl = B2BodyDefJSImpl();

  B2BodyType get_type() => _impl.get_type();
  void set_type(B2BodyType arg0) => _impl.set_type(arg0);
  B2Vec2JSAdapter get_position() => B2Vec2JSAdapter._(_impl.get_position());
  void set_position(B2Vec2JSAdapter arg0) => _impl.set_position(arg0._impl);
  double get_angle() => _impl.get_angle().toDouble();
  void set_angle(double arg0) => _impl.set_angle(arg0);
  B2Vec2JSAdapter get_linearVelocity() =>
      B2Vec2JSAdapter._(_impl.get_linearVelocity());
  void set_linearVelocity(B2Vec2JSAdapter arg0) =>
      _impl.set_linearVelocity(arg0._impl);
  double get_angularVelocity() => _impl.get_angularVelocity().toDouble();
  void set_angularVelocity(double arg0) => _impl.set_angularVelocity(arg0);
  double get_linearDamping() => _impl.get_linearDamping().toDouble();
  void set_linearDamping(double arg0) => _impl.set_linearDamping(arg0);
  double get_angularDamping() => _impl.get_angularDamping().toDouble();
  void set_angularDamping(double arg0) => _impl.set_angularDamping(arg0);
  bool get_allowSleep() => _impl.get_allowSleep();
  void set_allowSleep(bool arg0) => _impl.set_allowSleep(arg0);
  bool get_awake() => _impl.get_awake();
  void set_awake(bool arg0) => _impl.set_awake(arg0);
  bool get_fixedRotation() => _impl.get_fixedRotation();
  void set_fixedRotation(bool arg0) => _impl.set_fixedRotation(arg0);
  bool get_bullet() => _impl.get_bullet();
  void set_bullet(bool arg0) => _impl.set_bullet(arg0);
  bool get_enabled() => _impl.get_enabled();
  void set_enabled(bool arg0) => _impl.set_enabled(arg0);
  B2BodyUserDataJSAdapter get_userData() =>
      B2BodyUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2BodyUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  double get_gravityScale() => _impl.get_gravityScale().toDouble();
  void set_gravityScale(double arg0) => _impl.set_gravityScale(arg0);
  void dispose() => _impl.__destroy__();
}

class B2FilterJSAdapter implements B2FilterPlatform {
  B2FilterJSAdapter._(B2FilterJSImpl impl) : _impl = impl;

  final B2FilterJSImpl _impl;

  B2FilterJSAdapter() : _impl = B2FilterJSImpl();

  int get_categoryBits() => _impl.get_categoryBits();
  void set_categoryBits(int arg0) => _impl.set_categoryBits(arg0);
  int get_maskBits() => _impl.get_maskBits();
  void set_maskBits(int arg0) => _impl.set_maskBits(arg0);
  int get_groupIndex() => _impl.get_groupIndex();
  void set_groupIndex(int arg0) => _impl.set_groupIndex(arg0);
  void dispose() => _impl.__destroy__();
}

class B2AABBJSAdapter implements B2AABBPlatform {
  B2AABBJSAdapter._(B2AABBJSImpl impl) : _impl = impl;

  final B2AABBJSImpl _impl;

  B2AABBJSAdapter() : _impl = B2AABBJSImpl();

  bool isValid() => _impl.IsValid();
  B2Vec2JSAdapter getCenter() => B2Vec2JSAdapter._(_impl.GetCenter());
  B2Vec2JSAdapter getExtents() => B2Vec2JSAdapter._(_impl.GetExtents());
  double getPerimeter() => _impl.GetPerimeter().toDouble();
  void combine1(B2AABBJSAdapter aabb1) => _impl.Combine(aabb1._impl, null);
  void combine2(B2AABBJSAdapter aabb1, B2AABBJSAdapter aabb2) =>
      _impl.Combine(aabb1._impl, aabb2._impl);
  bool contains(B2AABBJSAdapter aabb) => _impl.Contains(aabb._impl);
  bool rayCast(
          B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input) =>
      _impl.RayCast(output._impl, input._impl);
  B2Vec2JSAdapter get_lowerBound() => B2Vec2JSAdapter._(_impl.get_lowerBound());
  void set_lowerBound(B2Vec2JSAdapter arg0) => _impl.set_lowerBound(arg0._impl);
  B2Vec2JSAdapter get_upperBound() => B2Vec2JSAdapter._(_impl.get_upperBound());
  void set_upperBound(B2Vec2JSAdapter arg0) => _impl.set_upperBound(arg0._impl);
  void dispose() => _impl.__destroy__();
}

class B2CircleShapeJSAdapter
    implements B2CircleShapePlatform, B2ShapeJSAdapter {
  B2CircleShapeJSAdapter._(B2CircleShapeJSImpl impl) : _impl = impl;

  final B2CircleShapeJSImpl _impl;

  B2CircleShapeJSAdapter() : _impl = B2CircleShapeJSImpl();

  B2ShapeType getType() => _impl.GetType();
  int getChildCount() => _impl.GetChildCount().toInt();
  bool testPoint(B2TransformJSAdapter xf, B2Vec2JSAdapter p) =>
      _impl.TestPoint(xf._impl, p._impl);
  bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input,
          B2TransformJSAdapter transform, int childIndex) =>
      _impl.RayCast(output._impl, input._impl, transform._impl, childIndex);
  void computeAABB(
          B2AABBJSAdapter aabb, B2TransformJSAdapter xf, int childIndex) =>
      _impl.ComputeAABB(aabb._impl, xf._impl, childIndex);
  void computeMass(B2MassDataJSAdapter massData, double density) =>
      _impl.ComputeMass(massData._impl, density);
  B2Vec2JSAdapter get_m_p() => B2Vec2JSAdapter._(_impl.get_m_p());
  void set_m_p(B2Vec2JSAdapter arg0) => _impl.set_m_p(arg0._impl);
  B2ShapeType get_m_type() => _impl.get_m_type();
  void set_m_type(B2ShapeType arg0) => _impl.set_m_type(arg0);
  double get_m_radius() => _impl.get_m_radius().toDouble();
  void set_m_radius(double arg0) => _impl.set_m_radius(arg0);
  void dispose() => _impl.__destroy__();
}

class B2EdgeShapeJSAdapter implements B2EdgeShapePlatform, B2ShapeJSAdapter {
  B2EdgeShapeJSAdapter._(B2EdgeShapeJSImpl impl) : _impl = impl;

  final B2EdgeShapeJSImpl _impl;

  B2EdgeShapeJSAdapter() : _impl = B2EdgeShapeJSImpl();

  void setOneSided(B2Vec2JSAdapter v0, B2Vec2JSAdapter v1, B2Vec2JSAdapter v2,
          B2Vec2JSAdapter v3) =>
      _impl.SetOneSided(v0._impl, v1._impl, v2._impl, v3._impl);
  void setTwoSided(B2Vec2JSAdapter v1, B2Vec2JSAdapter v2) =>
      _impl.SetTwoSided(v1._impl, v2._impl);
  B2ShapeType getType() => _impl.GetType();
  int getChildCount() => _impl.GetChildCount().toInt();
  bool testPoint(B2TransformJSAdapter xf, B2Vec2JSAdapter p) =>
      _impl.TestPoint(xf._impl, p._impl);
  bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input,
          B2TransformJSAdapter transform, int childIndex) =>
      _impl.RayCast(output._impl, input._impl, transform._impl, childIndex);
  void computeAABB(
          B2AABBJSAdapter aabb, B2TransformJSAdapter xf, int childIndex) =>
      _impl.ComputeAABB(aabb._impl, xf._impl, childIndex);
  void computeMass(B2MassDataJSAdapter massData, double density) =>
      _impl.ComputeMass(massData._impl, density);
  B2Vec2JSAdapter get_m_vertex1() => B2Vec2JSAdapter._(_impl.get_m_vertex1());
  void set_m_vertex1(B2Vec2JSAdapter arg0) => _impl.set_m_vertex1(arg0._impl);
  B2Vec2JSAdapter get_m_vertex2() => B2Vec2JSAdapter._(_impl.get_m_vertex2());
  void set_m_vertex2(B2Vec2JSAdapter arg0) => _impl.set_m_vertex2(arg0._impl);
  B2Vec2JSAdapter get_m_vertex0() => B2Vec2JSAdapter._(_impl.get_m_vertex0());
  void set_m_vertex0(B2Vec2JSAdapter arg0) => _impl.set_m_vertex0(arg0._impl);
  B2Vec2JSAdapter get_m_vertex3() => B2Vec2JSAdapter._(_impl.get_m_vertex3());
  void set_m_vertex3(B2Vec2JSAdapter arg0) => _impl.set_m_vertex3(arg0._impl);
  bool get_m_oneSided() => _impl.get_m_oneSided();
  void set_m_oneSided(bool arg0) => _impl.set_m_oneSided(arg0);
  B2ShapeType get_m_type() => _impl.get_m_type();
  void set_m_type(B2ShapeType arg0) => _impl.set_m_type(arg0);
  double get_m_radius() => _impl.get_m_radius().toDouble();
  void set_m_radius(double arg0) => _impl.set_m_radius(arg0);
  void dispose() => _impl.__destroy__();
}

class B2JointUserDataJSAdapter implements B2JointUserDataPlatform {
  B2JointUserDataJSAdapter._(B2JointUserDataJSImpl impl) : _impl = impl;

  final B2JointUserDataJSImpl _impl;

  int get_pointer() => _impl.get_pointer();
  void set_pointer(int arg0) => _impl.set_pointer(arg0);
  void dispose() => _impl.__destroy__();
}

class B2WeldJointJSAdapter implements B2WeldJointPlatform, B2JointJSAdapter {
  B2WeldJointJSAdapter._(B2WeldJointJSImpl impl) : _impl = impl;

  final B2WeldJointJSImpl _impl;

  B2Vec2JSAdapter getLocalAnchorA() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorA());
  B2Vec2JSAdapter getLocalAnchorB() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorB());
  double getReferenceAngle() => _impl.GetReferenceAngle().toDouble();
  void setStiffness(double stiffness) => _impl.SetStiffness(stiffness);
  double getStiffness() => _impl.GetStiffness().toDouble();
  void setDamping(double damping) => _impl.SetDamping(damping);
  double getDamping() => _impl.GetDamping().toDouble();
  void dump() => _impl.Dump();
  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dispose() => _impl.__destroy__();
}

class B2WeldJointDefJSAdapter
    implements B2WeldJointDefPlatform, B2JointDefJSAdapter {
  B2WeldJointDefJSAdapter._(B2WeldJointDefJSImpl impl) : _impl = impl;

  final B2WeldJointDefJSImpl _impl;

  B2WeldJointDefJSAdapter() : _impl = B2WeldJointDefJSImpl();

  void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB,
          B2Vec2JSAdapter anchor) =>
      _impl.Initialize(bodyA._impl, bodyB._impl, anchor._impl);
  B2Vec2JSAdapter get_localAnchorA() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorA());
  void set_localAnchorA(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorA(arg0._impl);
  B2Vec2JSAdapter get_localAnchorB() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorB());
  void set_localAnchorB(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorB(arg0._impl);
  double get_referenceAngle() => _impl.get_referenceAngle().toDouble();
  void set_referenceAngle(double arg0) => _impl.set_referenceAngle(arg0);
  double get_stiffness() => _impl.get_stiffness().toDouble();
  void set_stiffness(double arg0) => _impl.set_stiffness(arg0);
  double get_damping() => _impl.get_damping().toDouble();
  void set_damping(double arg0) => _impl.set_damping(arg0);
  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2ChainShapeJSAdapter implements B2ChainShapePlatform, B2ShapeJSAdapter {
  B2ChainShapeJSAdapter._(B2ChainShapeJSImpl impl) : _impl = impl;

  final B2ChainShapeJSImpl _impl;

  B2ChainShapeJSAdapter() : _impl = B2ChainShapeJSImpl();

  void clear() => _impl.Clear();
  void createLoop(B2Vec2JSAdapter vertices, int count) =>
      _impl.CreateLoop(vertices._impl, count);
  void createChain(B2Vec2JSAdapter vertices, int count,
          B2Vec2JSAdapter prevVertex, B2Vec2JSAdapter nextVertex) =>
      _impl.CreateChain(
          vertices._impl, count, prevVertex._impl, nextVertex._impl);
  void getChildEdge(B2EdgeShapeJSAdapter edge, int index) =>
      _impl.GetChildEdge(edge._impl, index);
  B2ShapeType getType() => _impl.GetType();
  int getChildCount() => _impl.GetChildCount().toInt();
  bool testPoint(B2TransformJSAdapter xf, B2Vec2JSAdapter p) =>
      _impl.TestPoint(xf._impl, p._impl);
  bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input,
          B2TransformJSAdapter transform, int childIndex) =>
      _impl.RayCast(output._impl, input._impl, transform._impl, childIndex);
  void computeAABB(
          B2AABBJSAdapter aabb, B2TransformJSAdapter xf, int childIndex) =>
      _impl.ComputeAABB(aabb._impl, xf._impl, childIndex);
  void computeMass(B2MassDataJSAdapter massData, double density) =>
      _impl.ComputeMass(massData._impl, density);
  B2Vec2JSAdapter get_m_vertices() => B2Vec2JSAdapter._(_impl.get_m_vertices());
  void set_m_vertices(B2Vec2JSAdapter arg0) => _impl.set_m_vertices(arg0._impl);
  int get_m_count() => _impl.get_m_count().toInt();
  void set_m_count(int arg0) => _impl.set_m_count(arg0);
  B2Vec2JSAdapter get_m_prevVertex() =>
      B2Vec2JSAdapter._(_impl.get_m_prevVertex());
  void set_m_prevVertex(B2Vec2JSAdapter arg0) =>
      _impl.set_m_prevVertex(arg0._impl);
  B2Vec2JSAdapter get_m_nextVertex() =>
      B2Vec2JSAdapter._(_impl.get_m_nextVertex());
  void set_m_nextVertex(B2Vec2JSAdapter arg0) =>
      _impl.set_m_nextVertex(arg0._impl);
  B2ShapeType get_m_type() => _impl.get_m_type();
  void set_m_type(B2ShapeType arg0) => _impl.set_m_type(arg0);
  double get_m_radius() => _impl.get_m_radius().toDouble();
  void set_m_radius(double arg0) => _impl.set_m_radius(arg0);
  void dispose() => _impl.__destroy__();
}

class B2ColorJSAdapter implements B2ColorPlatform {
  B2ColorJSAdapter._(B2ColorJSImpl impl) : _impl = impl;

  final B2ColorJSImpl _impl;

  B2ColorJSAdapter() : _impl = B2ColorJSImpl();

  B2ColorJSAdapter.from3(double r, double g, double b)
      : _impl = B2ColorJSImpl.from3(r, g, b);

  void set(double ri, double gi, double bi) => _impl.Set(ri, gi, bi);
  double get_r() => _impl.get_r().toDouble();
  void set_r(double arg0) => _impl.set_r(arg0);
  double get_g() => _impl.get_g().toDouble();
  void set_g(double arg0) => _impl.set_g(arg0);
  double get_b() => _impl.get_b().toDouble();
  void set_b(double arg0) => _impl.set_b(arg0);
  void dispose() => _impl.__destroy__();
}

class B2ContactEdgeJSAdapter implements B2ContactEdgePlatform {
  B2ContactEdgeJSAdapter._(B2ContactEdgeJSImpl impl) : _impl = impl;

  final B2ContactEdgeJSImpl _impl;

  B2ContactEdgeJSAdapter() : _impl = B2ContactEdgeJSImpl();

  B2BodyJSAdapter get_other() => B2BodyJSAdapter._(_impl.get_other());
  void set_other(B2BodyJSAdapter arg0) => _impl.set_other(arg0._impl);
  B2ContactJSAdapter get_contact() => B2ContactJSAdapter._(_impl.get_contact());
  void set_contact(B2ContactJSAdapter arg0) => _impl.set_contact(arg0._impl);
  B2ContactEdgeJSAdapter get_prev() =>
      B2ContactEdgeJSAdapter._(_impl.get_prev());
  void set_prev(B2ContactEdgeJSAdapter arg0) => _impl.set_prev(arg0._impl);
  B2ContactEdgeJSAdapter get_next() =>
      B2ContactEdgeJSAdapter._(_impl.get_next());
  void set_next(B2ContactEdgeJSAdapter arg0) => _impl.set_next(arg0._impl);
  void dispose() => _impl.__destroy__();
}

class B2ContactFeatureJSAdapter implements B2ContactFeaturePlatform {
  B2ContactFeatureJSAdapter._(B2ContactFeatureJSImpl impl) : _impl = impl;

  final B2ContactFeatureJSImpl _impl;

  int get_indexA() => _impl.get_indexA();
  void set_indexA(int arg0) => _impl.set_indexA(arg0);
  int get_indexB() => _impl.get_indexB();
  void set_indexB(int arg0) => _impl.set_indexB(arg0);
  int get_typeA() => _impl.get_typeA();
  void set_typeA(int arg0) => _impl.set_typeA(arg0);
  int get_typeB() => _impl.get_typeB();
  void set_typeB(int arg0) => _impl.set_typeB(arg0);
  void dispose() => _impl.__destroy__();
}

class B2ContactFilterJSAdapter implements B2ContactFilterPlatform {
  B2ContactFilterJSAdapter._(B2ContactFilterJSImpl impl) : _impl = impl;

  final B2ContactFilterJSImpl _impl;

  void dispose() => _impl.__destroy__();
}

class JSContactFilterJSAdapter implements JSContactFilterPlatform {
  JSContactFilterJSAdapter._(JSContactFilterJSImpl impl) : _impl = impl;

  final JSContactFilterJSImpl _impl;

  JSContactFilterJSAdapter() : _impl = JSContactFilterJSImpl();

  bool shouldCollide(
          B2FixtureJSAdapter fixtureA, B2FixtureJSAdapter fixtureB) =>
      _impl.ShouldCollide(fixtureA._impl, fixtureB._impl);
  void dispose() => _impl.__destroy__();
}

class B2ContactIDJSAdapter implements B2ContactIDPlatform {
  B2ContactIDJSAdapter._(B2ContactIDJSImpl impl) : _impl = impl;

  final B2ContactIDJSImpl _impl;

  B2ContactFeatureJSAdapter get_cf() =>
      B2ContactFeatureJSAdapter._(_impl.get_cf());
  void set_cf(B2ContactFeatureJSAdapter arg0) => _impl.set_cf(arg0._impl);
  int get_key() => _impl.get_key();
  void set_key(int arg0) => _impl.set_key(arg0);
  void dispose() => _impl.__destroy__();
}

class B2ContactImpulseJSAdapter implements B2ContactImpulsePlatform {
  B2ContactImpulseJSAdapter._(B2ContactImpulseJSImpl impl) : _impl = impl;

  final B2ContactImpulseJSImpl _impl;

  double get_normalImpulses(int arg0) =>
      _impl.get_normalImpulses(arg0).toDouble();
  void set_normalImpulses(int arg0, double arg1) =>
      _impl.set_normalImpulses(arg0, arg1);
  double get_tangentImpulses(int arg0) =>
      _impl.get_tangentImpulses(arg0).toDouble();
  void set_tangentImpulses(int arg0, double arg1) =>
      _impl.set_tangentImpulses(arg0, arg1);
  int get_count() => _impl.get_count().toInt();
  void set_count(int arg0) => _impl.set_count(arg0);
  void dispose() => _impl.__destroy__();
}

class B2DestructionListenerJSAdapter implements B2DestructionListenerPlatform {
  B2DestructionListenerJSAdapter._(B2DestructionListenerJSImpl impl)
      : _impl = impl;

  final B2DestructionListenerJSImpl _impl;

  void dispose() => _impl.__destroy__();
}

class B2DestructionListenerWrapperJSAdapter
    implements B2DestructionListenerWrapperPlatform {
  B2DestructionListenerWrapperJSAdapter._(
      B2DestructionListenerWrapperJSImpl impl)
      : _impl = impl;

  final B2DestructionListenerWrapperJSImpl _impl;

  void dispose() => _impl.__destroy__();
}

class JSDestructionListenerJSAdapter implements JSDestructionListenerPlatform {
  JSDestructionListenerJSAdapter._(JSDestructionListenerJSImpl impl)
      : _impl = impl;

  final JSDestructionListenerJSImpl _impl;

  JSDestructionListenerJSAdapter() : _impl = JSDestructionListenerJSImpl();

  void sayGoodbyeJoint(B2JointJSAdapter joint) =>
      _impl.SayGoodbyeJoint(joint._impl);
  void sayGoodbyeFixture(B2FixtureJSAdapter joint) =>
      _impl.SayGoodbyeFixture(joint._impl);
  void dispose() => _impl.__destroy__();
}

class B2DistanceJointJSAdapter
    implements B2DistanceJointPlatform, B2JointJSAdapter {
  B2DistanceJointJSAdapter._(B2DistanceJointJSImpl impl) : _impl = impl;

  final B2DistanceJointJSImpl _impl;

  B2Vec2JSAdapter getLocalAnchorA() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorA());
  B2Vec2JSAdapter getLocalAnchorB() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorB());
  double getLength() => _impl.GetLength().toDouble();
  void setLength(double length) => _impl.SetLength(length);
  double getMinLength() => _impl.GetMinLength().toDouble();
  void setMinLength(double minLength) => _impl.SetMinLength(minLength);
  double getMaxLength() => _impl.GetMaxLength().toDouble();
  void setMaxLength(double maxLength) => _impl.SetMaxLength(maxLength);
  double getCurrentLength() => _impl.GetCurrentLength().toDouble();
  void setStiffness(double stiffness) => _impl.SetStiffness(stiffness);
  double getStiffness() => _impl.GetStiffness().toDouble();
  void setDamping(double damping) => _impl.SetDamping(damping);
  double getDamping() => _impl.GetDamping().toDouble();
  void dump() => _impl.Dump();
  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dispose() => _impl.__destroy__();
}

class B2DistanceJointDefJSAdapter
    implements B2DistanceJointDefPlatform, B2JointDefJSAdapter {
  B2DistanceJointDefJSAdapter._(B2DistanceJointDefJSImpl impl) : _impl = impl;

  final B2DistanceJointDefJSImpl _impl;

  B2DistanceJointDefJSAdapter() : _impl = B2DistanceJointDefJSImpl();

  void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB,
          B2Vec2JSAdapter anchorA, B2Vec2JSAdapter anchorB) =>
      _impl.Initialize(bodyA._impl, bodyB._impl, anchorA._impl, anchorB._impl);
  B2Vec2JSAdapter get_localAnchorA() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorA());
  void set_localAnchorA(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorA(arg0._impl);
  B2Vec2JSAdapter get_localAnchorB() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorB());
  void set_localAnchorB(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorB(arg0._impl);
  double get_length() => _impl.get_length().toDouble();
  void set_length(double arg0) => _impl.set_length(arg0);
  double get_minLength() => _impl.get_minLength().toDouble();
  void set_minLength(double arg0) => _impl.set_minLength(arg0);
  double get_maxLength() => _impl.get_maxLength().toDouble();
  void set_maxLength(double arg0) => _impl.set_maxLength(arg0);
  double get_stiffness() => _impl.get_stiffness().toDouble();
  void set_stiffness(double arg0) => _impl.set_stiffness(arg0);
  double get_damping() => _impl.get_damping().toDouble();
  void set_damping(double arg0) => _impl.set_damping(arg0);
  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2DrawJSAdapter implements B2DrawPlatform {
  B2DrawJSAdapter._(B2DrawJSImpl impl) : _impl = impl;

  final B2DrawJSImpl _impl;

  void setFlags(int flags) => _impl.SetFlags(flags);
  int getFlags() => _impl.GetFlags();
  void appendFlags(int flags) => _impl.AppendFlags(flags);
  void clearFlags(int flags) => _impl.ClearFlags(flags);
  void dispose() => _impl.__destroy__();
}

class JSDrawJSAdapter implements JSDrawPlatform {
  JSDrawJSAdapter._(JSDrawJSImpl impl) : _impl = impl;

  final JSDrawJSImpl _impl;

  JSDrawJSAdapter() : _impl = JSDrawJSImpl();

  void drawPolygon(
          B2Vec2JSAdapter vertices, int vertexCount, B2ColorJSAdapter color) =>
      _impl.DrawPolygon(vertices._impl, vertexCount, color._impl);
  void drawSolidPolygon(
          B2Vec2JSAdapter vertices, int vertexCount, B2ColorJSAdapter color) =>
      _impl.DrawSolidPolygon(vertices._impl, vertexCount, color._impl);
  void drawCircle(
          B2Vec2JSAdapter center, double radius, B2ColorJSAdapter color) =>
      _impl.DrawCircle(center._impl, radius, color._impl);
  void drawSolidCircle(B2Vec2JSAdapter center, double radius,
          B2Vec2JSAdapter axis, B2ColorJSAdapter color) =>
      _impl.DrawSolidCircle(center._impl, radius, axis._impl, color._impl);
  void drawSegment(
          B2Vec2JSAdapter p1, B2Vec2JSAdapter p2, B2ColorJSAdapter color) =>
      _impl.DrawSegment(p1._impl, p2._impl, color._impl);
  void drawTransform(B2TransformJSAdapter xf) => _impl.DrawTransform(xf._impl);
  void drawPoint(B2Vec2JSAdapter p, double size, B2ColorJSAdapter color) =>
      _impl.DrawPoint(p._impl, size, color._impl);
  void dispose() => _impl.__destroy__();
}

class B2FrictionJointJSAdapter
    implements B2FrictionJointPlatform, B2JointJSAdapter {
  B2FrictionJointJSAdapter._(B2FrictionJointJSImpl impl) : _impl = impl;

  final B2FrictionJointJSImpl _impl;

  B2Vec2JSAdapter getLocalAnchorA() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorA());
  B2Vec2JSAdapter getLocalAnchorB() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorB());
  void setMaxForce(double force) => _impl.SetMaxForce(force);
  double getMaxForce() => _impl.GetMaxForce().toDouble();
  void setMaxTorque(double torque) => _impl.SetMaxTorque(torque);
  double getMaxTorque() => _impl.GetMaxTorque().toDouble();
  void dump() => _impl.Dump();
  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dispose() => _impl.__destroy__();
}

class B2FrictionJointDefJSAdapter
    implements B2FrictionJointDefPlatform, B2JointDefJSAdapter {
  B2FrictionJointDefJSAdapter._(B2FrictionJointDefJSImpl impl) : _impl = impl;

  final B2FrictionJointDefJSImpl _impl;

  B2FrictionJointDefJSAdapter() : _impl = B2FrictionJointDefJSImpl();

  void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB,
          B2Vec2JSAdapter anchor) =>
      _impl.Initialize(bodyA._impl, bodyB._impl, anchor._impl);
  B2Vec2JSAdapter get_localAnchorA() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorA());
  void set_localAnchorA(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorA(arg0._impl);
  B2Vec2JSAdapter get_localAnchorB() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorB());
  void set_localAnchorB(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorB(arg0._impl);
  double get_maxForce() => _impl.get_maxForce().toDouble();
  void set_maxForce(double arg0) => _impl.set_maxForce(arg0);
  double get_maxTorque() => _impl.get_maxTorque().toDouble();
  void set_maxTorque(double arg0) => _impl.set_maxTorque(arg0);
  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2GearJointJSAdapter implements B2GearJointPlatform, B2JointJSAdapter {
  B2GearJointJSAdapter._(B2GearJointJSImpl impl) : _impl = impl;

  final B2GearJointJSImpl _impl;

  B2JointJSAdapter getJoint1() => B2JointJSAdapter._(_impl.GetJoint1());
  B2JointJSAdapter getJoint2() => B2JointJSAdapter._(_impl.GetJoint2());
  void setRatio(double ratio) => _impl.SetRatio(ratio);
  double getRatio() => _impl.GetRatio().toDouble();
  void dump() => _impl.Dump();
  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dispose() => _impl.__destroy__();
}

class B2GearJointDefJSAdapter
    implements B2GearJointDefPlatform, B2JointDefJSAdapter {
  B2GearJointDefJSAdapter._(B2GearJointDefJSImpl impl) : _impl = impl;

  final B2GearJointDefJSImpl _impl;

  B2GearJointDefJSAdapter() : _impl = B2GearJointDefJSImpl();

  B2JointJSAdapter get_joint1() => B2JointJSAdapter._(_impl.get_joint1());
  void set_joint1(B2JointJSAdapter arg0) => _impl.set_joint1(arg0._impl);
  B2JointJSAdapter get_joint2() => B2JointJSAdapter._(_impl.get_joint2());
  void set_joint2(B2JointJSAdapter arg0) => _impl.set_joint2(arg0._impl);
  double get_ratio() => _impl.get_ratio().toDouble();
  void set_ratio(double arg0) => _impl.set_ratio(arg0);
  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2JointEdgeJSAdapter implements B2JointEdgePlatform {
  B2JointEdgeJSAdapter._(B2JointEdgeJSImpl impl) : _impl = impl;

  final B2JointEdgeJSImpl _impl;

  B2JointEdgeJSAdapter() : _impl = B2JointEdgeJSImpl();

  B2BodyJSAdapter get_other() => B2BodyJSAdapter._(_impl.get_other());
  void set_other(B2BodyJSAdapter arg0) => _impl.set_other(arg0._impl);
  B2JointJSAdapter get_joint() => B2JointJSAdapter._(_impl.get_joint());
  void set_joint(B2JointJSAdapter arg0) => _impl.set_joint(arg0._impl);
  B2JointEdgeJSAdapter get_prev() => B2JointEdgeJSAdapter._(_impl.get_prev());
  void set_prev(B2JointEdgeJSAdapter arg0) => _impl.set_prev(arg0._impl);
  B2JointEdgeJSAdapter get_next() => B2JointEdgeJSAdapter._(_impl.get_next());
  void set_next(B2JointEdgeJSAdapter arg0) => _impl.set_next(arg0._impl);
  void dispose() => _impl.__destroy__();
}

class B2ManifoldJSAdapter implements B2ManifoldPlatform {
  B2ManifoldJSAdapter._(B2ManifoldJSImpl impl) : _impl = impl;

  final B2ManifoldJSImpl _impl;

  B2ManifoldJSAdapter() : _impl = B2ManifoldJSImpl();

  B2ManifoldPointJSAdapter get_points(int arg0) =>
      B2ManifoldPointJSAdapter._(_impl.get_points(arg0));
  void set_points(int arg0, B2ManifoldPointJSAdapter arg1) =>
      _impl.set_points(arg0, arg1._impl);
  B2Vec2JSAdapter get_localNormal() =>
      B2Vec2JSAdapter._(_impl.get_localNormal());
  void set_localNormal(B2Vec2JSAdapter arg0) =>
      _impl.set_localNormal(arg0._impl);
  B2Vec2JSAdapter get_localPoint() => B2Vec2JSAdapter._(_impl.get_localPoint());
  void set_localPoint(B2Vec2JSAdapter arg0) => _impl.set_localPoint(arg0._impl);
  B2ManifoldType get_type() => _impl.get_type();
  void set_type(B2ManifoldType arg0) => _impl.set_type(arg0);
  int get_pointCount() => _impl.get_pointCount().toInt();
  void set_pointCount(int arg0) => _impl.set_pointCount(arg0);
  void dispose() => _impl.__destroy__();
}

class B2WorldManifoldJSAdapter implements B2WorldManifoldPlatform {
  B2WorldManifoldJSAdapter._(B2WorldManifoldJSImpl impl) : _impl = impl;

  final B2WorldManifoldJSImpl _impl;

  B2WorldManifoldJSAdapter() : _impl = B2WorldManifoldJSImpl();

  void initialize(B2ManifoldJSAdapter manifold, B2TransformJSAdapter xfA,
          double radiusA, B2TransformJSAdapter xfB, double radiusB) =>
      _impl.Initialize(manifold._impl, xfA._impl, radiusA, xfB._impl, radiusB);
  B2Vec2JSAdapter get_normal() => B2Vec2JSAdapter._(_impl.get_normal());
  void set_normal(B2Vec2JSAdapter arg0) => _impl.set_normal(arg0._impl);
  B2Vec2JSAdapter get_points(int arg0) =>
      B2Vec2JSAdapter._(_impl.get_points(arg0));
  void set_points(int arg0, B2Vec2JSAdapter arg1) =>
      _impl.set_points(arg0, arg1._impl);
  double get_separations(int arg0) => _impl.get_separations(arg0).toDouble();
  void set_separations(int arg0, double arg1) =>
      _impl.set_separations(arg0, arg1);
  void dispose() => _impl.__destroy__();
}

class B2ManifoldPointJSAdapter implements B2ManifoldPointPlatform {
  B2ManifoldPointJSAdapter._(B2ManifoldPointJSImpl impl) : _impl = impl;

  final B2ManifoldPointJSImpl _impl;

  B2ManifoldPointJSAdapter() : _impl = B2ManifoldPointJSImpl();

  B2Vec2JSAdapter get_localPoint() => B2Vec2JSAdapter._(_impl.get_localPoint());
  void set_localPoint(B2Vec2JSAdapter arg0) => _impl.set_localPoint(arg0._impl);
  double get_normalImpulse() => _impl.get_normalImpulse().toDouble();
  void set_normalImpulse(double arg0) => _impl.set_normalImpulse(arg0);
  double get_tangentImpulse() => _impl.get_tangentImpulse().toDouble();
  void set_tangentImpulse(double arg0) => _impl.set_tangentImpulse(arg0);
  B2ContactIDJSAdapter get_id() => B2ContactIDJSAdapter._(_impl.get_id());
  void set_id(B2ContactIDJSAdapter arg0) => _impl.set_id(arg0._impl);
  void dispose() => _impl.__destroy__();
}

class B2Mat22JSAdapter implements B2Mat22Platform {
  B2Mat22JSAdapter._(B2Mat22JSImpl impl) : _impl = impl;

  final B2Mat22JSImpl _impl;

  B2Mat22JSAdapter() : _impl = B2Mat22JSImpl();

  B2Mat22JSAdapter.from2(B2Vec2JSAdapter a11, B2Vec2JSAdapter a12)
      : _impl = B2Mat22JSImpl.from2(a11._impl, a12._impl);

  B2Mat22JSAdapter.from4(double a11, double a12, double a21, double a22)
      : _impl = B2Mat22JSImpl.from4(a11, a12, a21, a22);

  void set(B2Vec2JSAdapter c1, B2Vec2JSAdapter c2) =>
      _impl.Set(c1._impl, c2._impl);
  void setIdentity() => _impl.SetIdentity();
  void setZero() => _impl.SetZero();
  B2Mat22JSAdapter getInverse() => B2Mat22JSAdapter._(_impl.GetInverse());
  B2Vec2JSAdapter solve(B2Vec2JSAdapter b) =>
      B2Vec2JSAdapter._(_impl.Solve(b._impl));
  B2Vec2JSAdapter get_ex() => B2Vec2JSAdapter._(_impl.get_ex());
  void set_ex(B2Vec2JSAdapter arg0) => _impl.set_ex(arg0._impl);
  B2Vec2JSAdapter get_ey() => B2Vec2JSAdapter._(_impl.get_ey());
  void set_ey(B2Vec2JSAdapter arg0) => _impl.set_ey(arg0._impl);
  void dispose() => _impl.__destroy__();
}

class B2Mat33JSAdapter implements B2Mat33Platform {
  B2Mat33JSAdapter._(B2Mat33JSImpl impl) : _impl = impl;

  final B2Mat33JSImpl _impl;

  B2Mat33JSAdapter() : _impl = B2Mat33JSImpl();

  B2Mat33JSAdapter.from3(
      B2Vec3JSAdapter c1, B2Vec3JSAdapter c2, B2Vec3JSAdapter c3)
      : _impl = B2Mat33JSImpl.from3(c1._impl, c2._impl, c3._impl);

  void setZero() => _impl.SetZero();
  B2Vec3JSAdapter solve33(B2Vec3JSAdapter b) =>
      B2Vec3JSAdapter._(_impl.Solve33(b._impl));
  B2Vec2JSAdapter solve22(B2Vec2JSAdapter b) =>
      B2Vec2JSAdapter._(_impl.Solve22(b._impl));
  void getInverse22(B2Mat33JSAdapter M) => _impl.GetInverse22(M._impl);
  void getSymInverse33(B2Mat33JSAdapter M) => _impl.GetSymInverse33(M._impl);
  B2Vec3JSAdapter get_ex() => B2Vec3JSAdapter._(_impl.get_ex());
  void set_ex(B2Vec3JSAdapter arg0) => _impl.set_ex(arg0._impl);
  B2Vec3JSAdapter get_ey() => B2Vec3JSAdapter._(_impl.get_ey());
  void set_ey(B2Vec3JSAdapter arg0) => _impl.set_ey(arg0._impl);
  B2Vec3JSAdapter get_ez() => B2Vec3JSAdapter._(_impl.get_ez());
  void set_ez(B2Vec3JSAdapter arg0) => _impl.set_ez(arg0._impl);
  void dispose() => _impl.__destroy__();
}

class B2MouseJointJSAdapter implements B2MouseJointPlatform, B2JointJSAdapter {
  B2MouseJointJSAdapter._(B2MouseJointJSImpl impl) : _impl = impl;

  final B2MouseJointJSImpl _impl;

  void setTarget(B2Vec2JSAdapter target) => _impl.SetTarget(target._impl);
  B2Vec2JSAdapter getTarget() => B2Vec2JSAdapter._(_impl.GetTarget());
  void setMaxForce(double force) => _impl.SetMaxForce(force);
  double getMaxForce() => _impl.GetMaxForce().toDouble();
  void setStiffness(double stiffness) => _impl.SetStiffness(stiffness);
  double getStiffness() => _impl.GetStiffness().toDouble();
  void setDamping(double damping) => _impl.SetDamping(damping);
  double getDamping() => _impl.GetDamping().toDouble();
  void dump() => _impl.Dump();
  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dispose() => _impl.__destroy__();
}

class B2MouseJointDefJSAdapter
    implements B2MouseJointDefPlatform, B2JointDefJSAdapter {
  B2MouseJointDefJSAdapter._(B2MouseJointDefJSImpl impl) : _impl = impl;

  final B2MouseJointDefJSImpl _impl;

  B2MouseJointDefJSAdapter() : _impl = B2MouseJointDefJSImpl();

  B2Vec2JSAdapter get_target() => B2Vec2JSAdapter._(_impl.get_target());
  void set_target(B2Vec2JSAdapter arg0) => _impl.set_target(arg0._impl);
  double get_maxForce() => _impl.get_maxForce().toDouble();
  void set_maxForce(double arg0) => _impl.set_maxForce(arg0);
  double get_stiffness() => _impl.get_stiffness().toDouble();
  void set_stiffness(double arg0) => _impl.set_stiffness(arg0);
  double get_damping() => _impl.get_damping().toDouble();
  void set_damping(double arg0) => _impl.set_damping(arg0);
  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2PolygonShapeJSAdapter
    implements B2PolygonShapePlatform, B2ShapeJSAdapter {
  B2PolygonShapeJSAdapter._(B2PolygonShapeJSImpl impl) : _impl = impl;

  final B2PolygonShapeJSImpl _impl;

  B2PolygonShapeJSAdapter() : _impl = B2PolygonShapeJSImpl();

  void set(B2Vec2JSAdapter vertices, int vertexCount) =>
      _impl.Set(vertices._impl, vertexCount);
  void setAsBox2(double hx, double hy) => _impl.SetAsBox(hx, hy, null, null);
  void setAsBox4(double hx, double hy, B2Vec2JSAdapter center, double angle) =>
      _impl.SetAsBox(hx, hy, center._impl, angle);
  B2ShapeType getType() => _impl.GetType();
  int getChildCount() => _impl.GetChildCount().toInt();
  bool testPoint(B2TransformJSAdapter xf, B2Vec2JSAdapter p) =>
      _impl.TestPoint(xf._impl, p._impl);
  bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input,
          B2TransformJSAdapter transform, int childIndex) =>
      _impl.RayCast(output._impl, input._impl, transform._impl, childIndex);
  void computeAABB(
          B2AABBJSAdapter aabb, B2TransformJSAdapter xf, int childIndex) =>
      _impl.ComputeAABB(aabb._impl, xf._impl, childIndex);
  void computeMass(B2MassDataJSAdapter massData, double density) =>
      _impl.ComputeMass(massData._impl, density);
  B2Vec2JSAdapter get_m_centroid() => B2Vec2JSAdapter._(_impl.get_m_centroid());
  void set_m_centroid(B2Vec2JSAdapter arg0) => _impl.set_m_centroid(arg0._impl);
  B2Vec2JSAdapter get_m_vertices(int arg0) =>
      B2Vec2JSAdapter._(_impl.get_m_vertices(arg0));
  void set_m_vertices(int arg0, B2Vec2JSAdapter arg1) =>
      _impl.set_m_vertices(arg0, arg1._impl);
  B2Vec2JSAdapter get_m_normals(int arg0) =>
      B2Vec2JSAdapter._(_impl.get_m_normals(arg0));
  void set_m_normals(int arg0, B2Vec2JSAdapter arg1) =>
      _impl.set_m_normals(arg0, arg1._impl);
  int get_m_count() => _impl.get_m_count().toInt();
  void set_m_count(int arg0) => _impl.set_m_count(arg0);
  B2ShapeType get_m_type() => _impl.get_m_type();
  void set_m_type(B2ShapeType arg0) => _impl.set_m_type(arg0);
  double get_m_radius() => _impl.get_m_radius().toDouble();
  void set_m_radius(double arg0) => _impl.set_m_radius(arg0);
  void dispose() => _impl.__destroy__();
}

class B2PrismaticJointJSAdapter
    implements B2PrismaticJointPlatform, B2JointJSAdapter {
  B2PrismaticJointJSAdapter._(B2PrismaticJointJSImpl impl) : _impl = impl;

  final B2PrismaticJointJSImpl _impl;

  B2Vec2JSAdapter getLocalAnchorA() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorA());
  B2Vec2JSAdapter getLocalAnchorB() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorB());
  B2Vec2JSAdapter getLocalAxisA() => B2Vec2JSAdapter._(_impl.GetLocalAxisA());
  double getReferenceAngle() => _impl.GetReferenceAngle().toDouble();
  double getJointTranslation() => _impl.GetJointTranslation().toDouble();
  double getJointSpeed() => _impl.GetJointSpeed().toDouble();
  bool isLimitEnabled() => _impl.IsLimitEnabled();
  void enableLimit(bool flag) => _impl.EnableLimit(flag);
  double getLowerLimit() => _impl.GetLowerLimit().toDouble();
  double getUpperLimit() => _impl.GetUpperLimit().toDouble();
  void setLimits(double lower, double upper) => _impl.SetLimits(lower, upper);
  bool isMotorEnabled() => _impl.IsMotorEnabled();
  void enableMotor(bool flag) => _impl.EnableMotor(flag);
  void setMotorSpeed(double speed) => _impl.SetMotorSpeed(speed);
  double getMotorSpeed() => _impl.GetMotorSpeed().toDouble();
  void setMaxMotorForce(double force) => _impl.SetMaxMotorForce(force);
  double getMaxMotorForce() => _impl.GetMaxMotorForce().toDouble();
  double getMotorForce(double inv_dt) => _impl.GetMotorForce(inv_dt).toDouble();
  void dump() => _impl.Dump();
  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dispose() => _impl.__destroy__();
}

class B2PrismaticJointDefJSAdapter
    implements B2PrismaticJointDefPlatform, B2JointDefJSAdapter {
  B2PrismaticJointDefJSAdapter._(B2PrismaticJointDefJSImpl impl) : _impl = impl;

  final B2PrismaticJointDefJSImpl _impl;

  B2PrismaticJointDefJSAdapter() : _impl = B2PrismaticJointDefJSImpl();

  void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB,
          B2Vec2JSAdapter anchor, B2Vec2JSAdapter axis) =>
      _impl.Initialize(bodyA._impl, bodyB._impl, anchor._impl, axis._impl);
  B2Vec2JSAdapter get_localAnchorA() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorA());
  void set_localAnchorA(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorA(arg0._impl);
  B2Vec2JSAdapter get_localAnchorB() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorB());
  void set_localAnchorB(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorB(arg0._impl);
  B2Vec2JSAdapter get_localAxisA() => B2Vec2JSAdapter._(_impl.get_localAxisA());
  void set_localAxisA(B2Vec2JSAdapter arg0) => _impl.set_localAxisA(arg0._impl);
  double get_referenceAngle() => _impl.get_referenceAngle().toDouble();
  void set_referenceAngle(double arg0) => _impl.set_referenceAngle(arg0);
  bool get_enableLimit() => _impl.get_enableLimit();
  void set_enableLimit(bool arg0) => _impl.set_enableLimit(arg0);
  double get_lowerTranslation() => _impl.get_lowerTranslation().toDouble();
  void set_lowerTranslation(double arg0) => _impl.set_lowerTranslation(arg0);
  double get_upperTranslation() => _impl.get_upperTranslation().toDouble();
  void set_upperTranslation(double arg0) => _impl.set_upperTranslation(arg0);
  bool get_enableMotor() => _impl.get_enableMotor();
  void set_enableMotor(bool arg0) => _impl.set_enableMotor(arg0);
  double get_maxMotorForce() => _impl.get_maxMotorForce().toDouble();
  void set_maxMotorForce(double arg0) => _impl.set_maxMotorForce(arg0);
  double get_motorSpeed() => _impl.get_motorSpeed().toDouble();
  void set_motorSpeed(double arg0) => _impl.set_motorSpeed(arg0);
  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2ProfileJSAdapter implements B2ProfilePlatform {
  B2ProfileJSAdapter._(B2ProfileJSImpl impl) : _impl = impl;

  final B2ProfileJSImpl _impl;

  double get_step() => _impl.get_step().toDouble();
  void set_step(double arg0) => _impl.set_step(arg0);
  double get_collide() => _impl.get_collide().toDouble();
  void set_collide(double arg0) => _impl.set_collide(arg0);
  double get_solve() => _impl.get_solve().toDouble();
  void set_solve(double arg0) => _impl.set_solve(arg0);
  double get_solveInit() => _impl.get_solveInit().toDouble();
  void set_solveInit(double arg0) => _impl.set_solveInit(arg0);
  double get_solveVelocity() => _impl.get_solveVelocity().toDouble();
  void set_solveVelocity(double arg0) => _impl.set_solveVelocity(arg0);
  double get_solvePosition() => _impl.get_solvePosition().toDouble();
  void set_solvePosition(double arg0) => _impl.set_solvePosition(arg0);
  double get_broadphase() => _impl.get_broadphase().toDouble();
  void set_broadphase(double arg0) => _impl.set_broadphase(arg0);
  double get_solveTOI() => _impl.get_solveTOI().toDouble();
  void set_solveTOI(double arg0) => _impl.set_solveTOI(arg0);
  void dispose() => _impl.__destroy__();
}

class B2PulleyJointJSAdapter
    implements B2PulleyJointPlatform, B2JointJSAdapter {
  B2PulleyJointJSAdapter._(B2PulleyJointJSImpl impl) : _impl = impl;

  final B2PulleyJointJSImpl _impl;

  B2Vec2JSAdapter getGroundAnchorA() =>
      B2Vec2JSAdapter._(_impl.GetGroundAnchorA());
  B2Vec2JSAdapter getGroundAnchorB() =>
      B2Vec2JSAdapter._(_impl.GetGroundAnchorB());
  double getLengthA() => _impl.GetLengthA().toDouble();
  double getLengthB() => _impl.GetLengthB().toDouble();
  double getRatio() => _impl.GetRatio().toDouble();
  double getCurrentLengthA() => _impl.GetCurrentLengthA().toDouble();
  double getCurrentLengthB() => _impl.GetCurrentLengthB().toDouble();
  void dump() => _impl.Dump();
  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dispose() => _impl.__destroy__();
}

class B2PulleyJointDefJSAdapter
    implements B2PulleyJointDefPlatform, B2JointDefJSAdapter {
  B2PulleyJointDefJSAdapter._(B2PulleyJointDefJSImpl impl) : _impl = impl;

  final B2PulleyJointDefJSImpl _impl;

  B2PulleyJointDefJSAdapter() : _impl = B2PulleyJointDefJSImpl();

  void initialize(
          B2BodyJSAdapter bodyA,
          B2BodyJSAdapter bodyB,
          B2Vec2JSAdapter groundAnchorA,
          B2Vec2JSAdapter groundAnchorB,
          B2Vec2JSAdapter anchorA,
          B2Vec2JSAdapter anchorB,
          double ratio) =>
      _impl.Initialize(bodyA._impl, bodyB._impl, groundAnchorA._impl,
          groundAnchorB._impl, anchorA._impl, anchorB._impl, ratio);
  B2Vec2JSAdapter get_groundAnchorA() =>
      B2Vec2JSAdapter._(_impl.get_groundAnchorA());
  void set_groundAnchorA(B2Vec2JSAdapter arg0) =>
      _impl.set_groundAnchorA(arg0._impl);
  B2Vec2JSAdapter get_groundAnchorB() =>
      B2Vec2JSAdapter._(_impl.get_groundAnchorB());
  void set_groundAnchorB(B2Vec2JSAdapter arg0) =>
      _impl.set_groundAnchorB(arg0._impl);
  B2Vec2JSAdapter get_localAnchorA() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorA());
  void set_localAnchorA(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorA(arg0._impl);
  B2Vec2JSAdapter get_localAnchorB() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorB());
  void set_localAnchorB(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorB(arg0._impl);
  double get_lengthA() => _impl.get_lengthA().toDouble();
  void set_lengthA(double arg0) => _impl.set_lengthA(arg0);
  double get_lengthB() => _impl.get_lengthB().toDouble();
  void set_lengthB(double arg0) => _impl.set_lengthB(arg0);
  double get_ratio() => _impl.get_ratio().toDouble();
  void set_ratio(double arg0) => _impl.set_ratio(arg0);
  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2RayCastInputJSAdapter implements B2RayCastInputPlatform {
  B2RayCastInputJSAdapter._(B2RayCastInputJSImpl impl) : _impl = impl;

  final B2RayCastInputJSImpl _impl;

  B2Vec2JSAdapter get_p1() => B2Vec2JSAdapter._(_impl.get_p1());
  void set_p1(B2Vec2JSAdapter arg0) => _impl.set_p1(arg0._impl);
  B2Vec2JSAdapter get_p2() => B2Vec2JSAdapter._(_impl.get_p2());
  void set_p2(B2Vec2JSAdapter arg0) => _impl.set_p2(arg0._impl);
  double get_maxFraction() => _impl.get_maxFraction().toDouble();
  void set_maxFraction(double arg0) => _impl.set_maxFraction(arg0);
  void dispose() => _impl.__destroy__();
}

class B2RayCastOutputJSAdapter implements B2RayCastOutputPlatform {
  B2RayCastOutputJSAdapter._(B2RayCastOutputJSImpl impl) : _impl = impl;

  final B2RayCastOutputJSImpl _impl;

  B2Vec2JSAdapter get_normal() => B2Vec2JSAdapter._(_impl.get_normal());
  void set_normal(B2Vec2JSAdapter arg0) => _impl.set_normal(arg0._impl);
  double get_fraction() => _impl.get_fraction().toDouble();
  void set_fraction(double arg0) => _impl.set_fraction(arg0);
  void dispose() => _impl.__destroy__();
}

class B2RevoluteJointJSAdapter
    implements B2RevoluteJointPlatform, B2JointJSAdapter {
  B2RevoluteJointJSAdapter._(B2RevoluteJointJSImpl impl) : _impl = impl;

  final B2RevoluteJointJSImpl _impl;

  B2Vec2JSAdapter getLocalAnchorA() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorA());
  B2Vec2JSAdapter getLocalAnchorB() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorB());
  double getReferenceAngle() => _impl.GetReferenceAngle().toDouble();
  double getJointAngle() => _impl.GetJointAngle().toDouble();
  double getJointSpeed() => _impl.GetJointSpeed().toDouble();
  bool isLimitEnabled() => _impl.IsLimitEnabled();
  void enableLimit(bool flag) => _impl.EnableLimit(flag);
  double getLowerLimit() => _impl.GetLowerLimit().toDouble();
  double getUpperLimit() => _impl.GetUpperLimit().toDouble();
  void setLimits(double lower, double upper) => _impl.SetLimits(lower, upper);
  bool isMotorEnabled() => _impl.IsMotorEnabled();
  void enableMotor(bool flag) => _impl.EnableMotor(flag);
  void setMotorSpeed(double speed) => _impl.SetMotorSpeed(speed);
  double getMotorSpeed() => _impl.GetMotorSpeed().toDouble();
  void setMaxMotorTorque(double torque) => _impl.SetMaxMotorTorque(torque);
  double getMaxMotorTorque() => _impl.GetMaxMotorTorque().toDouble();
  double getMotorTorque(double inv_dt) =>
      _impl.GetMotorTorque(inv_dt).toDouble();
  void dump() => _impl.Dump();
  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dispose() => _impl.__destroy__();
}

class B2RevoluteJointDefJSAdapter
    implements B2RevoluteJointDefPlatform, B2JointDefJSAdapter {
  B2RevoluteJointDefJSAdapter._(B2RevoluteJointDefJSImpl impl) : _impl = impl;

  final B2RevoluteJointDefJSImpl _impl;

  B2RevoluteJointDefJSAdapter() : _impl = B2RevoluteJointDefJSImpl();

  void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB,
          B2Vec2JSAdapter anchor) =>
      _impl.Initialize(bodyA._impl, bodyB._impl, anchor._impl);
  B2Vec2JSAdapter get_localAnchorA() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorA());
  void set_localAnchorA(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorA(arg0._impl);
  B2Vec2JSAdapter get_localAnchorB() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorB());
  void set_localAnchorB(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorB(arg0._impl);
  double get_referenceAngle() => _impl.get_referenceAngle().toDouble();
  void set_referenceAngle(double arg0) => _impl.set_referenceAngle(arg0);
  bool get_enableLimit() => _impl.get_enableLimit();
  void set_enableLimit(bool arg0) => _impl.set_enableLimit(arg0);
  double get_lowerAngle() => _impl.get_lowerAngle().toDouble();
  void set_lowerAngle(double arg0) => _impl.set_lowerAngle(arg0);
  double get_upperAngle() => _impl.get_upperAngle().toDouble();
  void set_upperAngle(double arg0) => _impl.set_upperAngle(arg0);
  bool get_enableMotor() => _impl.get_enableMotor();
  void set_enableMotor(bool arg0) => _impl.set_enableMotor(arg0);
  double get_motorSpeed() => _impl.get_motorSpeed().toDouble();
  void set_motorSpeed(double arg0) => _impl.set_motorSpeed(arg0);
  double get_maxMotorTorque() => _impl.get_maxMotorTorque().toDouble();
  void set_maxMotorTorque(double arg0) => _impl.set_maxMotorTorque(arg0);
  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2RotJSAdapter implements B2RotPlatform {
  B2RotJSAdapter._(B2RotJSImpl impl) : _impl = impl;

  final B2RotJSImpl _impl;

  B2RotJSAdapter() : _impl = B2RotJSImpl();

  B2RotJSAdapter.from1(double angle) : _impl = B2RotJSImpl.from1(angle);

  void set(double angle) => _impl.Set(angle);
  void setIdentity() => _impl.SetIdentity();
  double getAngle() => _impl.GetAngle().toDouble();
  B2Vec2JSAdapter getXAxis() => B2Vec2JSAdapter._(_impl.GetXAxis());
  B2Vec2JSAdapter getYAxis() => B2Vec2JSAdapter._(_impl.GetYAxis());
  double get_s() => _impl.get_s().toDouble();
  void set_s(double arg0) => _impl.set_s(arg0);
  double get_c() => _impl.get_c().toDouble();
  void set_c(double arg0) => _impl.set_c(arg0);
  void dispose() => _impl.__destroy__();
}

class B2WheelJointJSAdapter implements B2WheelJointPlatform, B2JointJSAdapter {
  B2WheelJointJSAdapter._(B2WheelJointJSImpl impl) : _impl = impl;

  final B2WheelJointJSImpl _impl;

  B2Vec2JSAdapter getLocalAnchorA() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorA());
  B2Vec2JSAdapter getLocalAnchorB() =>
      B2Vec2JSAdapter._(_impl.GetLocalAnchorB());
  B2Vec2JSAdapter getLocalAxisA() => B2Vec2JSAdapter._(_impl.GetLocalAxisA());
  double getJointTranslation() => _impl.GetJointTranslation().toDouble();
  double getJointLinearSpeed() => _impl.GetJointLinearSpeed().toDouble();
  double getJointAngle() => _impl.GetJointAngle().toDouble();
  double getJointAngularSpeed() => _impl.GetJointAngularSpeed().toDouble();
  bool isLimitEnabled() => _impl.IsLimitEnabled();
  void enableLimit(bool flag) => _impl.EnableLimit(flag);
  double getLowerLimit() => _impl.GetLowerLimit().toDouble();
  double getUpperLimit() => _impl.GetUpperLimit().toDouble();
  void setLimits(double lower, double upper) => _impl.SetLimits(lower, upper);
  bool isMotorEnabled() => _impl.IsMotorEnabled();
  void enableMotor(bool flag) => _impl.EnableMotor(flag);
  void setMotorSpeed(double speed) => _impl.SetMotorSpeed(speed);
  double getMotorSpeed() => _impl.GetMotorSpeed().toDouble();
  void setMaxMotorTorque(double torque) => _impl.SetMaxMotorTorque(torque);
  double getMaxMotorTorque() => _impl.GetMaxMotorTorque().toDouble();
  double getMotorTorque(double inv_dt) =>
      _impl.GetMotorTorque(inv_dt).toDouble();
  void setStiffness(double stiffness) => _impl.SetStiffness(stiffness);
  double getStiffness() => _impl.GetStiffness().toDouble();
  void setDamping(double damping) => _impl.SetDamping(damping);
  double getDamping() => _impl.GetDamping().toDouble();
  void dump() => _impl.Dump();
  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dispose() => _impl.__destroy__();
}

class B2WheelJointDefJSAdapter
    implements B2WheelJointDefPlatform, B2JointDefJSAdapter {
  B2WheelJointDefJSAdapter._(B2WheelJointDefJSImpl impl) : _impl = impl;

  final B2WheelJointDefJSImpl _impl;

  B2WheelJointDefJSAdapter() : _impl = B2WheelJointDefJSImpl();

  void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB,
          B2Vec2JSAdapter anchor, B2Vec2JSAdapter axis) =>
      _impl.Initialize(bodyA._impl, bodyB._impl, anchor._impl, axis._impl);
  B2Vec2JSAdapter get_localAnchorA() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorA());
  void set_localAnchorA(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorA(arg0._impl);
  B2Vec2JSAdapter get_localAnchorB() =>
      B2Vec2JSAdapter._(_impl.get_localAnchorB());
  void set_localAnchorB(B2Vec2JSAdapter arg0) =>
      _impl.set_localAnchorB(arg0._impl);
  B2Vec2JSAdapter get_localAxisA() => B2Vec2JSAdapter._(_impl.get_localAxisA());
  void set_localAxisA(B2Vec2JSAdapter arg0) => _impl.set_localAxisA(arg0._impl);
  bool get_enableLimit() => _impl.get_enableLimit();
  void set_enableLimit(bool arg0) => _impl.set_enableLimit(arg0);
  double get_lowerTranslation() => _impl.get_lowerTranslation().toDouble();
  void set_lowerTranslation(double arg0) => _impl.set_lowerTranslation(arg0);
  double get_upperTranslation() => _impl.get_upperTranslation().toDouble();
  void set_upperTranslation(double arg0) => _impl.set_upperTranslation(arg0);
  bool get_enableMotor() => _impl.get_enableMotor();
  void set_enableMotor(bool arg0) => _impl.set_enableMotor(arg0);
  double get_maxMotorTorque() => _impl.get_maxMotorTorque().toDouble();
  void set_maxMotorTorque(double arg0) => _impl.set_maxMotorTorque(arg0);
  double get_motorSpeed() => _impl.get_motorSpeed().toDouble();
  void set_motorSpeed(double arg0) => _impl.set_motorSpeed(arg0);
  double get_stiffness() => _impl.get_stiffness().toDouble();
  void set_stiffness(double arg0) => _impl.set_stiffness(arg0);
  double get_damping() => _impl.get_damping().toDouble();
  void set_damping(double arg0) => _impl.set_damping(arg0);
  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2MotorJointJSAdapter implements B2MotorJointPlatform, B2JointJSAdapter {
  B2MotorJointJSAdapter._(B2MotorJointJSImpl impl) : _impl = impl;

  final B2MotorJointJSImpl _impl;

  void setLinearOffset(B2Vec2JSAdapter linearOffset) =>
      _impl.SetLinearOffset(linearOffset._impl);
  B2Vec2JSAdapter getLinearOffset() =>
      B2Vec2JSAdapter._(_impl.GetLinearOffset());
  void setAngularOffset(double angularOffset) =>
      _impl.SetAngularOffset(angularOffset);
  double getAngularOffset() => _impl.GetAngularOffset().toDouble();
  void setMaxForce(double force) => _impl.SetMaxForce(force);
  double getMaxForce() => _impl.GetMaxForce().toDouble();
  void setMaxTorque(double torque) => _impl.SetMaxTorque(torque);
  double getMaxTorque() => _impl.GetMaxTorque().toDouble();
  void setCorrectionFactor(double factor) => _impl.SetCorrectionFactor(factor);
  double getCorrectionFactor() => _impl.GetCorrectionFactor().toDouble();
  void dump() => _impl.Dump();
  B2JointType getType() => _impl.GetType();
  B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.GetBodyA());
  B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.GetBodyB());
  B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.GetAnchorA());
  B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.GetAnchorB());
  B2Vec2JSAdapter getReactionForce(double inv_dt) =>
      B2Vec2JSAdapter._(_impl.GetReactionForce(inv_dt));
  double getReactionTorque(double inv_dt) =>
      _impl.GetReactionTorque(inv_dt).toDouble();
  B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.GetNext());
  B2JointUserDataJSAdapter getUserData() =>
      B2JointUserDataJSAdapter._(_impl.GetUserData());
  bool getCollideConnected() => _impl.GetCollideConnected();
  void dispose() => _impl.__destroy__();
}

class B2MotorJointDefJSAdapter
    implements B2MotorJointDefPlatform, B2JointDefJSAdapter {
  B2MotorJointDefJSAdapter._(B2MotorJointDefJSImpl impl) : _impl = impl;

  final B2MotorJointDefJSImpl _impl;

  B2MotorJointDefJSAdapter() : _impl = B2MotorJointDefJSImpl();

  void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB) =>
      _impl.Initialize(bodyA._impl, bodyB._impl);
  B2Vec2JSAdapter get_linearOffset() =>
      B2Vec2JSAdapter._(_impl.get_linearOffset());
  void set_linearOffset(B2Vec2JSAdapter arg0) =>
      _impl.set_linearOffset(arg0._impl);
  double get_angularOffset() => _impl.get_angularOffset().toDouble();
  void set_angularOffset(double arg0) => _impl.set_angularOffset(arg0);
  double get_maxForce() => _impl.get_maxForce().toDouble();
  void set_maxForce(double arg0) => _impl.set_maxForce(arg0);
  double get_maxTorque() => _impl.get_maxTorque().toDouble();
  void set_maxTorque(double arg0) => _impl.set_maxTorque(arg0);
  double get_correctionFactor() => _impl.get_correctionFactor().toDouble();
  void set_correctionFactor(double arg0) => _impl.set_correctionFactor(arg0);
  B2JointType get_type() => _impl.get_type();
  void set_type(B2JointType arg0) => _impl.set_type(arg0);
  B2JointUserDataJSAdapter get_userData() =>
      B2JointUserDataJSAdapter._(_impl.get_userData());
  void set_userData(B2JointUserDataJSAdapter arg0) =>
      _impl.set_userData(arg0._impl);
  B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
  void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
  B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
  void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
  bool get_collideConnected() => _impl.get_collideConnected();
  void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
  void dispose() => _impl.__destroy__();
}

class B2RopeTuningJSAdapter implements B2RopeTuningPlatform {
  B2RopeTuningJSAdapter._(B2RopeTuningJSImpl impl) : _impl = impl;

  final B2RopeTuningJSImpl _impl;

  B2RopeTuningJSAdapter() : _impl = B2RopeTuningJSImpl();

  B2StretchingModel get_stretchingModel() => _impl.get_stretchingModel();
  void set_stretchingModel(B2StretchingModel arg0) =>
      _impl.set_stretchingModel(arg0);
  B2BendingModel get_bendingModel() => _impl.get_bendingModel();
  void set_bendingModel(B2BendingModel arg0) => _impl.set_bendingModel(arg0);
  double get_damping() => _impl.get_damping().toDouble();
  void set_damping(double arg0) => _impl.set_damping(arg0);
  double get_stretchStiffness() => _impl.get_stretchStiffness().toDouble();
  void set_stretchStiffness(double arg0) => _impl.set_stretchStiffness(arg0);
  double get_stretchHertz() => _impl.get_stretchHertz().toDouble();
  void set_stretchHertz(double arg0) => _impl.set_stretchHertz(arg0);
  double get_stretchDamping() => _impl.get_stretchDamping().toDouble();
  void set_stretchDamping(double arg0) => _impl.set_stretchDamping(arg0);
  double get_bendStiffness() => _impl.get_bendStiffness().toDouble();
  void set_bendStiffness(double arg0) => _impl.set_bendStiffness(arg0);
  double get_bendHertz() => _impl.get_bendHertz().toDouble();
  void set_bendHertz(double arg0) => _impl.set_bendHertz(arg0);
  double get_bendDamping() => _impl.get_bendDamping().toDouble();
  void set_bendDamping(double arg0) => _impl.set_bendDamping(arg0);
  bool get_isometric() => _impl.get_isometric();
  void set_isometric(bool arg0) => _impl.set_isometric(arg0);
  bool get_fixedEffectiveMass() => _impl.get_fixedEffectiveMass();
  void set_fixedEffectiveMass(bool arg0) => _impl.set_fixedEffectiveMass(arg0);
  bool get_warmStart() => _impl.get_warmStart();
  void set_warmStart(bool arg0) => _impl.set_warmStart(arg0);
  void dispose() => _impl.__destroy__();
}

class B2RopeDefJSAdapter implements B2RopeDefPlatform {
  B2RopeDefJSAdapter._(B2RopeDefJSImpl impl) : _impl = impl;

  final B2RopeDefJSImpl _impl;

  B2RopeDefJSAdapter() : _impl = B2RopeDefJSImpl();

  B2Vec2JSAdapter get_position() => B2Vec2JSAdapter._(_impl.get_position());
  void set_position(B2Vec2JSAdapter arg0) => _impl.set_position(arg0._impl);
  B2Vec2JSAdapter get_vertices() => B2Vec2JSAdapter._(_impl.get_vertices());
  void set_vertices(B2Vec2JSAdapter arg0) => _impl.set_vertices(arg0._impl);
  int get_count() => _impl.get_count().toInt();
  void set_count(int arg0) => _impl.set_count(arg0);
  B2Vec2JSAdapter get_gravity() => B2Vec2JSAdapter._(_impl.get_gravity());
  void set_gravity(B2Vec2JSAdapter arg0) => _impl.set_gravity(arg0._impl);
  B2RopeTuningJSAdapter get_tuning() =>
      B2RopeTuningJSAdapter._(_impl.get_tuning());
  void set_tuning(B2RopeTuningJSAdapter arg0) => _impl.set_tuning(arg0._impl);
  void dispose() => _impl.__destroy__();
}

class B2RopeJSAdapter implements B2RopePlatform {
  B2RopeJSAdapter._(B2RopeJSImpl impl) : _impl = impl;

  final B2RopeJSImpl _impl;

  B2RopeJSAdapter() : _impl = B2RopeJSImpl();

  void create(B2RopeDefJSAdapter def) => _impl.Create(def._impl);
  void setTuning(B2RopeTuningJSAdapter tuning) => _impl.SetTuning(tuning._impl);
  void step(double timeStep, int iterations, B2Vec2JSAdapter position) =>
      _impl.Step(timeStep, iterations, position._impl);
  void reset(B2Vec2JSAdapter position) => _impl.Reset(position._impl);
  //void draw(B2DrawJSAdapter draw) => _impl.Draw(draw._impl);
  void dispose() => _impl.__destroy__();
}

class B2ClipVertexJSAdapter implements B2ClipVertexPlatform {
  B2ClipVertexJSAdapter._(B2ClipVertexJSImpl impl) : _impl = impl;

  final B2ClipVertexJSImpl _impl;

  B2ClipVertexJSAdapter() : _impl = B2ClipVertexJSImpl();

  B2Vec2JSAdapter get_v() => B2Vec2JSAdapter._(_impl.get_v());
  void set_v(B2Vec2JSAdapter arg0) => _impl.set_v(arg0._impl);
  B2ContactIDJSAdapter get_id() => B2ContactIDJSAdapter._(_impl.get_id());
  void set_id(B2ContactIDJSAdapter arg0) => _impl.set_id(arg0._impl);
  void dispose() => _impl.__destroy__();
}

@JS('b2Shape')
@staticInterop
class B2ShapeJSImpl {}

@JS('b2JointDef')
@staticInterop
class B2JointDefJSImpl {
  @JS('b2JointDef')
  external B2JointDefJSImpl();
}

@JS('b2Joint')
@staticInterop
class B2JointJSImpl {}

@JS('VoidPtr')
@staticInterop
class VoidPtrJSImpl {}

@JS('b2Contact')
@staticInterop
class B2ContactJSImpl {}

@JS('b2ContactListener')
@staticInterop
class B2ContactListenerJSImpl {}

@JS('JSContactListener')
@staticInterop
class JSContactListenerJSImpl {
  @JS('JSContactListener')
  external JSContactListenerJSImpl();
}

@JS('b2World')
@staticInterop
class B2WorldJSImpl {
  @JS('b2World')
  external B2WorldJSImpl.from1(B2Vec2JSImpl gravity);
}

@JS('b2FixtureUserData')
@staticInterop
class B2FixtureUserDataJSImpl {}

@JS('b2FixtureDef')
@staticInterop
class B2FixtureDefJSImpl {
  @JS('b2FixtureDef')
  external B2FixtureDefJSImpl();
}

@JS('b2Fixture')
@staticInterop
class B2FixtureJSImpl {}

@JS('b2Transform')
@staticInterop
class B2TransformJSImpl {
  @JS('b2Transform')
  external B2TransformJSImpl();
  @JS('b2Transform')
  external B2TransformJSImpl.from2(
      B2Vec2JSImpl? position, B2RotJSImpl? rotation);
}

@JS('b2RayCastCallback')
@staticInterop
class B2RayCastCallbackJSImpl {}

@JS('JSRayCastCallback')
@staticInterop
class JSRayCastCallbackJSImpl {
  @JS('JSRayCastCallback')
  external JSRayCastCallbackJSImpl();
}

@JS('b2QueryCallback')
@staticInterop
class B2QueryCallbackJSImpl {}

@JS('JSQueryCallback')
@staticInterop
class JSQueryCallbackJSImpl {
  @JS('JSQueryCallback')
  external JSQueryCallbackJSImpl();
}

@JS('b2MassData')
@staticInterop
class B2MassDataJSImpl {
  @JS('b2MassData')
  external B2MassDataJSImpl();
}

@JS('b2Vec2')
@staticInterop
class B2Vec2JSImpl {
  @JS('b2Vec2')
  external B2Vec2JSImpl();
  @JS('b2Vec2')
  external B2Vec2JSImpl.from2(num? x, num? y);
}

@JS('b2Vec3')
@staticInterop
class B2Vec3JSImpl {
  @JS('b2Vec3')
  external B2Vec3JSImpl();
  @JS('b2Vec3')
  external B2Vec3JSImpl.from3(num? x, num? y, num? z);
}

@JS('b2BodyUserData')
@staticInterop
class B2BodyUserDataJSImpl {}

@JS('b2Body')
@staticInterop
class B2BodyJSImpl {}

@JS('b2BodyDef')
@staticInterop
class B2BodyDefJSImpl {
  @JS('b2BodyDef')
  external B2BodyDefJSImpl();
}

@JS('b2Filter')
@staticInterop
class B2FilterJSImpl {
  @JS('b2Filter')
  external B2FilterJSImpl();
}

@JS('b2AABB')
@staticInterop
class B2AABBJSImpl {
  @JS('b2AABB')
  external B2AABBJSImpl();
}

@JS('b2CircleShape')
@staticInterop
class B2CircleShapeJSImpl extends B2ShapeJSImpl {
  @JS('b2CircleShape')
  external B2CircleShapeJSImpl();
}

@JS('b2EdgeShape')
@staticInterop
class B2EdgeShapeJSImpl extends B2ShapeJSImpl {
  @JS('b2EdgeShape')
  external B2EdgeShapeJSImpl();
}

@JS('b2JointUserData')
@staticInterop
class B2JointUserDataJSImpl {}

@JS('b2WeldJoint')
@staticInterop
class B2WeldJointJSImpl extends B2JointJSImpl {}

@JS('b2WeldJointDef')
@staticInterop
class B2WeldJointDefJSImpl extends B2JointDefJSImpl {
  @JS('b2WeldJointDef')
  external B2WeldJointDefJSImpl();
}

@JS('b2ChainShape')
@staticInterop
class B2ChainShapeJSImpl extends B2ShapeJSImpl {
  @JS('b2ChainShape')
  external B2ChainShapeJSImpl();
}

@JS('b2Color')
@staticInterop
class B2ColorJSImpl {
  @JS('b2Color')
  external B2ColorJSImpl();
  @JS('b2Color')
  external B2ColorJSImpl.from3(num? r, num? g, num? b);
}

@JS('b2ContactEdge')
@staticInterop
class B2ContactEdgeJSImpl {
  @JS('b2ContactEdge')
  external B2ContactEdgeJSImpl();
}

@JS('b2ContactFeature')
@staticInterop
class B2ContactFeatureJSImpl {}

@JS('b2ContactFilter')
@staticInterop
class B2ContactFilterJSImpl {}

@JS('JSContactFilter')
@staticInterop
class JSContactFilterJSImpl {
  @JS('JSContactFilter')
  external JSContactFilterJSImpl();
}

@JS('b2ContactID')
@staticInterop
class B2ContactIDJSImpl {}

@JS('b2ContactImpulse')
@staticInterop
class B2ContactImpulseJSImpl {}

@JS('b2DestructionListener')
@staticInterop
class B2DestructionListenerJSImpl {}

@JS('b2DestructionListenerWrapper')
@staticInterop
class B2DestructionListenerWrapperJSImpl {}

@JS('JSDestructionListener')
@staticInterop
class JSDestructionListenerJSImpl {
  @JS('JSDestructionListener')
  external JSDestructionListenerJSImpl();
}

@JS('b2DistanceJoint')
@staticInterop
class B2DistanceJointJSImpl extends B2JointJSImpl {}

@JS('b2DistanceJointDef')
@staticInterop
class B2DistanceJointDefJSImpl extends B2JointDefJSImpl {
  @JS('b2DistanceJointDef')
  external B2DistanceJointDefJSImpl();
}

@JS('b2Draw')
@staticInterop
class B2DrawJSImpl {}

@JS('JSDraw')
@staticInterop
class JSDrawJSImpl {
  @JS('JSDraw')
  external JSDrawJSImpl();
}

@JS('b2FrictionJoint')
@staticInterop
class B2FrictionJointJSImpl extends B2JointJSImpl {}

@JS('b2FrictionJointDef')
@staticInterop
class B2FrictionJointDefJSImpl extends B2JointDefJSImpl {
  @JS('b2FrictionJointDef')
  external B2FrictionJointDefJSImpl();
}

@JS('b2GearJoint')
@staticInterop
class B2GearJointJSImpl extends B2JointJSImpl {}

@JS('b2GearJointDef')
@staticInterop
class B2GearJointDefJSImpl extends B2JointDefJSImpl {
  @JS('b2GearJointDef')
  external B2GearJointDefJSImpl();
}

@JS('b2JointEdge')
@staticInterop
class B2JointEdgeJSImpl {
  @JS('b2JointEdge')
  external B2JointEdgeJSImpl();
}

@JS('b2Manifold')
@staticInterop
class B2ManifoldJSImpl {
  @JS('b2Manifold')
  external B2ManifoldJSImpl();
}

@JS('b2WorldManifold')
@staticInterop
class B2WorldManifoldJSImpl {
  @JS('b2WorldManifold')
  external B2WorldManifoldJSImpl();
}

@JS('b2ManifoldPoint')
@staticInterop
class B2ManifoldPointJSImpl {
  @JS('b2ManifoldPoint')
  external B2ManifoldPointJSImpl();
}

@JS('b2Mat22')
@staticInterop
class B2Mat22JSImpl {
  @JS('b2Mat22')
  external B2Mat22JSImpl();
  @JS('b2Mat22')
  external B2Mat22JSImpl.from2(B2Vec2JSImpl? a11, B2Vec2JSImpl? a12);
  @JS('b2Mat22')
  external B2Mat22JSImpl.from4(num? a11, num? a12, num? a21, num? a22);
}

@JS('b2Mat33')
@staticInterop
class B2Mat33JSImpl {
  @JS('b2Mat33')
  external B2Mat33JSImpl();
  @JS('b2Mat33')
  external B2Mat33JSImpl.from3(
      B2Vec3JSImpl? c1, B2Vec3JSImpl? c2, B2Vec3JSImpl? c3);
}

@JS('b2MouseJoint')
@staticInterop
class B2MouseJointJSImpl extends B2JointJSImpl {}

@JS('b2MouseJointDef')
@staticInterop
class B2MouseJointDefJSImpl extends B2JointDefJSImpl {
  @JS('b2MouseJointDef')
  external B2MouseJointDefJSImpl();
}

@JS('b2PolygonShape')
@staticInterop
class B2PolygonShapeJSImpl extends B2ShapeJSImpl {
  @JS('b2PolygonShape')
  external B2PolygonShapeJSImpl();
}

@JS('b2PrismaticJoint')
@staticInterop
class B2PrismaticJointJSImpl extends B2JointJSImpl {}

@JS('b2PrismaticJointDef')
@staticInterop
class B2PrismaticJointDefJSImpl extends B2JointDefJSImpl {
  @JS('b2PrismaticJointDef')
  external B2PrismaticJointDefJSImpl();
}

@JS('b2Profile')
@staticInterop
class B2ProfileJSImpl {}

@JS('b2PulleyJoint')
@staticInterop
class B2PulleyJointJSImpl extends B2JointJSImpl {}

@JS('b2PulleyJointDef')
@staticInterop
class B2PulleyJointDefJSImpl extends B2JointDefJSImpl {
  @JS('b2PulleyJointDef')
  external B2PulleyJointDefJSImpl();
}

@JS('b2RayCastInput')
@staticInterop
class B2RayCastInputJSImpl {}

@JS('b2RayCastOutput')
@staticInterop
class B2RayCastOutputJSImpl {}

@JS('b2RevoluteJoint')
@staticInterop
class B2RevoluteJointJSImpl extends B2JointJSImpl {}

@JS('b2RevoluteJointDef')
@staticInterop
class B2RevoluteJointDefJSImpl extends B2JointDefJSImpl {
  @JS('b2RevoluteJointDef')
  external B2RevoluteJointDefJSImpl();
}

@JS('b2Rot')
@staticInterop
class B2RotJSImpl {
  @JS('b2Rot')
  external B2RotJSImpl();
  @JS('b2Rot')
  external B2RotJSImpl.from1(num? angle);
}

@JS('b2WheelJoint')
@staticInterop
class B2WheelJointJSImpl extends B2JointJSImpl {}

@JS('b2WheelJointDef')
@staticInterop
class B2WheelJointDefJSImpl extends B2JointDefJSImpl {
  @JS('b2WheelJointDef')
  external B2WheelJointDefJSImpl();
}

@JS('b2MotorJoint')
@staticInterop
class B2MotorJointJSImpl extends B2JointJSImpl {}

@JS('b2MotorJointDef')
@staticInterop
class B2MotorJointDefJSImpl extends B2JointDefJSImpl {
  @JS('b2MotorJointDef')
  external B2MotorJointDefJSImpl();
}

@JS('b2RopeTuning')
@staticInterop
class B2RopeTuningJSImpl {
  @JS('b2RopeTuning')
  external B2RopeTuningJSImpl();
}

@JS('b2RopeDef')
@staticInterop
class B2RopeDefJSImpl {
  @JS('b2RopeDef')
  external B2RopeDefJSImpl();
}

@JS('b2Rope')
@staticInterop
class B2RopeJSImpl {
  @JS('b2Rope')
  external B2RopeJSImpl();
}

@JS('b2ClipVertex')
@staticInterop
class B2ClipVertexJSImpl {
  @JS('b2ClipVertex')
  external B2ClipVertexJSImpl();
}

extension B2ShapeJSImplExtension on B2ShapeJSImpl {
  external B2ShapeType GetType();
  external num GetChildCount();
  external bool TestPoint(B2TransformJSImpl xf, B2Vec2JSImpl p);
  external bool RayCast(B2RayCastOutputJSImpl output,
      B2RayCastInputJSImpl input, B2TransformJSImpl transform, num childIndex);
  external void ComputeAABB(
      B2AABBJSImpl aabb, B2TransformJSImpl xf, num childIndex);
  external void ComputeMass(B2MassDataJSImpl massData, num density);
  external B2ShapeType get_m_type();
  external void set_m_type(B2ShapeType arg0);
  external double get_m_radius();
  external void set_m_radius(num arg0);
  external void __destroy__();
}

extension B2JointDefJSImplExtension on B2JointDefJSImpl {
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2JointJSImplExtension on B2JointJSImpl {
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void Dump();
}

extension VoidPtrJSImplExtension on VoidPtrJSImpl {
  external void __destroy__();
}

extension B2ContactJSImplExtension on B2ContactJSImpl {
  external B2ManifoldJSImpl GetManifold();
  external void GetWorldManifold(B2WorldManifoldJSImpl manifold);
  external bool IsTouching();
  external void SetEnabled(bool flag);
  external bool IsEnabled();
  external B2ContactJSImpl GetNext();
  external B2FixtureJSImpl GetFixtureA();
  external num GetChildIndexA();
  external B2FixtureJSImpl GetFixtureB();
  external num GetChildIndexB();
  external void SetFriction(num friction);
  external double GetFriction();
  external void ResetFriction();
  external void SetRestitution(num restitution);
  external double GetRestitution();
  external void ResetRestitution();
  external void SetRestitutionThreshold(num threshold);
  external double GetRestitutionThreshold();
  external void ResetRestitutionThreshold();
  external void SetTangentSpeed(num speed);
  external double GetTangentSpeed();
}

extension B2ContactListenerJSImplExtension on B2ContactListenerJSImpl {
  external void __destroy__();
}

extension JSContactListenerJSImplExtension on JSContactListenerJSImpl {
  external void BeginContact(B2ContactJSImpl contact);
  external void EndContact(B2ContactJSImpl contact);
  external void PreSolve(B2ContactJSImpl contact, B2ManifoldJSImpl oldManifold);
  external void PostSolve(
      B2ContactJSImpl contact, B2ContactImpulseJSImpl impulse);
  external void __destroy__();
}

extension B2WorldJSImplExtension on B2WorldJSImpl {
  //external void SetDestructionListener(B2DestructionListenerJSImpl listener);
  //external void SetContactFilter(JSContactFilterJSImpl filter);
  //external void SetContactListener(JSContactListenerJSImpl listener);
  //external void SetDebugDraw(B2DrawJSImpl debugDraw);
  external B2BodyJSImpl CreateBody(B2BodyDefJSImpl def);
  external void DestroyBody(B2BodyJSImpl body);
  external B2JointJSImpl CreateJoint(B2JointDefJSImpl def);
  external void DestroyJoint(B2JointJSImpl joint);
  external void Step(
      num timeStep, num velocityIterations, num positionIterations);
  external void ClearForces();
  external void DebugDraw();
  //external void QueryAABB(B2QueryCallbackJSImpl callback, B2AABBJSImpl aabb);
  //external void RayCast(B2RayCastCallbackJSImpl callback, B2Vec2JSImpl point1, B2Vec2JSImpl point2);
  external B2BodyJSImpl GetBodyList();
  external B2JointJSImpl GetJointList();
  external B2ContactJSImpl GetContactList();
  external void SetAllowSleeping(bool flag);
  external bool GetAllowSleeping();
  external void SetWarmStarting(bool flag);
  external bool GetWarmStarting();
  external void SetContinuousPhysics(bool flag);
  external bool GetContinuousPhysics();
  external void SetSubStepping(bool flag);
  external bool GetSubStepping();
  external num GetProxyCount();
  external num GetBodyCount();
  external num GetJointCount();
  external num GetContactCount();
  external num GetTreeHeight();
  external num GetTreeBalance();
  external double GetTreeQuality();
  external void SetGravity(B2Vec2JSImpl gravity);
  external B2Vec2JSImpl GetGravity();
  external bool IsLocked();
  external void SetAutoClearForces(bool flag);
  external bool GetAutoClearForces();
  external B2ProfileJSImpl GetProfile();
  external void Dump();
  external void __destroy__();
}

extension B2FixtureUserDataJSImplExtension on B2FixtureUserDataJSImpl {
  external int get_pointer();
  external void set_pointer(int arg0);
  external void __destroy__();
}

extension B2FixtureDefJSImplExtension on B2FixtureDefJSImpl {
  external B2ShapeJSImpl get_shape();
  external void set_shape(B2ShapeJSImpl arg0);
  external B2FixtureUserDataJSImpl get_userData();
  external void set_userData(B2FixtureUserDataJSImpl arg0);
  external double get_friction();
  external void set_friction(num arg0);
  external double get_restitution();
  external void set_restitution(num arg0);
  external double get_restitutionThreshold();
  external void set_restitutionThreshold(num arg0);
  external double get_density();
  external void set_density(num arg0);
  external bool get_isSensor();
  external void set_isSensor(bool arg0);
  external B2FilterJSImpl get_filter();
  external void set_filter(B2FilterJSImpl arg0);
  external void __destroy__();
}

extension B2FixtureJSImplExtension on B2FixtureJSImpl {
  external B2ShapeType GetType();
  external B2ShapeJSImpl GetShape();
  external void SetSensor(bool sensor);
  external bool IsSensor();
  external void SetFilterData(B2FilterJSImpl filter);
  external B2FilterJSImpl GetFilterData();
  external void Refilter();
  external B2BodyJSImpl GetBody();
  external B2FixtureJSImpl GetNext();
  external B2FixtureUserDataJSImpl GetUserData();
  external bool TestPoint(B2Vec2JSImpl p);
  external bool RayCast(
      B2RayCastOutputJSImpl output, B2RayCastInputJSImpl input, num childIndex);
  external void GetMassData(B2MassDataJSImpl massData);
  external void SetDensity(num density);
  external double GetDensity();
  external double GetFriction();
  external void SetFriction(num friction);
  external double GetRestitution();
  external void SetRestitution(num restitution);
  external double GetRestitutionThreshold();
  external void SetRestitutionThreshold(num threshold);
  external B2AABBJSImpl GetAABB(num childIndex);
  external void Dump(num bodyIndex);
  external void __destroy__();
}

extension B2TransformJSImplExtension on B2TransformJSImpl {
  external void SetIdentity();
  external void Set(B2Vec2JSImpl position, num angle);
  external B2Vec2JSImpl get_p();
  external void set_p(B2Vec2JSImpl arg0);
  external B2RotJSImpl get_q();
  external void set_q(B2RotJSImpl arg0);
  external void __destroy__();
}

extension B2RayCastCallbackJSImplExtension on B2RayCastCallbackJSImpl {
  external void __destroy__();
}

extension JSRayCastCallbackJSImplExtension on JSRayCastCallbackJSImpl {
  external double ReportFixture(B2FixtureJSImpl fixture, B2Vec2JSImpl point,
      B2Vec2JSImpl normal, num fraction);
  external void __destroy__();
}

extension B2QueryCallbackJSImplExtension on B2QueryCallbackJSImpl {
  external void __destroy__();
}

extension JSQueryCallbackJSImplExtension on JSQueryCallbackJSImpl {
  external bool ReportFixture(B2FixtureJSImpl fixture);
  external void __destroy__();
}

extension B2MassDataJSImplExtension on B2MassDataJSImpl {
  external double get_mass();
  external void set_mass(num arg0);
  external B2Vec2JSImpl get_center();
  external void set_center(B2Vec2JSImpl arg0);
  external double get_I();
  external void set_I(num arg0);
  external void __destroy__();
}

extension B2Vec2JSImplExtension on B2Vec2JSImpl {
  external void SetZero();
  external void Set(num x, num y);
  external void op_add(B2Vec2JSImpl v);
  external void op_sub(B2Vec2JSImpl v);
  external void op_mul(num s);
  external double Length();
  external double LengthSquared();
  external double Normalize();
  external bool IsValid();
  external B2Vec2JSImpl Skew();
  external double get_x();
  external void set_x(num arg0);
  external double get_y();
  external void set_y(num arg0);
  external void __destroy__();
}

extension B2Vec3JSImplExtension on B2Vec3JSImpl {
  external void SetZero();
  external void Set(num x, num y, num z);
  external void op_add(B2Vec3JSImpl v);
  external void op_sub(B2Vec3JSImpl v);
  external void op_mul(num s);
  external double get_x();
  external void set_x(num arg0);
  external double get_y();
  external void set_y(num arg0);
  external double get_z();
  external void set_z(num arg0);
  external void __destroy__();
}

extension B2BodyUserDataJSImplExtension on B2BodyUserDataJSImpl {
  external int get_pointer();
  external void set_pointer(int arg0);
  external void __destroy__();
}

extension B2BodyJSImplExtension on B2BodyJSImpl {
  external B2FixtureJSImpl CreateFixture(B2ShapeJSImpl shape, num? density);
  external void DestroyFixture(B2FixtureJSImpl fixture);
  external void SetTransform(B2Vec2JSImpl position, num angle);
  external B2TransformJSImpl GetTransform();
  external B2Vec2JSImpl GetPosition();
  external double GetAngle();
  external B2Vec2JSImpl GetWorldCenter();
  external B2Vec2JSImpl GetLocalCenter();
  external void SetLinearVelocity(B2Vec2JSImpl v);
  external B2Vec2JSImpl GetLinearVelocity();
  external void SetAngularVelocity(num omega);
  external double GetAngularVelocity();
  external void ApplyForce(B2Vec2JSImpl force, B2Vec2JSImpl point, bool wake);
  external void ApplyForceToCenter(B2Vec2JSImpl force, bool wake);
  external void ApplyTorque(num torque, bool awake);
  external void ApplyLinearImpulse(
      B2Vec2JSImpl impulse, B2Vec2JSImpl point, bool wake);
  external void ApplyLinearImpulseToCenter(B2Vec2JSImpl impulse, bool wake);
  external void ApplyAngularImpulse(num impulse, bool wake);
  external double GetMass();
  external double GetInertia();
  external void GetMassData(B2MassDataJSImpl data);
  external void SetMassData(B2MassDataJSImpl data);
  external void ResetMassData();
  external B2Vec2JSImpl GetWorldPoint(B2Vec2JSImpl localPoint);
  external B2Vec2JSImpl GetWorldVector(B2Vec2JSImpl localVector);
  external B2Vec2JSImpl GetLocalPoint(B2Vec2JSImpl worldPoint);
  external B2Vec2JSImpl GetLocalVector(B2Vec2JSImpl worldVector);
  external B2Vec2JSImpl GetLinearVelocityFromWorldPoint(
      B2Vec2JSImpl worldPoint);
  external B2Vec2JSImpl GetLinearVelocityFromLocalPoint(
      B2Vec2JSImpl localPoint);
  external double GetLinearDamping();
  external void SetLinearDamping(num linearDamping);
  external double GetAngularDamping();
  external void SetAngularDamping(num angularDamping);
  external double GetGravityScale();
  external void SetGravityScale(num scale);
  external void SetType(B2BodyType type);
  external B2BodyType GetType();
  external void SetBullet(bool flag);
  external bool IsBullet();
  external void SetSleepingAllowed(bool flag);
  external bool IsSleepingAllowed();
  external void SetAwake(bool flag);
  external bool IsAwake();
  external void SetEnabled(bool flag);
  external bool IsEnabled();
  external void SetFixedRotation(bool flag);
  external bool IsFixedRotation();
  external B2FixtureJSImpl GetFixtureList();
  external B2JointEdgeJSImpl GetJointList();
  external B2ContactEdgeJSImpl GetContactList();
  external B2BodyJSImpl GetNext();
  external B2BodyUserDataJSImpl GetUserData();
  external B2WorldJSImpl GetWorld();
  external void Dump();
}

extension B2BodyDefJSImplExtension on B2BodyDefJSImpl {
  external B2BodyType get_type();
  external void set_type(B2BodyType arg0);
  external B2Vec2JSImpl get_position();
  external void set_position(B2Vec2JSImpl arg0);
  external double get_angle();
  external void set_angle(num arg0);
  external B2Vec2JSImpl get_linearVelocity();
  external void set_linearVelocity(B2Vec2JSImpl arg0);
  external double get_angularVelocity();
  external void set_angularVelocity(num arg0);
  external double get_linearDamping();
  external void set_linearDamping(num arg0);
  external double get_angularDamping();
  external void set_angularDamping(num arg0);
  external bool get_allowSleep();
  external void set_allowSleep(bool arg0);
  external bool get_awake();
  external void set_awake(bool arg0);
  external bool get_fixedRotation();
  external void set_fixedRotation(bool arg0);
  external bool get_bullet();
  external void set_bullet(bool arg0);
  external bool get_enabled();
  external void set_enabled(bool arg0);
  external B2BodyUserDataJSImpl get_userData();
  external void set_userData(B2BodyUserDataJSImpl arg0);
  external double get_gravityScale();
  external void set_gravityScale(num arg0);
  external void __destroy__();
}

extension B2FilterJSImplExtension on B2FilterJSImpl {
  external int get_categoryBits();
  external void set_categoryBits(int arg0);
  external int get_maskBits();
  external void set_maskBits(int arg0);
  external int get_groupIndex();
  external void set_groupIndex(int arg0);
  external void __destroy__();
}

extension B2AABBJSImplExtension on B2AABBJSImpl {
  external bool IsValid();
  external B2Vec2JSImpl GetCenter();
  external B2Vec2JSImpl GetExtents();
  external double GetPerimeter();
  external void Combine(B2AABBJSImpl aabb1, B2AABBJSImpl? aabb2);
  external bool Contains(B2AABBJSImpl aabb);
  external bool RayCast(
      B2RayCastOutputJSImpl output, B2RayCastInputJSImpl input);
  external B2Vec2JSImpl get_lowerBound();
  external void set_lowerBound(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_upperBound();
  external void set_upperBound(B2Vec2JSImpl arg0);
  external void __destroy__();
}

extension B2CircleShapeJSImplExtension on B2CircleShapeJSImpl {
  external B2ShapeType GetType();
  external num GetChildCount();
  external bool TestPoint(B2TransformJSImpl xf, B2Vec2JSImpl p);
  external bool RayCast(B2RayCastOutputJSImpl output,
      B2RayCastInputJSImpl input, B2TransformJSImpl transform, num childIndex);
  external void ComputeAABB(
      B2AABBJSImpl aabb, B2TransformJSImpl xf, num childIndex);
  external void ComputeMass(B2MassDataJSImpl massData, num density);
  external B2Vec2JSImpl get_m_p();
  external void set_m_p(B2Vec2JSImpl arg0);
  external B2ShapeType get_m_type();
  external void set_m_type(B2ShapeType arg0);
  external double get_m_radius();
  external void set_m_radius(num arg0);
  external void __destroy__();
}

extension B2EdgeShapeJSImplExtension on B2EdgeShapeJSImpl {
  external void SetOneSided(
      B2Vec2JSImpl v0, B2Vec2JSImpl v1, B2Vec2JSImpl v2, B2Vec2JSImpl v3);
  external void SetTwoSided(B2Vec2JSImpl v1, B2Vec2JSImpl v2);
  external B2ShapeType GetType();
  external num GetChildCount();
  external bool TestPoint(B2TransformJSImpl xf, B2Vec2JSImpl p);
  external bool RayCast(B2RayCastOutputJSImpl output,
      B2RayCastInputJSImpl input, B2TransformJSImpl transform, num childIndex);
  external void ComputeAABB(
      B2AABBJSImpl aabb, B2TransformJSImpl xf, num childIndex);
  external void ComputeMass(B2MassDataJSImpl massData, num density);
  external B2Vec2JSImpl get_m_vertex1();
  external void set_m_vertex1(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_m_vertex2();
  external void set_m_vertex2(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_m_vertex0();
  external void set_m_vertex0(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_m_vertex3();
  external void set_m_vertex3(B2Vec2JSImpl arg0);
  external bool get_m_oneSided();
  external void set_m_oneSided(bool arg0);
  external B2ShapeType get_m_type();
  external void set_m_type(B2ShapeType arg0);
  external double get_m_radius();
  external void set_m_radius(num arg0);
  external void __destroy__();
}

extension B2JointUserDataJSImplExtension on B2JointUserDataJSImpl {
  external int get_pointer();
  external void set_pointer(int arg0);
  external void __destroy__();
}

extension B2WeldJointJSImplExtension on B2WeldJointJSImpl {
  external B2Vec2JSImpl GetLocalAnchorA();
  external B2Vec2JSImpl GetLocalAnchorB();
  external double GetReferenceAngle();
  external void SetStiffness(num stiffness);
  external double GetStiffness();
  external void SetDamping(num damping);
  external double GetDamping();
  external void Dump();
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void __destroy__();
}

extension B2WeldJointDefJSImplExtension on B2WeldJointDefJSImpl {
  external void Initialize(
      B2BodyJSImpl bodyA, B2BodyJSImpl bodyB, B2Vec2JSImpl anchor);
  external B2Vec2JSImpl get_localAnchorA();
  external void set_localAnchorA(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localAnchorB();
  external void set_localAnchorB(B2Vec2JSImpl arg0);
  external double get_referenceAngle();
  external void set_referenceAngle(num arg0);
  external double get_stiffness();
  external void set_stiffness(num arg0);
  external double get_damping();
  external void set_damping(num arg0);
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2ChainShapeJSImplExtension on B2ChainShapeJSImpl {
  external void Clear();
  external void CreateLoop(B2Vec2JSImpl vertices, num count);
  external void CreateChain(B2Vec2JSImpl vertices, num count,
      B2Vec2JSImpl prevVertex, B2Vec2JSImpl nextVertex);
  external void GetChildEdge(B2EdgeShapeJSImpl edge, num index);
  external B2ShapeType GetType();
  external num GetChildCount();
  external bool TestPoint(B2TransformJSImpl xf, B2Vec2JSImpl p);
  external bool RayCast(B2RayCastOutputJSImpl output,
      B2RayCastInputJSImpl input, B2TransformJSImpl transform, num childIndex);
  external void ComputeAABB(
      B2AABBJSImpl aabb, B2TransformJSImpl xf, num childIndex);
  external void ComputeMass(B2MassDataJSImpl massData, num density);
  external B2Vec2JSImpl get_m_vertices();
  external void set_m_vertices(B2Vec2JSImpl arg0);
  external num get_m_count();
  external void set_m_count(num arg0);
  external B2Vec2JSImpl get_m_prevVertex();
  external void set_m_prevVertex(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_m_nextVertex();
  external void set_m_nextVertex(B2Vec2JSImpl arg0);
  external B2ShapeType get_m_type();
  external void set_m_type(B2ShapeType arg0);
  external double get_m_radius();
  external void set_m_radius(num arg0);
  external void __destroy__();
}

extension B2ColorJSImplExtension on B2ColorJSImpl {
  external void Set(num ri, num gi, num bi);
  external double get_r();
  external void set_r(num arg0);
  external double get_g();
  external void set_g(num arg0);
  external double get_b();
  external void set_b(num arg0);
  external void __destroy__();
}

extension B2ContactEdgeJSImplExtension on B2ContactEdgeJSImpl {
  external B2BodyJSImpl get_other();
  external void set_other(B2BodyJSImpl arg0);
  external B2ContactJSImpl get_contact();
  external void set_contact(B2ContactJSImpl arg0);
  external B2ContactEdgeJSImpl get_prev();
  external void set_prev(B2ContactEdgeJSImpl arg0);
  external B2ContactEdgeJSImpl get_next();
  external void set_next(B2ContactEdgeJSImpl arg0);
  external void __destroy__();
}

extension B2ContactFeatureJSImplExtension on B2ContactFeatureJSImpl {
  external int get_indexA();
  external void set_indexA(int arg0);
  external int get_indexB();
  external void set_indexB(int arg0);
  external int get_typeA();
  external void set_typeA(int arg0);
  external int get_typeB();
  external void set_typeB(int arg0);
  external void __destroy__();
}

extension B2ContactFilterJSImplExtension on B2ContactFilterJSImpl {
  external void __destroy__();
}

extension JSContactFilterJSImplExtension on JSContactFilterJSImpl {
  external bool ShouldCollide(
      B2FixtureJSImpl fixtureA, B2FixtureJSImpl fixtureB);
  external void __destroy__();
}

extension B2ContactIDJSImplExtension on B2ContactIDJSImpl {
  external B2ContactFeatureJSImpl get_cf();
  external void set_cf(B2ContactFeatureJSImpl arg0);
  external int get_key();
  external void set_key(int arg0);
  external void __destroy__();
}

extension B2ContactImpulseJSImplExtension on B2ContactImpulseJSImpl {
  external double get_normalImpulses(num arg0);
  external void set_normalImpulses(num arg0, num arg1);
  external double get_tangentImpulses(num arg0);
  external void set_tangentImpulses(num arg0, num arg1);
  external num get_count();
  external void set_count(num arg0);
  external void __destroy__();
}

extension B2DestructionListenerJSImplExtension on B2DestructionListenerJSImpl {
  external void __destroy__();
}

extension B2DestructionListenerWrapperJSImplExtension
    on B2DestructionListenerWrapperJSImpl {
  external void __destroy__();
}

extension JSDestructionListenerJSImplExtension on JSDestructionListenerJSImpl {
  external void SayGoodbyeJoint(B2JointJSImpl joint);
  external void SayGoodbyeFixture(B2FixtureJSImpl joint);
  external void __destroy__();
}

extension B2DistanceJointJSImplExtension on B2DistanceJointJSImpl {
  external B2Vec2JSImpl GetLocalAnchorA();
  external B2Vec2JSImpl GetLocalAnchorB();
  external double GetLength();
  external void SetLength(num length);
  external double GetMinLength();
  external void SetMinLength(num minLength);
  external double GetMaxLength();
  external void SetMaxLength(num maxLength);
  external double GetCurrentLength();
  external void SetStiffness(num stiffness);
  external double GetStiffness();
  external void SetDamping(num damping);
  external double GetDamping();
  external void Dump();
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void __destroy__();
}

extension B2DistanceJointDefJSImplExtension on B2DistanceJointDefJSImpl {
  external void Initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB,
      B2Vec2JSImpl anchorA, B2Vec2JSImpl anchorB);
  external B2Vec2JSImpl get_localAnchorA();
  external void set_localAnchorA(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localAnchorB();
  external void set_localAnchorB(B2Vec2JSImpl arg0);
  external double get_length();
  external void set_length(num arg0);
  external double get_minLength();
  external void set_minLength(num arg0);
  external double get_maxLength();
  external void set_maxLength(num arg0);
  external double get_stiffness();
  external void set_stiffness(num arg0);
  external double get_damping();
  external void set_damping(num arg0);
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2DrawJSImplExtension on B2DrawJSImpl {
  external void SetFlags(int flags);
  external int GetFlags();
  external void AppendFlags(int flags);
  external void ClearFlags(int flags);
  external void __destroy__();
}

extension JSDrawJSImplExtension on JSDrawJSImpl {
  external void DrawPolygon(
      B2Vec2JSImpl vertices, num vertexCount, B2ColorJSImpl color);
  external void DrawSolidPolygon(
      B2Vec2JSImpl vertices, num vertexCount, B2ColorJSImpl color);
  external void DrawCircle(
      B2Vec2JSImpl center, num radius, B2ColorJSImpl color);
  external void DrawSolidCircle(
      B2Vec2JSImpl center, num radius, B2Vec2JSImpl axis, B2ColorJSImpl color);
  external void DrawSegment(
      B2Vec2JSImpl p1, B2Vec2JSImpl p2, B2ColorJSImpl color);
  external void DrawTransform(B2TransformJSImpl xf);
  external void DrawPoint(B2Vec2JSImpl p, num size, B2ColorJSImpl color);
  external void __destroy__();
}

extension B2FrictionJointJSImplExtension on B2FrictionJointJSImpl {
  external B2Vec2JSImpl GetLocalAnchorA();
  external B2Vec2JSImpl GetLocalAnchorB();
  external void SetMaxForce(num force);
  external double GetMaxForce();
  external void SetMaxTorque(num torque);
  external double GetMaxTorque();
  external void Dump();
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void __destroy__();
}

extension B2FrictionJointDefJSImplExtension on B2FrictionJointDefJSImpl {
  external void Initialize(
      B2BodyJSImpl bodyA, B2BodyJSImpl bodyB, B2Vec2JSImpl anchor);
  external B2Vec2JSImpl get_localAnchorA();
  external void set_localAnchorA(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localAnchorB();
  external void set_localAnchorB(B2Vec2JSImpl arg0);
  external double get_maxForce();
  external void set_maxForce(num arg0);
  external double get_maxTorque();
  external void set_maxTorque(num arg0);
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2GearJointJSImplExtension on B2GearJointJSImpl {
  external B2JointJSImpl GetJoint1();
  external B2JointJSImpl GetJoint2();
  external void SetRatio(num ratio);
  external double GetRatio();
  external void Dump();
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void __destroy__();
}

extension B2GearJointDefJSImplExtension on B2GearJointDefJSImpl {
  external B2JointJSImpl get_joint1();
  external void set_joint1(B2JointJSImpl arg0);
  external B2JointJSImpl get_joint2();
  external void set_joint2(B2JointJSImpl arg0);
  external double get_ratio();
  external void set_ratio(num arg0);
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2JointEdgeJSImplExtension on B2JointEdgeJSImpl {
  external B2BodyJSImpl get_other();
  external void set_other(B2BodyJSImpl arg0);
  external B2JointJSImpl get_joint();
  external void set_joint(B2JointJSImpl arg0);
  external B2JointEdgeJSImpl get_prev();
  external void set_prev(B2JointEdgeJSImpl arg0);
  external B2JointEdgeJSImpl get_next();
  external void set_next(B2JointEdgeJSImpl arg0);
  external void __destroy__();
}

extension B2ManifoldJSImplExtension on B2ManifoldJSImpl {
  external B2ManifoldPointJSImpl get_points(num arg0);
  external void set_points(num arg0, B2ManifoldPointJSImpl arg1);
  external B2Vec2JSImpl get_localNormal();
  external void set_localNormal(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localPoint();
  external void set_localPoint(B2Vec2JSImpl arg0);
  external B2ManifoldType get_type();
  external void set_type(B2ManifoldType arg0);
  external num get_pointCount();
  external void set_pointCount(num arg0);
  external void __destroy__();
}

extension B2WorldManifoldJSImplExtension on B2WorldManifoldJSImpl {
  external void Initialize(B2ManifoldJSImpl manifold, B2TransformJSImpl xfA,
      num radiusA, B2TransformJSImpl xfB, num radiusB);
  external B2Vec2JSImpl get_normal();
  external void set_normal(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_points(num arg0);
  external void set_points(num arg0, B2Vec2JSImpl arg1);
  external double get_separations(num arg0);
  external void set_separations(num arg0, num arg1);
  external void __destroy__();
}

extension B2ManifoldPointJSImplExtension on B2ManifoldPointJSImpl {
  external B2Vec2JSImpl get_localPoint();
  external void set_localPoint(B2Vec2JSImpl arg0);
  external double get_normalImpulse();
  external void set_normalImpulse(num arg0);
  external double get_tangentImpulse();
  external void set_tangentImpulse(num arg0);
  external B2ContactIDJSImpl get_id();
  external void set_id(B2ContactIDJSImpl arg0);
  external void __destroy__();
}

extension B2Mat22JSImplExtension on B2Mat22JSImpl {
  external void Set(B2Vec2JSImpl c1, B2Vec2JSImpl c2);
  external void SetIdentity();
  external void SetZero();
  external B2Mat22JSImpl GetInverse();
  external B2Vec2JSImpl Solve(B2Vec2JSImpl b);
  external B2Vec2JSImpl get_ex();
  external void set_ex(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_ey();
  external void set_ey(B2Vec2JSImpl arg0);
  external void __destroy__();
}

extension B2Mat33JSImplExtension on B2Mat33JSImpl {
  external void SetZero();
  external B2Vec3JSImpl Solve33(B2Vec3JSImpl b);
  external B2Vec2JSImpl Solve22(B2Vec2JSImpl b);
  external void GetInverse22(B2Mat33JSImpl M);
  external void GetSymInverse33(B2Mat33JSImpl M);
  external B2Vec3JSImpl get_ex();
  external void set_ex(B2Vec3JSImpl arg0);
  external B2Vec3JSImpl get_ey();
  external void set_ey(B2Vec3JSImpl arg0);
  external B2Vec3JSImpl get_ez();
  external void set_ez(B2Vec3JSImpl arg0);
  external void __destroy__();
}

extension B2MouseJointJSImplExtension on B2MouseJointJSImpl {
  external void SetTarget(B2Vec2JSImpl target);
  external B2Vec2JSImpl GetTarget();
  external void SetMaxForce(num force);
  external double GetMaxForce();
  external void SetStiffness(num stiffness);
  external double GetStiffness();
  external void SetDamping(num damping);
  external double GetDamping();
  external void Dump();
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void __destroy__();
}

extension B2MouseJointDefJSImplExtension on B2MouseJointDefJSImpl {
  external B2Vec2JSImpl get_target();
  external void set_target(B2Vec2JSImpl arg0);
  external double get_maxForce();
  external void set_maxForce(num arg0);
  external double get_stiffness();
  external void set_stiffness(num arg0);
  external double get_damping();
  external void set_damping(num arg0);
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2PolygonShapeJSImplExtension on B2PolygonShapeJSImpl {
  external void Set(B2Vec2JSImpl vertices, num vertexCount);
  external void SetAsBox(num hx, num hy, B2Vec2JSImpl? center, num? angle);
  external B2ShapeType GetType();
  external num GetChildCount();
  external bool TestPoint(B2TransformJSImpl xf, B2Vec2JSImpl p);
  external bool RayCast(B2RayCastOutputJSImpl output,
      B2RayCastInputJSImpl input, B2TransformJSImpl transform, num childIndex);
  external void ComputeAABB(
      B2AABBJSImpl aabb, B2TransformJSImpl xf, num childIndex);
  external void ComputeMass(B2MassDataJSImpl massData, num density);
  external B2Vec2JSImpl get_m_centroid();
  external void set_m_centroid(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_m_vertices(num arg0);
  external void set_m_vertices(num arg0, B2Vec2JSImpl arg1);
  external B2Vec2JSImpl get_m_normals(num arg0);
  external void set_m_normals(num arg0, B2Vec2JSImpl arg1);
  external num get_m_count();
  external void set_m_count(num arg0);
  external B2ShapeType get_m_type();
  external void set_m_type(B2ShapeType arg0);
  external double get_m_radius();
  external void set_m_radius(num arg0);
  external void __destroy__();
}

extension B2PrismaticJointJSImplExtension on B2PrismaticJointJSImpl {
  external B2Vec2JSImpl GetLocalAnchorA();
  external B2Vec2JSImpl GetLocalAnchorB();
  external B2Vec2JSImpl GetLocalAxisA();
  external double GetReferenceAngle();
  external double GetJointTranslation();
  external double GetJointSpeed();
  external bool IsLimitEnabled();
  external void EnableLimit(bool flag);
  external double GetLowerLimit();
  external double GetUpperLimit();
  external void SetLimits(num lower, num upper);
  external bool IsMotorEnabled();
  external void EnableMotor(bool flag);
  external void SetMotorSpeed(num speed);
  external double GetMotorSpeed();
  external void SetMaxMotorForce(num force);
  external double GetMaxMotorForce();
  external double GetMotorForce(num inv_dt);
  external void Dump();
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void __destroy__();
}

extension B2PrismaticJointDefJSImplExtension on B2PrismaticJointDefJSImpl {
  external void Initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB,
      B2Vec2JSImpl anchor, B2Vec2JSImpl axis);
  external B2Vec2JSImpl get_localAnchorA();
  external void set_localAnchorA(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localAnchorB();
  external void set_localAnchorB(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localAxisA();
  external void set_localAxisA(B2Vec2JSImpl arg0);
  external double get_referenceAngle();
  external void set_referenceAngle(num arg0);
  external bool get_enableLimit();
  external void set_enableLimit(bool arg0);
  external double get_lowerTranslation();
  external void set_lowerTranslation(num arg0);
  external double get_upperTranslation();
  external void set_upperTranslation(num arg0);
  external bool get_enableMotor();
  external void set_enableMotor(bool arg0);
  external double get_maxMotorForce();
  external void set_maxMotorForce(num arg0);
  external double get_motorSpeed();
  external void set_motorSpeed(num arg0);
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2ProfileJSImplExtension on B2ProfileJSImpl {
  external double get_step();
  external void set_step(num arg0);
  external double get_collide();
  external void set_collide(num arg0);
  external double get_solve();
  external void set_solve(num arg0);
  external double get_solveInit();
  external void set_solveInit(num arg0);
  external double get_solveVelocity();
  external void set_solveVelocity(num arg0);
  external double get_solvePosition();
  external void set_solvePosition(num arg0);
  external double get_broadphase();
  external void set_broadphase(num arg0);
  external double get_solveTOI();
  external void set_solveTOI(num arg0);
  external void __destroy__();
}

extension B2PulleyJointJSImplExtension on B2PulleyJointJSImpl {
  external B2Vec2JSImpl GetGroundAnchorA();
  external B2Vec2JSImpl GetGroundAnchorB();
  external double GetLengthA();
  external double GetLengthB();
  external double GetRatio();
  external double GetCurrentLengthA();
  external double GetCurrentLengthB();
  external void Dump();
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void __destroy__();
}

extension B2PulleyJointDefJSImplExtension on B2PulleyJointDefJSImpl {
  external void Initialize(
      B2BodyJSImpl bodyA,
      B2BodyJSImpl bodyB,
      B2Vec2JSImpl groundAnchorA,
      B2Vec2JSImpl groundAnchorB,
      B2Vec2JSImpl anchorA,
      B2Vec2JSImpl anchorB,
      num ratio);
  external B2Vec2JSImpl get_groundAnchorA();
  external void set_groundAnchorA(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_groundAnchorB();
  external void set_groundAnchorB(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localAnchorA();
  external void set_localAnchorA(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localAnchorB();
  external void set_localAnchorB(B2Vec2JSImpl arg0);
  external double get_lengthA();
  external void set_lengthA(num arg0);
  external double get_lengthB();
  external void set_lengthB(num arg0);
  external double get_ratio();
  external void set_ratio(num arg0);
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2RayCastInputJSImplExtension on B2RayCastInputJSImpl {
  external B2Vec2JSImpl get_p1();
  external void set_p1(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_p2();
  external void set_p2(B2Vec2JSImpl arg0);
  external double get_maxFraction();
  external void set_maxFraction(num arg0);
  external void __destroy__();
}

extension B2RayCastOutputJSImplExtension on B2RayCastOutputJSImpl {
  external B2Vec2JSImpl get_normal();
  external void set_normal(B2Vec2JSImpl arg0);
  external double get_fraction();
  external void set_fraction(num arg0);
  external void __destroy__();
}

extension B2RevoluteJointJSImplExtension on B2RevoluteJointJSImpl {
  external B2Vec2JSImpl GetLocalAnchorA();
  external B2Vec2JSImpl GetLocalAnchorB();
  external double GetReferenceAngle();
  external double GetJointAngle();
  external double GetJointSpeed();
  external bool IsLimitEnabled();
  external void EnableLimit(bool flag);
  external double GetLowerLimit();
  external double GetUpperLimit();
  external void SetLimits(num lower, num upper);
  external bool IsMotorEnabled();
  external void EnableMotor(bool flag);
  external void SetMotorSpeed(num speed);
  external double GetMotorSpeed();
  external void SetMaxMotorTorque(num torque);
  external double GetMaxMotorTorque();
  external double GetMotorTorque(num inv_dt);
  external void Dump();
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void __destroy__();
}

extension B2RevoluteJointDefJSImplExtension on B2RevoluteJointDefJSImpl {
  external void Initialize(
      B2BodyJSImpl bodyA, B2BodyJSImpl bodyB, B2Vec2JSImpl anchor);
  external B2Vec2JSImpl get_localAnchorA();
  external void set_localAnchorA(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localAnchorB();
  external void set_localAnchorB(B2Vec2JSImpl arg0);
  external double get_referenceAngle();
  external void set_referenceAngle(num arg0);
  external bool get_enableLimit();
  external void set_enableLimit(bool arg0);
  external double get_lowerAngle();
  external void set_lowerAngle(num arg0);
  external double get_upperAngle();
  external void set_upperAngle(num arg0);
  external bool get_enableMotor();
  external void set_enableMotor(bool arg0);
  external double get_motorSpeed();
  external void set_motorSpeed(num arg0);
  external double get_maxMotorTorque();
  external void set_maxMotorTorque(num arg0);
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2RotJSImplExtension on B2RotJSImpl {
  external void Set(num angle);
  external void SetIdentity();
  external double GetAngle();
  external B2Vec2JSImpl GetXAxis();
  external B2Vec2JSImpl GetYAxis();
  external double get_s();
  external void set_s(num arg0);
  external double get_c();
  external void set_c(num arg0);
  external void __destroy__();
}

extension B2WheelJointJSImplExtension on B2WheelJointJSImpl {
  external B2Vec2JSImpl GetLocalAnchorA();
  external B2Vec2JSImpl GetLocalAnchorB();
  external B2Vec2JSImpl GetLocalAxisA();
  external double GetJointTranslation();
  external double GetJointLinearSpeed();
  external double GetJointAngle();
  external double GetJointAngularSpeed();
  external bool IsLimitEnabled();
  external void EnableLimit(bool flag);
  external double GetLowerLimit();
  external double GetUpperLimit();
  external void SetLimits(num lower, num upper);
  external bool IsMotorEnabled();
  external void EnableMotor(bool flag);
  external void SetMotorSpeed(num speed);
  external double GetMotorSpeed();
  external void SetMaxMotorTorque(num torque);
  external double GetMaxMotorTorque();
  external double GetMotorTorque(num inv_dt);
  external void SetStiffness(num stiffness);
  external double GetStiffness();
  external void SetDamping(num damping);
  external double GetDamping();
  external void Dump();
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void __destroy__();
}

extension B2WheelJointDefJSImplExtension on B2WheelJointDefJSImpl {
  external void Initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB,
      B2Vec2JSImpl anchor, B2Vec2JSImpl axis);
  external B2Vec2JSImpl get_localAnchorA();
  external void set_localAnchorA(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localAnchorB();
  external void set_localAnchorB(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_localAxisA();
  external void set_localAxisA(B2Vec2JSImpl arg0);
  external bool get_enableLimit();
  external void set_enableLimit(bool arg0);
  external double get_lowerTranslation();
  external void set_lowerTranslation(num arg0);
  external double get_upperTranslation();
  external void set_upperTranslation(num arg0);
  external bool get_enableMotor();
  external void set_enableMotor(bool arg0);
  external double get_maxMotorTorque();
  external void set_maxMotorTorque(num arg0);
  external double get_motorSpeed();
  external void set_motorSpeed(num arg0);
  external double get_stiffness();
  external void set_stiffness(num arg0);
  external double get_damping();
  external void set_damping(num arg0);
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2MotorJointJSImplExtension on B2MotorJointJSImpl {
  external void SetLinearOffset(B2Vec2JSImpl linearOffset);
  external B2Vec2JSImpl GetLinearOffset();
  external void SetAngularOffset(num angularOffset);
  external double GetAngularOffset();
  external void SetMaxForce(num force);
  external double GetMaxForce();
  external void SetMaxTorque(num torque);
  external double GetMaxTorque();
  external void SetCorrectionFactor(num factor);
  external double GetCorrectionFactor();
  external void Dump();
  external B2JointType GetType();
  external B2BodyJSImpl GetBodyA();
  external B2BodyJSImpl GetBodyB();
  external B2Vec2JSImpl GetAnchorA();
  external B2Vec2JSImpl GetAnchorB();
  external B2Vec2JSImpl GetReactionForce(num inv_dt);
  external double GetReactionTorque(num inv_dt);
  external B2JointJSImpl GetNext();
  external B2JointUserDataJSImpl GetUserData();
  external bool GetCollideConnected();
  external void __destroy__();
}

extension B2MotorJointDefJSImplExtension on B2MotorJointDefJSImpl {
  external void Initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB);
  external B2Vec2JSImpl get_linearOffset();
  external void set_linearOffset(B2Vec2JSImpl arg0);
  external double get_angularOffset();
  external void set_angularOffset(num arg0);
  external double get_maxForce();
  external void set_maxForce(num arg0);
  external double get_maxTorque();
  external void set_maxTorque(num arg0);
  external double get_correctionFactor();
  external void set_correctionFactor(num arg0);
  external B2JointType get_type();
  external void set_type(B2JointType arg0);
  external B2JointUserDataJSImpl get_userData();
  external void set_userData(B2JointUserDataJSImpl arg0);
  external B2BodyJSImpl get_bodyA();
  external void set_bodyA(B2BodyJSImpl arg0);
  external B2BodyJSImpl get_bodyB();
  external void set_bodyB(B2BodyJSImpl arg0);
  external bool get_collideConnected();
  external void set_collideConnected(bool arg0);
  external void __destroy__();
}

extension B2RopeTuningJSImplExtension on B2RopeTuningJSImpl {
  external B2StretchingModel get_stretchingModel();
  external void set_stretchingModel(B2StretchingModel arg0);
  external B2BendingModel get_bendingModel();
  external void set_bendingModel(B2BendingModel arg0);
  external double get_damping();
  external void set_damping(num arg0);
  external double get_stretchStiffness();
  external void set_stretchStiffness(num arg0);
  external double get_stretchHertz();
  external void set_stretchHertz(num arg0);
  external double get_stretchDamping();
  external void set_stretchDamping(num arg0);
  external double get_bendStiffness();
  external void set_bendStiffness(num arg0);
  external double get_bendHertz();
  external void set_bendHertz(num arg0);
  external double get_bendDamping();
  external void set_bendDamping(num arg0);
  external bool get_isometric();
  external void set_isometric(bool arg0);
  external bool get_fixedEffectiveMass();
  external void set_fixedEffectiveMass(bool arg0);
  external bool get_warmStart();
  external void set_warmStart(bool arg0);
  external void __destroy__();
}

extension B2RopeDefJSImplExtension on B2RopeDefJSImpl {
  external B2Vec2JSImpl get_position();
  external void set_position(B2Vec2JSImpl arg0);
  external B2Vec2JSImpl get_vertices();
  external void set_vertices(B2Vec2JSImpl arg0);
  external num get_count();
  external void set_count(num arg0);
  external B2Vec2JSImpl get_gravity();
  external void set_gravity(B2Vec2JSImpl arg0);
  external B2RopeTuningJSImpl get_tuning();
  external void set_tuning(B2RopeTuningJSImpl arg0);
  external void __destroy__();
}

extension B2RopeJSImplExtension on B2RopeJSImpl {
  external void Create(B2RopeDefJSImpl def);
  external void SetTuning(B2RopeTuningJSImpl tuning);
  external void Step(num timeStep, num iterations, B2Vec2JSImpl position);
  external void Reset(B2Vec2JSImpl position);
  //external void Draw(B2DrawJSImpl draw);
  external void __destroy__();
}

extension B2ClipVertexJSImplExtension on B2ClipVertexJSImpl {
  external B2Vec2JSImpl get_v();
  external void set_v(B2Vec2JSImpl arg0);
  external B2ContactIDJSImpl get_id();
  external void set_id(B2ContactIDJSImpl arg0);
  external void __destroy__();
}
