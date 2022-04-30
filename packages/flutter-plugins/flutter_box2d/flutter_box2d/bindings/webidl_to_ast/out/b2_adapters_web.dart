@JS()
library box2d;

import 'package:js/js.dart';

import 'b2_delegates.dart';
import 'b2_enums.dart';

class B2ShapeJSAdapter implements B2ShapePlatform {

	B2ShapeJSAdapter._(B2ShapeJSImpl impl) : _impl = impl;

	final B2ShapeJSImpl _impl;

	B2ShapeType getType() => _impl.getType();
	int getChildCount() => _impl.getChildCount().toInt();
	bool testPoint(B2TransformJSAdapter xf, B2Vec2JSAdapter p) => _impl.testPoint(xf._impl, p._impl);
	bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input, B2TransformJSAdapter transform, int childIndex) => _impl.rayCast(output._impl, input._impl, transform._impl, childIndex);
	void computeAABB(B2AABBJSAdapter aabb, B2TransformJSAdapter xf, int childIndex) => _impl.computeAABB(aabb._impl, xf._impl, childIndex);
	void computeMass(B2MassDataJSAdapter massData, double density) => _impl.computeMass(massData._impl, density);
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
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
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

	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dump() => _impl.dump();
}

class VoidPtrJSAdapter implements VoidPtrPlatform {

	VoidPtrJSAdapter._(VoidPtrJSImpl impl) : _impl = impl;

	final VoidPtrJSImpl _impl;

	void dispose() => _impl.__destroy__();
}

class B2ContactJSAdapter implements B2ContactPlatform {

	B2ContactJSAdapter._(B2ContactJSImpl impl) : _impl = impl;

	final B2ContactJSImpl _impl;

	B2ManifoldJSAdapter getManifold() => B2ManifoldJSAdapter._(_impl.getManifold());
	void getWorldManifold(B2WorldManifoldJSAdapter manifold) => _impl.getWorldManifold(manifold._impl);
	bool isTouching() => _impl.isTouching();
	void setEnabled(bool flag) => _impl.setEnabled(flag);
	bool isEnabled() => _impl.isEnabled();
	B2ContactJSAdapter getNext() => B2ContactJSAdapter._(_impl.getNext());
	B2FixtureJSAdapter getFixtureA() => B2FixtureJSAdapter._(_impl.getFixtureA());
	int getChildIndexA() => _impl.getChildIndexA().toInt();
	B2FixtureJSAdapter getFixtureB() => B2FixtureJSAdapter._(_impl.getFixtureB());
	int getChildIndexB() => _impl.getChildIndexB().toInt();
	void setFriction(double friction) => _impl.setFriction(friction);
	double getFriction() => _impl.getFriction().toDouble();
	void resetFriction() => _impl.resetFriction();
	void setRestitution(double restitution) => _impl.setRestitution(restitution);
	double getRestitution() => _impl.getRestitution().toDouble();
	void resetRestitution() => _impl.resetRestitution();
	void setRestitutionThreshold(double threshold) => _impl.setRestitutionThreshold(threshold);
	double getRestitutionThreshold() => _impl.getRestitutionThreshold().toDouble();
	void resetRestitutionThreshold() => _impl.resetRestitutionThreshold();
	void setTangentSpeed(double speed) => _impl.setTangentSpeed(speed);
	double getTangentSpeed() => _impl.getTangentSpeed().toDouble();
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

	void beginContact(B2ContactJSAdapter contact) => _impl.beginContact(contact._impl);
	void endContact(B2ContactJSAdapter contact) => _impl.endContact(contact._impl);
	void preSolve(B2ContactJSAdapter contact, B2ManifoldJSAdapter oldManifold) => _impl.preSolve(contact._impl, oldManifold._impl);
	void postSolve(B2ContactJSAdapter contact, B2ContactImpulseJSAdapter impulse) => _impl.postSolve(contact._impl, impulse._impl);
	void dispose() => _impl.__destroy__();
}

class B2WorldJSAdapter implements B2WorldPlatform {

	B2WorldJSAdapter._(B2WorldJSImpl impl) : _impl = impl;

	final B2WorldJSImpl _impl;

	B2WorldJSAdapter.from1(B2Vec2JSAdapter gravity) : _impl = B2WorldJSImpl.from1(gravity._impl);

	//void setDestructionListener(B2DestructionListenerJSAdapter listener) => _impl.setDestructionListener(listener._impl);
	//void setContactFilter(JSContactFilterJSAdapter filter) => _impl.setContactFilter(filter._impl);
	//void setContactListener(JSContactListenerJSAdapter listener) => _impl.setContactListener(listener._impl);
	//void setDebugDraw(B2DrawJSAdapter debugDraw) => _impl.setDebugDraw(debugDraw._impl);
	B2BodyJSAdapter createBody(B2BodyDefJSAdapter def) => B2BodyJSAdapter._(_impl.createBody(def._impl));
	void destroyBody(B2BodyJSAdapter body) => _impl.destroyBody(body._impl);
	B2JointJSAdapter createJoint(B2JointDefJSAdapter def) => B2JointJSAdapter._(_impl.createJoint(def._impl));
	void destroyJoint(B2JointJSAdapter joint) => _impl.destroyJoint(joint._impl);
	void step(double timeStep, int velocityIterations, int positionIterations) => _impl.step(timeStep, velocityIterations, positionIterations);
	void clearForces() => _impl.clearForces();
	void debugDraw() => _impl.debugDraw();
	//void queryAABB(B2QueryCallbackJSAdapter callback, B2AABBJSAdapter aabb) => _impl.queryAABB(callback._impl, aabb._impl);
	//void rayCast(B2RayCastCallbackJSAdapter callback, B2Vec2JSAdapter point1, B2Vec2JSAdapter point2) => _impl.rayCast(callback._impl, point1._impl, point2._impl);
	B2BodyJSAdapter getBodyList() => B2BodyJSAdapter._(_impl.getBodyList());
	B2JointJSAdapter getJointList() => B2JointJSAdapter._(_impl.getJointList());
	B2ContactJSAdapter getContactList() => B2ContactJSAdapter._(_impl.getContactList());
	void setAllowSleeping(bool flag) => _impl.setAllowSleeping(flag);
	bool getAllowSleeping() => _impl.getAllowSleeping();
	void setWarmStarting(bool flag) => _impl.setWarmStarting(flag);
	bool getWarmStarting() => _impl.getWarmStarting();
	void setContinuousPhysics(bool flag) => _impl.setContinuousPhysics(flag);
	bool getContinuousPhysics() => _impl.getContinuousPhysics();
	void setSubStepping(bool flag) => _impl.setSubStepping(flag);
	bool getSubStepping() => _impl.getSubStepping();
	int getProxyCount() => _impl.getProxyCount().toInt();
	int getBodyCount() => _impl.getBodyCount().toInt();
	int getJointCount() => _impl.getJointCount().toInt();
	int getContactCount() => _impl.getContactCount().toInt();
	int getTreeHeight() => _impl.getTreeHeight().toInt();
	int getTreeBalance() => _impl.getTreeBalance().toInt();
	double getTreeQuality() => _impl.getTreeQuality().toDouble();
	void setGravity(B2Vec2JSAdapter gravity) => _impl.setGravity(gravity._impl);
	B2Vec2JSAdapter getGravity() => B2Vec2JSAdapter._(_impl.getGravity());
	bool isLocked() => _impl.isLocked();
	void setAutoClearForces(bool flag) => _impl.setAutoClearForces(flag);
	bool getAutoClearForces() => _impl.getAutoClearForces();
	B2ProfileJSAdapter getProfile() => B2ProfileJSAdapter._(_impl.getProfile());
	void dump() => _impl.dump();
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
	B2FixtureUserDataJSAdapter get_userData() => B2FixtureUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2FixtureUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
	double get_friction() => _impl.get_friction().toDouble();
	void set_friction(double arg0) => _impl.set_friction(arg0);
	double get_restitution() => _impl.get_restitution().toDouble();
	void set_restitution(double arg0) => _impl.set_restitution(arg0);
	double get_restitutionThreshold() => _impl.get_restitutionThreshold().toDouble();
	void set_restitutionThreshold(double arg0) => _impl.set_restitutionThreshold(arg0);
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

	B2ShapeType getType() => _impl.getType();
	B2ShapeJSAdapter getShape() => B2ShapeJSAdapter._(_impl.getShape());
	void setSensor(bool sensor) => _impl.setSensor(sensor);
	bool isSensor() => _impl.isSensor();
	void setFilterData(B2FilterJSAdapter filter) => _impl.setFilterData(filter._impl);
	B2FilterJSAdapter getFilterData() => B2FilterJSAdapter._(_impl.getFilterData());
	void refilter() => _impl.refilter();
	B2BodyJSAdapter getBody() => B2BodyJSAdapter._(_impl.getBody());
	B2FixtureJSAdapter getNext() => B2FixtureJSAdapter._(_impl.getNext());
	B2FixtureUserDataJSAdapter getUserData() => B2FixtureUserDataJSAdapter._(_impl.getUserData());
	bool testPoint(B2Vec2JSAdapter p) => _impl.testPoint(p._impl);
	bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input, int childIndex) => _impl.rayCast(output._impl, input._impl, childIndex);
	void getMassData(B2MassDataJSAdapter massData) => _impl.getMassData(massData._impl);
	void setDensity(double density) => _impl.setDensity(density);
	double getDensity() => _impl.getDensity().toDouble();
	double getFriction() => _impl.getFriction().toDouble();
	void setFriction(double friction) => _impl.setFriction(friction);
	double getRestitution() => _impl.getRestitution().toDouble();
	void setRestitution(double restitution) => _impl.setRestitution(restitution);
	double getRestitutionThreshold() => _impl.getRestitutionThreshold().toDouble();
	void setRestitutionThreshold(double threshold) => _impl.setRestitutionThreshold(threshold);
	B2AABBJSAdapter getAABB(int childIndex) => B2AABBJSAdapter._(_impl.getAABB(childIndex));
	void dump(int bodyIndex) => _impl.dump(bodyIndex);
	void dispose() => _impl.__destroy__();
}

class B2TransformJSAdapter implements B2TransformPlatform {

	B2TransformJSAdapter._(B2TransformJSImpl impl) : _impl = impl;

	final B2TransformJSImpl _impl;

	B2TransformJSAdapter() : _impl = B2TransformJSImpl();

	B2TransformJSAdapter.from2(B2Vec2JSAdapter position, B2RotJSAdapter rotation) : _impl = B2TransformJSImpl.from2(position._impl, rotation._impl);

	void setIdentity() => _impl.setIdentity();
	void set(B2Vec2JSAdapter position, double angle) => _impl.set(position._impl, angle);
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

	double reportFixture(B2FixtureJSAdapter fixture, B2Vec2JSAdapter point, B2Vec2JSAdapter normal, double fraction) => _impl.reportFixture(fixture._impl, point._impl, normal._impl, fraction).toDouble();
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

	bool reportFixture(B2FixtureJSAdapter fixture) => _impl.reportFixture(fixture._impl);
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

	void setZero() => _impl.setZero();
	void set(double x, double y) => _impl.set(x, y);
	void op_add(B2Vec2JSAdapter v) => _impl.op_add(v._impl);
	void op_sub(B2Vec2JSAdapter v) => _impl.op_sub(v._impl);
	void op_mul(double s) => _impl.op_mul(s);
	double length() => _impl.length().toDouble();
	double lengthSquared() => _impl.lengthSquared().toDouble();
	double normalize() => _impl.normalize().toDouble();
	bool isValid() => _impl.isValid();
	B2Vec2JSAdapter skew() => B2Vec2JSAdapter._(_impl.skew());
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

	B2Vec3JSAdapter.from3(double x, double y, double z) : _impl = B2Vec3JSImpl.from3(x, y, z);

	void setZero() => _impl.setZero();
	void set(double x, double y, double z) => _impl.set(x, y, z);
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

	B2FixtureJSAdapter createFixture1(B2FixtureDefJSAdapter shape) => B2FixtureJSAdapter._(_impl.createFixture1(shape._impl));
	B2FixtureJSAdapter createFixture2(B2ShapeJSAdapter shape, double density) => B2FixtureJSAdapter._(_impl.createFixture2(shape._impl, density));
	void destroyFixture(B2FixtureJSAdapter fixture) => _impl.destroyFixture(fixture._impl);
	void setTransform(B2Vec2JSAdapter position, double angle) => _impl.setTransform(position._impl, angle);
	B2TransformJSAdapter getTransform() => B2TransformJSAdapter._(_impl.getTransform());
	B2Vec2JSAdapter getPosition() => B2Vec2JSAdapter._(_impl.getPosition());
	double getAngle() => _impl.getAngle().toDouble();
	B2Vec2JSAdapter getWorldCenter() => B2Vec2JSAdapter._(_impl.getWorldCenter());
	B2Vec2JSAdapter getLocalCenter() => B2Vec2JSAdapter._(_impl.getLocalCenter());
	void setLinearVelocity(B2Vec2JSAdapter v) => _impl.setLinearVelocity(v._impl);
	B2Vec2JSAdapter getLinearVelocity() => B2Vec2JSAdapter._(_impl.getLinearVelocity());
	void setAngularVelocity(double omega) => _impl.setAngularVelocity(omega);
	double getAngularVelocity() => _impl.getAngularVelocity().toDouble();
	void applyForce(B2Vec2JSAdapter force, B2Vec2JSAdapter point, bool wake) => _impl.applyForce(force._impl, point._impl, wake);
	void applyForceToCenter(B2Vec2JSAdapter force, bool wake) => _impl.applyForceToCenter(force._impl, wake);
	void applyTorque(double torque, bool awake) => _impl.applyTorque(torque, awake);
	void applyLinearImpulse(B2Vec2JSAdapter impulse, B2Vec2JSAdapter point, bool wake) => _impl.applyLinearImpulse(impulse._impl, point._impl, wake);
	void applyLinearImpulseToCenter(B2Vec2JSAdapter impulse, bool wake) => _impl.applyLinearImpulseToCenter(impulse._impl, wake);
	void applyAngularImpulse(double impulse, bool wake) => _impl.applyAngularImpulse(impulse, wake);
	double getMass() => _impl.getMass().toDouble();
	double getInertia() => _impl.getInertia().toDouble();
	void getMassData(B2MassDataJSAdapter data) => _impl.getMassData(data._impl);
	void setMassData(B2MassDataJSAdapter data) => _impl.setMassData(data._impl);
	void resetMassData() => _impl.resetMassData();
	B2Vec2JSAdapter getWorldPoint(B2Vec2JSAdapter localPoint) => B2Vec2JSAdapter._(_impl.getWorldPoint(localPoint._impl));
	B2Vec2JSAdapter getWorldVector(B2Vec2JSAdapter localVector) => B2Vec2JSAdapter._(_impl.getWorldVector(localVector._impl));
	B2Vec2JSAdapter getLocalPoint(B2Vec2JSAdapter worldPoint) => B2Vec2JSAdapter._(_impl.getLocalPoint(worldPoint._impl));
	B2Vec2JSAdapter getLocalVector(B2Vec2JSAdapter worldVector) => B2Vec2JSAdapter._(_impl.getLocalVector(worldVector._impl));
	B2Vec2JSAdapter getLinearVelocityFromWorldPoint(B2Vec2JSAdapter worldPoint) => B2Vec2JSAdapter._(_impl.getLinearVelocityFromWorldPoint(worldPoint._impl));
	B2Vec2JSAdapter getLinearVelocityFromLocalPoint(B2Vec2JSAdapter localPoint) => B2Vec2JSAdapter._(_impl.getLinearVelocityFromLocalPoint(localPoint._impl));
	double getLinearDamping() => _impl.getLinearDamping().toDouble();
	void setLinearDamping(double linearDamping) => _impl.setLinearDamping(linearDamping);
	double getAngularDamping() => _impl.getAngularDamping().toDouble();
	void setAngularDamping(double angularDamping) => _impl.setAngularDamping(angularDamping);
	double getGravityScale() => _impl.getGravityScale().toDouble();
	void setGravityScale(double scale) => _impl.setGravityScale(scale);
	void setType(B2BodyType type) => _impl.setType(type);
	B2BodyType getType() => _impl.getType();
	void setBullet(bool flag) => _impl.setBullet(flag);
	bool isBullet() => _impl.isBullet();
	void setSleepingAllowed(bool flag) => _impl.setSleepingAllowed(flag);
	bool isSleepingAllowed() => _impl.isSleepingAllowed();
	void setAwake(bool flag) => _impl.setAwake(flag);
	bool isAwake() => _impl.isAwake();
	void setEnabled(bool flag) => _impl.setEnabled(flag);
	bool isEnabled() => _impl.isEnabled();
	void setFixedRotation(bool flag) => _impl.setFixedRotation(flag);
	bool isFixedRotation() => _impl.isFixedRotation();
	B2FixtureJSAdapter getFixtureList() => B2FixtureJSAdapter._(_impl.getFixtureList());
	B2JointEdgeJSAdapter getJointList() => B2JointEdgeJSAdapter._(_impl.getJointList());
	B2ContactEdgeJSAdapter getContactList() => B2ContactEdgeJSAdapter._(_impl.getContactList());
	B2BodyJSAdapter getNext() => B2BodyJSAdapter._(_impl.getNext());
	B2BodyUserDataJSAdapter getUserData() => B2BodyUserDataJSAdapter._(_impl.getUserData());
	B2WorldJSAdapter getWorld() => B2WorldJSAdapter._(_impl.getWorld());
	void dump() => _impl.dump();
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
	B2Vec2JSAdapter get_linearVelocity() => B2Vec2JSAdapter._(_impl.get_linearVelocity());
	void set_linearVelocity(B2Vec2JSAdapter arg0) => _impl.set_linearVelocity(arg0._impl);
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
	B2BodyUserDataJSAdapter get_userData() => B2BodyUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2BodyUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
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

	bool isValid() => _impl.isValid();
	B2Vec2JSAdapter getCenter() => B2Vec2JSAdapter._(_impl.getCenter());
	B2Vec2JSAdapter getExtents() => B2Vec2JSAdapter._(_impl.getExtents());
	double getPerimeter() => _impl.getPerimeter().toDouble();
	void combine1(B2AABBJSAdapter aabb1) => _impl.combine1(aabb1._impl);
	void combine2(B2AABBJSAdapter aabb1, B2AABBJSAdapter aabb2) => _impl.combine2(aabb1._impl, aabb2._impl);
	bool contains(B2AABBJSAdapter aabb) => _impl.contains(aabb._impl);
	bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input) => _impl.rayCast(output._impl, input._impl);
	B2Vec2JSAdapter get_lowerBound() => B2Vec2JSAdapter._(_impl.get_lowerBound());
	void set_lowerBound(B2Vec2JSAdapter arg0) => _impl.set_lowerBound(arg0._impl);
	B2Vec2JSAdapter get_upperBound() => B2Vec2JSAdapter._(_impl.get_upperBound());
	void set_upperBound(B2Vec2JSAdapter arg0) => _impl.set_upperBound(arg0._impl);
	void dispose() => _impl.__destroy__();
}

class B2CircleShapeJSAdapter implements B2CircleShapePlatform {

	B2CircleShapeJSAdapter._(B2CircleShapeJSImpl impl) : _impl = impl;

	final B2CircleShapeJSImpl _impl;

	B2CircleShapeJSAdapter() : _impl = B2CircleShapeJSImpl();

	B2ShapeType getType() => _impl.getType();
	int getChildCount() => _impl.getChildCount().toInt();
	bool testPoint(B2TransformJSAdapter xf, B2Vec2JSAdapter p) => _impl.testPoint(xf._impl, p._impl);
	bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input, B2TransformJSAdapter transform, int childIndex) => _impl.rayCast(output._impl, input._impl, transform._impl, childIndex);
	void computeAABB(B2AABBJSAdapter aabb, B2TransformJSAdapter xf, int childIndex) => _impl.computeAABB(aabb._impl, xf._impl, childIndex);
	void computeMass(B2MassDataJSAdapter massData, double density) => _impl.computeMass(massData._impl, density);
	B2Vec2JSAdapter get_m_p() => B2Vec2JSAdapter._(_impl.get_m_p());
	void set_m_p(B2Vec2JSAdapter arg0) => _impl.set_m_p(arg0._impl);
	B2ShapeType get_m_type() => _impl.get_m_type();
	void set_m_type(B2ShapeType arg0) => _impl.set_m_type(arg0);
	double get_m_radius() => _impl.get_m_radius().toDouble();
	void set_m_radius(double arg0) => _impl.set_m_radius(arg0);
	void dispose() => _impl.__destroy__();
}

class B2EdgeShapeJSAdapter implements B2EdgeShapePlatform {

	B2EdgeShapeJSAdapter._(B2EdgeShapeJSImpl impl) : _impl = impl;

	final B2EdgeShapeJSImpl _impl;

	B2EdgeShapeJSAdapter() : _impl = B2EdgeShapeJSImpl();

	void setOneSided(B2Vec2JSAdapter v0, B2Vec2JSAdapter v1, B2Vec2JSAdapter v2, B2Vec2JSAdapter v3) => _impl.setOneSided(v0._impl, v1._impl, v2._impl, v3._impl);
	void setTwoSided(B2Vec2JSAdapter v1, B2Vec2JSAdapter v2) => _impl.setTwoSided(v1._impl, v2._impl);
	B2ShapeType getType() => _impl.getType();
	int getChildCount() => _impl.getChildCount().toInt();
	bool testPoint(B2TransformJSAdapter xf, B2Vec2JSAdapter p) => _impl.testPoint(xf._impl, p._impl);
	bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input, B2TransformJSAdapter transform, int childIndex) => _impl.rayCast(output._impl, input._impl, transform._impl, childIndex);
	void computeAABB(B2AABBJSAdapter aabb, B2TransformJSAdapter xf, int childIndex) => _impl.computeAABB(aabb._impl, xf._impl, childIndex);
	void computeMass(B2MassDataJSAdapter massData, double density) => _impl.computeMass(massData._impl, density);
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

class B2WeldJointJSAdapter implements B2WeldJointPlatform {

	B2WeldJointJSAdapter._(B2WeldJointJSImpl impl) : _impl = impl;

	final B2WeldJointJSImpl _impl;

	B2Vec2JSAdapter getLocalAnchorA() => B2Vec2JSAdapter._(_impl.getLocalAnchorA());
	B2Vec2JSAdapter getLocalAnchorB() => B2Vec2JSAdapter._(_impl.getLocalAnchorB());
	double getReferenceAngle() => _impl.getReferenceAngle().toDouble();
	void setStiffness(double stiffness) => _impl.setStiffness(stiffness);
	double getStiffness() => _impl.getStiffness().toDouble();
	void setDamping(double damping) => _impl.setDamping(damping);
	double getDamping() => _impl.getDamping().toDouble();
	void dump() => _impl.dump();
	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dispose() => _impl.__destroy__();
}

class B2WeldJointDefJSAdapter implements B2WeldJointDefPlatform {

	B2WeldJointDefJSAdapter._(B2WeldJointDefJSImpl impl) : _impl = impl;

	final B2WeldJointDefJSImpl _impl;

	B2WeldJointDefJSAdapter() : _impl = B2WeldJointDefJSImpl();

	void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB, B2Vec2JSAdapter anchor) => _impl.initialize(bodyA._impl, bodyB._impl, anchor._impl);
	B2Vec2JSAdapter get_localAnchorA() => B2Vec2JSAdapter._(_impl.get_localAnchorA());
	void set_localAnchorA(B2Vec2JSAdapter arg0) => _impl.set_localAnchorA(arg0._impl);
	B2Vec2JSAdapter get_localAnchorB() => B2Vec2JSAdapter._(_impl.get_localAnchorB());
	void set_localAnchorB(B2Vec2JSAdapter arg0) => _impl.set_localAnchorB(arg0._impl);
	double get_referenceAngle() => _impl.get_referenceAngle().toDouble();
	void set_referenceAngle(double arg0) => _impl.set_referenceAngle(arg0);
	double get_stiffness() => _impl.get_stiffness().toDouble();
	void set_stiffness(double arg0) => _impl.set_stiffness(arg0);
	double get_damping() => _impl.get_damping().toDouble();
	void set_damping(double arg0) => _impl.set_damping(arg0);
	B2JointType get_type() => _impl.get_type();
	void set_type(B2JointType arg0) => _impl.set_type(arg0);
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
	B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
	void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
	B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
	void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
	bool get_collideConnected() => _impl.get_collideConnected();
	void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
	void dispose() => _impl.__destroy__();
}

class B2ChainShapeJSAdapter implements B2ChainShapePlatform {

	B2ChainShapeJSAdapter._(B2ChainShapeJSImpl impl) : _impl = impl;

	final B2ChainShapeJSImpl _impl;

	B2ChainShapeJSAdapter() : _impl = B2ChainShapeJSImpl();

	void clear() => _impl.clear();
	void createLoop(B2Vec2JSAdapter vertices, int count) => _impl.createLoop(vertices._impl, count);
	void createChain(B2Vec2JSAdapter vertices, int count, B2Vec2JSAdapter prevVertex, B2Vec2JSAdapter nextVertex) => _impl.createChain(vertices._impl, count, prevVertex._impl, nextVertex._impl);
	void getChildEdge(B2EdgeShapeJSAdapter edge, int index) => _impl.getChildEdge(edge._impl, index);
	B2ShapeType getType() => _impl.getType();
	int getChildCount() => _impl.getChildCount().toInt();
	bool testPoint(B2TransformJSAdapter xf, B2Vec2JSAdapter p) => _impl.testPoint(xf._impl, p._impl);
	bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input, B2TransformJSAdapter transform, int childIndex) => _impl.rayCast(output._impl, input._impl, transform._impl, childIndex);
	void computeAABB(B2AABBJSAdapter aabb, B2TransformJSAdapter xf, int childIndex) => _impl.computeAABB(aabb._impl, xf._impl, childIndex);
	void computeMass(B2MassDataJSAdapter massData, double density) => _impl.computeMass(massData._impl, density);
	B2Vec2JSAdapter get_m_vertices() => B2Vec2JSAdapter._(_impl.get_m_vertices());
	void set_m_vertices(B2Vec2JSAdapter arg0) => _impl.set_m_vertices(arg0._impl);
	int get_m_count() => _impl.get_m_count().toInt();
	void set_m_count(int arg0) => _impl.set_m_count(arg0);
	B2Vec2JSAdapter get_m_prevVertex() => B2Vec2JSAdapter._(_impl.get_m_prevVertex());
	void set_m_prevVertex(B2Vec2JSAdapter arg0) => _impl.set_m_prevVertex(arg0._impl);
	B2Vec2JSAdapter get_m_nextVertex() => B2Vec2JSAdapter._(_impl.get_m_nextVertex());
	void set_m_nextVertex(B2Vec2JSAdapter arg0) => _impl.set_m_nextVertex(arg0._impl);
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

	B2ColorJSAdapter.from3(double r, double g, double b) : _impl = B2ColorJSImpl.from3(r, g, b);

	void set(double ri, double gi, double bi) => _impl.set(ri, gi, bi);
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
	B2ContactEdgeJSAdapter get_prev() => B2ContactEdgeJSAdapter._(_impl.get_prev());
	void set_prev(B2ContactEdgeJSAdapter arg0) => _impl.set_prev(arg0._impl);
	B2ContactEdgeJSAdapter get_next() => B2ContactEdgeJSAdapter._(_impl.get_next());
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

	bool shouldCollide(B2FixtureJSAdapter fixtureA, B2FixtureJSAdapter fixtureB) => _impl.shouldCollide(fixtureA._impl, fixtureB._impl);
	void dispose() => _impl.__destroy__();
}

class B2ContactIDJSAdapter implements B2ContactIDPlatform {

	B2ContactIDJSAdapter._(B2ContactIDJSImpl impl) : _impl = impl;

	final B2ContactIDJSImpl _impl;

	B2ContactFeatureJSAdapter get_cf() => B2ContactFeatureJSAdapter._(_impl.get_cf());
	void set_cf(B2ContactFeatureJSAdapter arg0) => _impl.set_cf(arg0._impl);
	int get_key() => _impl.get_key();
	void set_key(int arg0) => _impl.set_key(arg0);
	void dispose() => _impl.__destroy__();
}

class B2ContactImpulseJSAdapter implements B2ContactImpulsePlatform {

	B2ContactImpulseJSAdapter._(B2ContactImpulseJSImpl impl) : _impl = impl;

	final B2ContactImpulseJSImpl _impl;

	double get_normalImpulses(int arg0) => _impl.get_normalImpulses(arg0).toDouble();
	void set_normalImpulses(int arg0, double arg1) => _impl.set_normalImpulses(arg0, arg1);
	double get_tangentImpulses(int arg0) => _impl.get_tangentImpulses(arg0).toDouble();
	void set_tangentImpulses(int arg0, double arg1) => _impl.set_tangentImpulses(arg0, arg1);
	int get_count() => _impl.get_count().toInt();
	void set_count(int arg0) => _impl.set_count(arg0);
	void dispose() => _impl.__destroy__();
}

class B2DestructionListenerJSAdapter implements B2DestructionListenerPlatform {

	B2DestructionListenerJSAdapter._(B2DestructionListenerJSImpl impl) : _impl = impl;

	final B2DestructionListenerJSImpl _impl;

	void dispose() => _impl.__destroy__();
}

class B2DestructionListenerWrapperJSAdapter implements B2DestructionListenerWrapperPlatform {

	B2DestructionListenerWrapperJSAdapter._(B2DestructionListenerWrapperJSImpl impl) : _impl = impl;

	final B2DestructionListenerWrapperJSImpl _impl;

	void dispose() => _impl.__destroy__();
}

class JSDestructionListenerJSAdapter implements JSDestructionListenerPlatform {

	JSDestructionListenerJSAdapter._(JSDestructionListenerJSImpl impl) : _impl = impl;

	final JSDestructionListenerJSImpl _impl;

	JSDestructionListenerJSAdapter() : _impl = JSDestructionListenerJSImpl();

	void sayGoodbyeJoint(B2JointJSAdapter joint) => _impl.sayGoodbyeJoint(joint._impl);
	void sayGoodbyeFixture(B2FixtureJSAdapter joint) => _impl.sayGoodbyeFixture(joint._impl);
	void dispose() => _impl.__destroy__();
}

class B2DistanceJointJSAdapter implements B2DistanceJointPlatform {

	B2DistanceJointJSAdapter._(B2DistanceJointJSImpl impl) : _impl = impl;

	final B2DistanceJointJSImpl _impl;

	B2Vec2JSAdapter getLocalAnchorA() => B2Vec2JSAdapter._(_impl.getLocalAnchorA());
	B2Vec2JSAdapter getLocalAnchorB() => B2Vec2JSAdapter._(_impl.getLocalAnchorB());
	double getLength() => _impl.getLength().toDouble();
	void setLength(double length) => _impl.setLength(length);
	double getMinLength() => _impl.getMinLength().toDouble();
	void setMinLength(double minLength) => _impl.setMinLength(minLength);
	double getMaxLength() => _impl.getMaxLength().toDouble();
	void setMaxLength(double maxLength) => _impl.setMaxLength(maxLength);
	double getCurrentLength() => _impl.getCurrentLength().toDouble();
	void setStiffness(double stiffness) => _impl.setStiffness(stiffness);
	double getStiffness() => _impl.getStiffness().toDouble();
	void setDamping(double damping) => _impl.setDamping(damping);
	double getDamping() => _impl.getDamping().toDouble();
	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dispose() => _impl.__destroy__();
}

class B2DistanceJointDefJSAdapter implements B2DistanceJointDefPlatform {

	B2DistanceJointDefJSAdapter._(B2DistanceJointDefJSImpl impl) : _impl = impl;

	final B2DistanceJointDefJSImpl _impl;

	B2DistanceJointDefJSAdapter() : _impl = B2DistanceJointDefJSImpl();

	void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB, B2Vec2JSAdapter anchorA, B2Vec2JSAdapter anchorB) => _impl.initialize(bodyA._impl, bodyB._impl, anchorA._impl, anchorB._impl);
	B2Vec2JSAdapter get_localAnchorA() => B2Vec2JSAdapter._(_impl.get_localAnchorA());
	void set_localAnchorA(B2Vec2JSAdapter arg0) => _impl.set_localAnchorA(arg0._impl);
	B2Vec2JSAdapter get_localAnchorB() => B2Vec2JSAdapter._(_impl.get_localAnchorB());
	void set_localAnchorB(B2Vec2JSAdapter arg0) => _impl.set_localAnchorB(arg0._impl);
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
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
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

	void setFlags(int flags) => _impl.setFlags(flags);
	int getFlags() => _impl.getFlags();
	void appendFlags(int flags) => _impl.appendFlags(flags);
	void clearFlags(int flags) => _impl.clearFlags(flags);
	void dispose() => _impl.__destroy__();
}

class JSDrawJSAdapter implements JSDrawPlatform {

	JSDrawJSAdapter._(JSDrawJSImpl impl) : _impl = impl;

	final JSDrawJSImpl _impl;

	JSDrawJSAdapter() : _impl = JSDrawJSImpl();

	void drawPolygon(B2Vec2JSAdapter vertices, int vertexCount, B2ColorJSAdapter color) => _impl.drawPolygon(vertices._impl, vertexCount, color._impl);
	void drawSolidPolygon(B2Vec2JSAdapter vertices, int vertexCount, B2ColorJSAdapter color) => _impl.drawSolidPolygon(vertices._impl, vertexCount, color._impl);
	void drawCircle(B2Vec2JSAdapter center, double radius, B2ColorJSAdapter color) => _impl.drawCircle(center._impl, radius, color._impl);
	void drawSolidCircle(B2Vec2JSAdapter center, double radius, B2Vec2JSAdapter axis, B2ColorJSAdapter color) => _impl.drawSolidCircle(center._impl, radius, axis._impl, color._impl);
	void drawSegment(B2Vec2JSAdapter p1, B2Vec2JSAdapter p2, B2ColorJSAdapter color) => _impl.drawSegment(p1._impl, p2._impl, color._impl);
	void drawTransform(B2TransformJSAdapter xf) => _impl.drawTransform(xf._impl);
	void drawPoint(B2Vec2JSAdapter p, double size, B2ColorJSAdapter color) => _impl.drawPoint(p._impl, size, color._impl);
	void dispose() => _impl.__destroy__();
}

class B2FrictionJointJSAdapter implements B2FrictionJointPlatform {

	B2FrictionJointJSAdapter._(B2FrictionJointJSImpl impl) : _impl = impl;

	final B2FrictionJointJSImpl _impl;

	B2Vec2JSAdapter getLocalAnchorA() => B2Vec2JSAdapter._(_impl.getLocalAnchorA());
	B2Vec2JSAdapter getLocalAnchorB() => B2Vec2JSAdapter._(_impl.getLocalAnchorB());
	void setMaxForce(double force) => _impl.setMaxForce(force);
	double getMaxForce() => _impl.getMaxForce().toDouble();
	void setMaxTorque(double torque) => _impl.setMaxTorque(torque);
	double getMaxTorque() => _impl.getMaxTorque().toDouble();
	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dispose() => _impl.__destroy__();
}

class B2FrictionJointDefJSAdapter implements B2FrictionJointDefPlatform {

	B2FrictionJointDefJSAdapter._(B2FrictionJointDefJSImpl impl) : _impl = impl;

	final B2FrictionJointDefJSImpl _impl;

	B2FrictionJointDefJSAdapter() : _impl = B2FrictionJointDefJSImpl();

	void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB, B2Vec2JSAdapter anchor) => _impl.initialize(bodyA._impl, bodyB._impl, anchor._impl);
	B2Vec2JSAdapter get_localAnchorA() => B2Vec2JSAdapter._(_impl.get_localAnchorA());
	void set_localAnchorA(B2Vec2JSAdapter arg0) => _impl.set_localAnchorA(arg0._impl);
	B2Vec2JSAdapter get_localAnchorB() => B2Vec2JSAdapter._(_impl.get_localAnchorB());
	void set_localAnchorB(B2Vec2JSAdapter arg0) => _impl.set_localAnchorB(arg0._impl);
	double get_maxForce() => _impl.get_maxForce().toDouble();
	void set_maxForce(double arg0) => _impl.set_maxForce(arg0);
	double get_maxTorque() => _impl.get_maxTorque().toDouble();
	void set_maxTorque(double arg0) => _impl.set_maxTorque(arg0);
	B2JointType get_type() => _impl.get_type();
	void set_type(B2JointType arg0) => _impl.set_type(arg0);
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
	B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
	void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
	B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
	void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
	bool get_collideConnected() => _impl.get_collideConnected();
	void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
	void dispose() => _impl.__destroy__();
}

class B2GearJointJSAdapter implements B2GearJointPlatform {

	B2GearJointJSAdapter._(B2GearJointJSImpl impl) : _impl = impl;

	final B2GearJointJSImpl _impl;

	B2JointJSAdapter getJoint1() => B2JointJSAdapter._(_impl.getJoint1());
	B2JointJSAdapter getJoint2() => B2JointJSAdapter._(_impl.getJoint2());
	void setRatio(double ratio) => _impl.setRatio(ratio);
	double getRatio() => _impl.getRatio().toDouble();
	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dispose() => _impl.__destroy__();
}

class B2GearJointDefJSAdapter implements B2GearJointDefPlatform {

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
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
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

	B2ManifoldPointJSAdapter get_points(int arg0) => B2ManifoldPointJSAdapter._(_impl.get_points(arg0));
	void set_points(int arg0, B2ManifoldPointJSAdapter arg1) => _impl.set_points(arg0, arg1._impl);
	B2Vec2JSAdapter get_localNormal() => B2Vec2JSAdapter._(_impl.get_localNormal());
	void set_localNormal(B2Vec2JSAdapter arg0) => _impl.set_localNormal(arg0._impl);
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

	void initialize(B2ManifoldJSAdapter manifold, B2TransformJSAdapter xfA, double radiusA, B2TransformJSAdapter xfB, double radiusB) => _impl.initialize(manifold._impl, xfA._impl, radiusA, xfB._impl, radiusB);
	B2Vec2JSAdapter get_normal() => B2Vec2JSAdapter._(_impl.get_normal());
	void set_normal(B2Vec2JSAdapter arg0) => _impl.set_normal(arg0._impl);
	B2Vec2JSAdapter get_points(int arg0) => B2Vec2JSAdapter._(_impl.get_points(arg0));
	void set_points(int arg0, B2Vec2JSAdapter arg1) => _impl.set_points(arg0, arg1._impl);
	double get_separations(int arg0) => _impl.get_separations(arg0).toDouble();
	void set_separations(int arg0, double arg1) => _impl.set_separations(arg0, arg1);
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

	B2Mat22JSAdapter.from2(B2Vec2JSAdapter a11, B2Vec2JSAdapter a12) : _impl = B2Mat22JSImpl.from2(a11._impl, a12._impl);

	B2Mat22JSAdapter.from4(double a11, double a12, double a21, double a22) : _impl = B2Mat22JSImpl.from4(a11, a12, a21, a22);

	void set(B2Vec2JSAdapter c1, B2Vec2JSAdapter c2) => _impl.set(c1._impl, c2._impl);
	void setIdentity() => _impl.setIdentity();
	void setZero() => _impl.setZero();
	B2Mat22JSAdapter getInverse() => B2Mat22JSAdapter._(_impl.getInverse());
	B2Vec2JSAdapter solve(B2Vec2JSAdapter b) => B2Vec2JSAdapter._(_impl.solve(b._impl));
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

	B2Mat33JSAdapter.from3(B2Vec3JSAdapter c1, B2Vec3JSAdapter c2, B2Vec3JSAdapter c3) : _impl = B2Mat33JSImpl.from3(c1._impl, c2._impl, c3._impl);

	void setZero() => _impl.setZero();
	B2Vec3JSAdapter solve33(B2Vec3JSAdapter b) => B2Vec3JSAdapter._(_impl.solve33(b._impl));
	B2Vec2JSAdapter solve22(B2Vec2JSAdapter b) => B2Vec2JSAdapter._(_impl.solve22(b._impl));
	void getInverse22(B2Mat33JSAdapter M) => _impl.getInverse22(M._impl);
	void getSymInverse33(B2Mat33JSAdapter M) => _impl.getSymInverse33(M._impl);
	B2Vec3JSAdapter get_ex() => B2Vec3JSAdapter._(_impl.get_ex());
	void set_ex(B2Vec3JSAdapter arg0) => _impl.set_ex(arg0._impl);
	B2Vec3JSAdapter get_ey() => B2Vec3JSAdapter._(_impl.get_ey());
	void set_ey(B2Vec3JSAdapter arg0) => _impl.set_ey(arg0._impl);
	B2Vec3JSAdapter get_ez() => B2Vec3JSAdapter._(_impl.get_ez());
	void set_ez(B2Vec3JSAdapter arg0) => _impl.set_ez(arg0._impl);
	void dispose() => _impl.__destroy__();
}

class B2MouseJointJSAdapter implements B2MouseJointPlatform {

	B2MouseJointJSAdapter._(B2MouseJointJSImpl impl) : _impl = impl;

	final B2MouseJointJSImpl _impl;

	void setTarget(B2Vec2JSAdapter target) => _impl.setTarget(target._impl);
	B2Vec2JSAdapter getTarget() => B2Vec2JSAdapter._(_impl.getTarget());
	void setMaxForce(double force) => _impl.setMaxForce(force);
	double getMaxForce() => _impl.getMaxForce().toDouble();
	void setStiffness(double stiffness) => _impl.setStiffness(stiffness);
	double getStiffness() => _impl.getStiffness().toDouble();
	void setDamping(double damping) => _impl.setDamping(damping);
	double getDamping() => _impl.getDamping().toDouble();
	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dispose() => _impl.__destroy__();
}

class B2MouseJointDefJSAdapter implements B2MouseJointDefPlatform {

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
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
	B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
	void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
	B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
	void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
	bool get_collideConnected() => _impl.get_collideConnected();
	void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
	void dispose() => _impl.__destroy__();
}

class B2PolygonShapeJSAdapter implements B2PolygonShapePlatform {

	B2PolygonShapeJSAdapter._(B2PolygonShapeJSImpl impl) : _impl = impl;

	final B2PolygonShapeJSImpl _impl;

	B2PolygonShapeJSAdapter() : _impl = B2PolygonShapeJSImpl();

	void set(B2Vec2JSAdapter vertices, int vertexCount) => _impl.set(vertices._impl, vertexCount);
	void setAsBox2(double hx, double hy) => _impl.setAsBox2(hx, hy);
	void setAsBox4(double hx, double hy, B2Vec2JSAdapter center, double angle) => _impl.setAsBox4(hx, hy, center._impl, angle);
	B2ShapeType getType() => _impl.getType();
	int getChildCount() => _impl.getChildCount().toInt();
	bool testPoint(B2TransformJSAdapter xf, B2Vec2JSAdapter p) => _impl.testPoint(xf._impl, p._impl);
	bool rayCast(B2RayCastOutputJSAdapter output, B2RayCastInputJSAdapter input, B2TransformJSAdapter transform, int childIndex) => _impl.rayCast(output._impl, input._impl, transform._impl, childIndex);
	void computeAABB(B2AABBJSAdapter aabb, B2TransformJSAdapter xf, int childIndex) => _impl.computeAABB(aabb._impl, xf._impl, childIndex);
	void computeMass(B2MassDataJSAdapter massData, double density) => _impl.computeMass(massData._impl, density);
	B2Vec2JSAdapter get_m_centroid() => B2Vec2JSAdapter._(_impl.get_m_centroid());
	void set_m_centroid(B2Vec2JSAdapter arg0) => _impl.set_m_centroid(arg0._impl);
	B2Vec2JSAdapter get_m_vertices(int arg0) => B2Vec2JSAdapter._(_impl.get_m_vertices(arg0));
	void set_m_vertices(int arg0, B2Vec2JSAdapter arg1) => _impl.set_m_vertices(arg0, arg1._impl);
	B2Vec2JSAdapter get_m_normals(int arg0) => B2Vec2JSAdapter._(_impl.get_m_normals(arg0));
	void set_m_normals(int arg0, B2Vec2JSAdapter arg1) => _impl.set_m_normals(arg0, arg1._impl);
	int get_m_count() => _impl.get_m_count().toInt();
	void set_m_count(int arg0) => _impl.set_m_count(arg0);
	B2ShapeType get_m_type() => _impl.get_m_type();
	void set_m_type(B2ShapeType arg0) => _impl.set_m_type(arg0);
	double get_m_radius() => _impl.get_m_radius().toDouble();
	void set_m_radius(double arg0) => _impl.set_m_radius(arg0);
	void dispose() => _impl.__destroy__();
}

class B2PrismaticJointJSAdapter implements B2PrismaticJointPlatform {

	B2PrismaticJointJSAdapter._(B2PrismaticJointJSImpl impl) : _impl = impl;

	final B2PrismaticJointJSImpl _impl;

	B2Vec2JSAdapter getLocalAnchorA() => B2Vec2JSAdapter._(_impl.getLocalAnchorA());
	B2Vec2JSAdapter getLocalAnchorB() => B2Vec2JSAdapter._(_impl.getLocalAnchorB());
	B2Vec2JSAdapter getLocalAxisA() => B2Vec2JSAdapter._(_impl.getLocalAxisA());
	double getReferenceAngle() => _impl.getReferenceAngle().toDouble();
	double getJointTranslation() => _impl.getJointTranslation().toDouble();
	double getJointSpeed() => _impl.getJointSpeed().toDouble();
	bool isLimitEnabled() => _impl.isLimitEnabled();
	void enableLimit(bool flag) => _impl.enableLimit(flag);
	double getLowerLimit() => _impl.getLowerLimit().toDouble();
	double getUpperLimit() => _impl.getUpperLimit().toDouble();
	void setLimits(double lower, double upper) => _impl.setLimits(lower, upper);
	bool isMotorEnabled() => _impl.isMotorEnabled();
	void enableMotor(bool flag) => _impl.enableMotor(flag);
	void setMotorSpeed(double speed) => _impl.setMotorSpeed(speed);
	double getMotorSpeed() => _impl.getMotorSpeed().toDouble();
	void setMaxMotorForce(double force) => _impl.setMaxMotorForce(force);
	double getMaxMotorForce() => _impl.getMaxMotorForce().toDouble();
	double getMotorForce(double inv_dt) => _impl.getMotorForce(inv_dt).toDouble();
	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dispose() => _impl.__destroy__();
}

class B2PrismaticJointDefJSAdapter implements B2PrismaticJointDefPlatform {

	B2PrismaticJointDefJSAdapter._(B2PrismaticJointDefJSImpl impl) : _impl = impl;

	final B2PrismaticJointDefJSImpl _impl;

	B2PrismaticJointDefJSAdapter() : _impl = B2PrismaticJointDefJSImpl();

	void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB, B2Vec2JSAdapter anchor, B2Vec2JSAdapter axis) => _impl.initialize(bodyA._impl, bodyB._impl, anchor._impl, axis._impl);
	B2Vec2JSAdapter get_localAnchorA() => B2Vec2JSAdapter._(_impl.get_localAnchorA());
	void set_localAnchorA(B2Vec2JSAdapter arg0) => _impl.set_localAnchorA(arg0._impl);
	B2Vec2JSAdapter get_localAnchorB() => B2Vec2JSAdapter._(_impl.get_localAnchorB());
	void set_localAnchorB(B2Vec2JSAdapter arg0) => _impl.set_localAnchorB(arg0._impl);
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
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
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

class B2PulleyJointJSAdapter implements B2PulleyJointPlatform {

	B2PulleyJointJSAdapter._(B2PulleyJointJSImpl impl) : _impl = impl;

	final B2PulleyJointJSImpl _impl;

	B2Vec2JSAdapter getGroundAnchorA() => B2Vec2JSAdapter._(_impl.getGroundAnchorA());
	B2Vec2JSAdapter getGroundAnchorB() => B2Vec2JSAdapter._(_impl.getGroundAnchorB());
	double getLengthA() => _impl.getLengthA().toDouble();
	double getLengthB() => _impl.getLengthB().toDouble();
	double getRatio() => _impl.getRatio().toDouble();
	double getCurrentLengthA() => _impl.getCurrentLengthA().toDouble();
	double getCurrentLengthB() => _impl.getCurrentLengthB().toDouble();
	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dispose() => _impl.__destroy__();
}

class B2PulleyJointDefJSAdapter implements B2PulleyJointDefPlatform {

	B2PulleyJointDefJSAdapter._(B2PulleyJointDefJSImpl impl) : _impl = impl;

	final B2PulleyJointDefJSImpl _impl;

	B2PulleyJointDefJSAdapter() : _impl = B2PulleyJointDefJSImpl();

	void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB, B2Vec2JSAdapter groundAnchorA, B2Vec2JSAdapter groundAnchorB, B2Vec2JSAdapter anchorA, B2Vec2JSAdapter anchorB, double ratio) => _impl.initialize(bodyA._impl, bodyB._impl, groundAnchorA._impl, groundAnchorB._impl, anchorA._impl, anchorB._impl, ratio);
	B2Vec2JSAdapter get_groundAnchorA() => B2Vec2JSAdapter._(_impl.get_groundAnchorA());
	void set_groundAnchorA(B2Vec2JSAdapter arg0) => _impl.set_groundAnchorA(arg0._impl);
	B2Vec2JSAdapter get_groundAnchorB() => B2Vec2JSAdapter._(_impl.get_groundAnchorB());
	void set_groundAnchorB(B2Vec2JSAdapter arg0) => _impl.set_groundAnchorB(arg0._impl);
	B2Vec2JSAdapter get_localAnchorA() => B2Vec2JSAdapter._(_impl.get_localAnchorA());
	void set_localAnchorA(B2Vec2JSAdapter arg0) => _impl.set_localAnchorA(arg0._impl);
	B2Vec2JSAdapter get_localAnchorB() => B2Vec2JSAdapter._(_impl.get_localAnchorB());
	void set_localAnchorB(B2Vec2JSAdapter arg0) => _impl.set_localAnchorB(arg0._impl);
	double get_lengthA() => _impl.get_lengthA().toDouble();
	void set_lengthA(double arg0) => _impl.set_lengthA(arg0);
	double get_lengthB() => _impl.get_lengthB().toDouble();
	void set_lengthB(double arg0) => _impl.set_lengthB(arg0);
	double get_ratio() => _impl.get_ratio().toDouble();
	void set_ratio(double arg0) => _impl.set_ratio(arg0);
	B2JointType get_type() => _impl.get_type();
	void set_type(B2JointType arg0) => _impl.set_type(arg0);
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
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

class B2RevoluteJointJSAdapter implements B2RevoluteJointPlatform {

	B2RevoluteJointJSAdapter._(B2RevoluteJointJSImpl impl) : _impl = impl;

	final B2RevoluteJointJSImpl _impl;

	B2Vec2JSAdapter getLocalAnchorA() => B2Vec2JSAdapter._(_impl.getLocalAnchorA());
	B2Vec2JSAdapter getLocalAnchorB() => B2Vec2JSAdapter._(_impl.getLocalAnchorB());
	double getReferenceAngle() => _impl.getReferenceAngle().toDouble();
	double getJointAngle() => _impl.getJointAngle().toDouble();
	double getJointSpeed() => _impl.getJointSpeed().toDouble();
	bool isLimitEnabled() => _impl.isLimitEnabled();
	void enableLimit(bool flag) => _impl.enableLimit(flag);
	double getLowerLimit() => _impl.getLowerLimit().toDouble();
	double getUpperLimit() => _impl.getUpperLimit().toDouble();
	void setLimits(double lower, double upper) => _impl.setLimits(lower, upper);
	bool isMotorEnabled() => _impl.isMotorEnabled();
	void enableMotor(bool flag) => _impl.enableMotor(flag);
	void setMotorSpeed(double speed) => _impl.setMotorSpeed(speed);
	double getMotorSpeed() => _impl.getMotorSpeed().toDouble();
	void setMaxMotorTorque(double torque) => _impl.setMaxMotorTorque(torque);
	double getMaxMotorTorque() => _impl.getMaxMotorTorque().toDouble();
	double getMotorTorque(double inv_dt) => _impl.getMotorTorque(inv_dt).toDouble();
	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dispose() => _impl.__destroy__();
}

class B2RevoluteJointDefJSAdapter implements B2RevoluteJointDefPlatform {

	B2RevoluteJointDefJSAdapter._(B2RevoluteJointDefJSImpl impl) : _impl = impl;

	final B2RevoluteJointDefJSImpl _impl;

	B2RevoluteJointDefJSAdapter() : _impl = B2RevoluteJointDefJSImpl();

	void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB, B2Vec2JSAdapter anchor) => _impl.initialize(bodyA._impl, bodyB._impl, anchor._impl);
	B2Vec2JSAdapter get_localAnchorA() => B2Vec2JSAdapter._(_impl.get_localAnchorA());
	void set_localAnchorA(B2Vec2JSAdapter arg0) => _impl.set_localAnchorA(arg0._impl);
	B2Vec2JSAdapter get_localAnchorB() => B2Vec2JSAdapter._(_impl.get_localAnchorB());
	void set_localAnchorB(B2Vec2JSAdapter arg0) => _impl.set_localAnchorB(arg0._impl);
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
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
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

	void set(double angle) => _impl.set(angle);
	void setIdentity() => _impl.setIdentity();
	double getAngle() => _impl.getAngle().toDouble();
	B2Vec2JSAdapter getXAxis() => B2Vec2JSAdapter._(_impl.getXAxis());
	B2Vec2JSAdapter getYAxis() => B2Vec2JSAdapter._(_impl.getYAxis());
	double get_s() => _impl.get_s().toDouble();
	void set_s(double arg0) => _impl.set_s(arg0);
	double get_c() => _impl.get_c().toDouble();
	void set_c(double arg0) => _impl.set_c(arg0);
	void dispose() => _impl.__destroy__();
}

class B2WheelJointJSAdapter implements B2WheelJointPlatform {

	B2WheelJointJSAdapter._(B2WheelJointJSImpl impl) : _impl = impl;

	final B2WheelJointJSImpl _impl;

	B2Vec2JSAdapter getLocalAnchorA() => B2Vec2JSAdapter._(_impl.getLocalAnchorA());
	B2Vec2JSAdapter getLocalAnchorB() => B2Vec2JSAdapter._(_impl.getLocalAnchorB());
	B2Vec2JSAdapter getLocalAxisA() => B2Vec2JSAdapter._(_impl.getLocalAxisA());
	double getJointTranslation() => _impl.getJointTranslation().toDouble();
	double getJointLinearSpeed() => _impl.getJointLinearSpeed().toDouble();
	double getJointAngle() => _impl.getJointAngle().toDouble();
	double getJointAngularSpeed() => _impl.getJointAngularSpeed().toDouble();
	bool isLimitEnabled() => _impl.isLimitEnabled();
	void enableLimit(bool flag) => _impl.enableLimit(flag);
	double getLowerLimit() => _impl.getLowerLimit().toDouble();
	double getUpperLimit() => _impl.getUpperLimit().toDouble();
	void setLimits(double lower, double upper) => _impl.setLimits(lower, upper);
	bool isMotorEnabled() => _impl.isMotorEnabled();
	void enableMotor(bool flag) => _impl.enableMotor(flag);
	void setMotorSpeed(double speed) => _impl.setMotorSpeed(speed);
	double getMotorSpeed() => _impl.getMotorSpeed().toDouble();
	void setMaxMotorTorque(double torque) => _impl.setMaxMotorTorque(torque);
	double getMaxMotorTorque() => _impl.getMaxMotorTorque().toDouble();
	double getMotorTorque(double inv_dt) => _impl.getMotorTorque(inv_dt).toDouble();
	void setStiffness(double stiffness) => _impl.setStiffness(stiffness);
	double getStiffness() => _impl.getStiffness().toDouble();
	void setDamping(double damping) => _impl.setDamping(damping);
	double getDamping() => _impl.getDamping().toDouble();
	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dispose() => _impl.__destroy__();
}

class B2WheelJointDefJSAdapter implements B2WheelJointDefPlatform {

	B2WheelJointDefJSAdapter._(B2WheelJointDefJSImpl impl) : _impl = impl;

	final B2WheelJointDefJSImpl _impl;

	B2WheelJointDefJSAdapter() : _impl = B2WheelJointDefJSImpl();

	void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB, B2Vec2JSAdapter anchor, B2Vec2JSAdapter axis) => _impl.initialize(bodyA._impl, bodyB._impl, anchor._impl, axis._impl);
	B2Vec2JSAdapter get_localAnchorA() => B2Vec2JSAdapter._(_impl.get_localAnchorA());
	void set_localAnchorA(B2Vec2JSAdapter arg0) => _impl.set_localAnchorA(arg0._impl);
	B2Vec2JSAdapter get_localAnchorB() => B2Vec2JSAdapter._(_impl.get_localAnchorB());
	void set_localAnchorB(B2Vec2JSAdapter arg0) => _impl.set_localAnchorB(arg0._impl);
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
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
	B2BodyJSAdapter get_bodyA() => B2BodyJSAdapter._(_impl.get_bodyA());
	void set_bodyA(B2BodyJSAdapter arg0) => _impl.set_bodyA(arg0._impl);
	B2BodyJSAdapter get_bodyB() => B2BodyJSAdapter._(_impl.get_bodyB());
	void set_bodyB(B2BodyJSAdapter arg0) => _impl.set_bodyB(arg0._impl);
	bool get_collideConnected() => _impl.get_collideConnected();
	void set_collideConnected(bool arg0) => _impl.set_collideConnected(arg0);
	void dispose() => _impl.__destroy__();
}

class B2MotorJointJSAdapter implements B2MotorJointPlatform {

	B2MotorJointJSAdapter._(B2MotorJointJSImpl impl) : _impl = impl;

	final B2MotorJointJSImpl _impl;

	void setLinearOffset(B2Vec2JSAdapter linearOffset) => _impl.setLinearOffset(linearOffset._impl);
	B2Vec2JSAdapter getLinearOffset() => B2Vec2JSAdapter._(_impl.getLinearOffset());
	void setAngularOffset(double angularOffset) => _impl.setAngularOffset(angularOffset);
	double getAngularOffset() => _impl.getAngularOffset().toDouble();
	void setMaxForce(double force) => _impl.setMaxForce(force);
	double getMaxForce() => _impl.getMaxForce().toDouble();
	void setMaxTorque(double torque) => _impl.setMaxTorque(torque);
	double getMaxTorque() => _impl.getMaxTorque().toDouble();
	void setCorrectionFactor(double factor) => _impl.setCorrectionFactor(factor);
	double getCorrectionFactor() => _impl.getCorrectionFactor().toDouble();
	B2JointType getType() => _impl.getType();
	B2BodyJSAdapter getBodyA() => B2BodyJSAdapter._(_impl.getBodyA());
	B2BodyJSAdapter getBodyB() => B2BodyJSAdapter._(_impl.getBodyB());
	B2Vec2JSAdapter getAnchorA() => B2Vec2JSAdapter._(_impl.getAnchorA());
	B2Vec2JSAdapter getAnchorB() => B2Vec2JSAdapter._(_impl.getAnchorB());
	B2Vec2JSAdapter getReactionForce(double inv_dt) => B2Vec2JSAdapter._(_impl.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _impl.getReactionTorque(inv_dt).toDouble();
	B2JointJSAdapter getNext() => B2JointJSAdapter._(_impl.getNext());
	B2JointUserDataJSAdapter getUserData() => B2JointUserDataJSAdapter._(_impl.getUserData());
	bool getCollideConnected() => _impl.getCollideConnected();
	void dispose() => _impl.__destroy__();
}

class B2MotorJointDefJSAdapter implements B2MotorJointDefPlatform {

	B2MotorJointDefJSAdapter._(B2MotorJointDefJSImpl impl) : _impl = impl;

	final B2MotorJointDefJSImpl _impl;

	B2MotorJointDefJSAdapter() : _impl = B2MotorJointDefJSImpl();

	void initialize(B2BodyJSAdapter bodyA, B2BodyJSAdapter bodyB) => _impl.initialize(bodyA._impl, bodyB._impl);
	B2Vec2JSAdapter get_linearOffset() => B2Vec2JSAdapter._(_impl.get_linearOffset());
	void set_linearOffset(B2Vec2JSAdapter arg0) => _impl.set_linearOffset(arg0._impl);
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
	B2JointUserDataJSAdapter get_userData() => B2JointUserDataJSAdapter._(_impl.get_userData());
	void set_userData(B2JointUserDataJSAdapter arg0) => _impl.set_userData(arg0._impl);
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
	void set_stretchingModel(B2StretchingModel arg0) => _impl.set_stretchingModel(arg0);
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
	B2RopeTuningJSAdapter get_tuning() => B2RopeTuningJSAdapter._(_impl.get_tuning());
	void set_tuning(B2RopeTuningJSAdapter arg0) => _impl.set_tuning(arg0._impl);
	void dispose() => _impl.__destroy__();
}

class B2RopeJSAdapter implements B2RopePlatform {

	B2RopeJSAdapter._(B2RopeJSImpl impl) : _impl = impl;

	final B2RopeJSImpl _impl;

	B2RopeJSAdapter() : _impl = B2RopeJSImpl();

	void create(B2RopeDefJSAdapter def) => _impl.create(def._impl);
	void setTuning(B2RopeTuningJSAdapter tuning) => _impl.setTuning(tuning._impl);
	void step(double timeStep, int iterations, B2Vec2JSAdapter position) => _impl.step(timeStep, iterations, position._impl);
	void reset(B2Vec2JSAdapter position) => _impl.reset(position._impl);
	//void draw(B2DrawJSAdapter draw) => _impl.draw(draw._impl);
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
class B2ShapeJSImpl {

	external B2ShapeType getType();
	external num getChildCount();
	external bool testPoint(B2TransformJSImpl xf, B2Vec2JSImpl p);
	external bool rayCast(B2RayCastOutputJSImpl output, B2RayCastInputJSImpl input, B2TransformJSImpl transform, num childIndex);
	external void computeAABB(B2AABBJSImpl aabb, B2TransformJSImpl xf, num childIndex);
	external void computeMass(B2MassDataJSImpl massData, num density);
	external B2ShapeType get_m_type();
	external void set_m_type(B2ShapeType arg0);
	external double get_m_radius();
	external void set_m_radius(num arg0);
	external void __destroy__();
}

@JS('b2JointDef')
class B2JointDefJSImpl {
	external B2JointDefJSImpl();

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

@JS('b2Joint')
class B2JointJSImpl {

	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void dump();
}

@JS('VoidPtr')
class VoidPtrJSImpl {

	external void __destroy__();
}

@JS('b2Contact')
class B2ContactJSImpl {

	external B2ManifoldJSImpl getManifold();
	external void getWorldManifold(B2WorldManifoldJSImpl manifold);
	external bool isTouching();
	external void setEnabled(bool flag);
	external bool isEnabled();
	external B2ContactJSImpl getNext();
	external B2FixtureJSImpl getFixtureA();
	external num getChildIndexA();
	external B2FixtureJSImpl getFixtureB();
	external num getChildIndexB();
	external void setFriction(num friction);
	external double getFriction();
	external void resetFriction();
	external void setRestitution(num restitution);
	external double getRestitution();
	external void resetRestitution();
	external void setRestitutionThreshold(num threshold);
	external double getRestitutionThreshold();
	external void resetRestitutionThreshold();
	external void setTangentSpeed(num speed);
	external double getTangentSpeed();
}

@JS('b2ContactListener')
class B2ContactListenerJSImpl {

	external void __destroy__();
}

@JS('JSContactListener')
class JSContactListenerJSImpl {
	external JSContactListenerJSImpl();

	external void beginContact(B2ContactJSImpl contact);
	external void endContact(B2ContactJSImpl contact);
	external void preSolve(B2ContactJSImpl contact, B2ManifoldJSImpl oldManifold);
	external void postSolve(B2ContactJSImpl contact, B2ContactImpulseJSImpl impulse);
	external void __destroy__();
}

@JS('b2World')
class B2WorldJSImpl {
	external B2WorldJSImpl.from1(B2Vec2JSImpl gravity);

	//external void setDestructionListener(B2DestructionListenerJSImpl listener);
	//external void setContactFilter(JSContactFilterJSImpl filter);
	//external void setContactListener(JSContactListenerJSImpl listener);
	//external void setDebugDraw(B2DrawJSImpl debugDraw);
	external B2BodyJSImpl createBody(B2BodyDefJSImpl def);
	external void destroyBody(B2BodyJSImpl body);
	external B2JointJSImpl createJoint(B2JointDefJSImpl def);
	external void destroyJoint(B2JointJSImpl joint);
	external void step(num timeStep, num velocityIterations, num positionIterations);
	external void clearForces();
	external void debugDraw();
	//external void queryAABB(B2QueryCallbackJSImpl callback, B2AABBJSImpl aabb);
	//external void rayCast(B2RayCastCallbackJSImpl callback, B2Vec2JSImpl point1, B2Vec2JSImpl point2);
	external B2BodyJSImpl getBodyList();
	external B2JointJSImpl getJointList();
	external B2ContactJSImpl getContactList();
	external void setAllowSleeping(bool flag);
	external bool getAllowSleeping();
	external void setWarmStarting(bool flag);
	external bool getWarmStarting();
	external void setContinuousPhysics(bool flag);
	external bool getContinuousPhysics();
	external void setSubStepping(bool flag);
	external bool getSubStepping();
	external num getProxyCount();
	external num getBodyCount();
	external num getJointCount();
	external num getContactCount();
	external num getTreeHeight();
	external num getTreeBalance();
	external double getTreeQuality();
	external void setGravity(B2Vec2JSImpl gravity);
	external B2Vec2JSImpl getGravity();
	external bool isLocked();
	external void setAutoClearForces(bool flag);
	external bool getAutoClearForces();
	external B2ProfileJSImpl getProfile();
	external void dump();
	external void __destroy__();
}

@JS('b2FixtureUserData')
class B2FixtureUserDataJSImpl {

	external int get_pointer();
	external void set_pointer(int arg0);
	external void __destroy__();
}

@JS('b2FixtureDef')
class B2FixtureDefJSImpl {
	external B2FixtureDefJSImpl();

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

@JS('b2Fixture')
class B2FixtureJSImpl {

	external B2ShapeType getType();
	external B2ShapeJSImpl getShape();
	external void setSensor(bool sensor);
	external bool isSensor();
	external void setFilterData(B2FilterJSImpl filter);
	external B2FilterJSImpl getFilterData();
	external void refilter();
	external B2BodyJSImpl getBody();
	external B2FixtureJSImpl getNext();
	external B2FixtureUserDataJSImpl getUserData();
	external bool testPoint(B2Vec2JSImpl p);
	external bool rayCast(B2RayCastOutputJSImpl output, B2RayCastInputJSImpl input, num childIndex);
	external void getMassData(B2MassDataJSImpl massData);
	external void setDensity(num density);
	external double getDensity();
	external double getFriction();
	external void setFriction(num friction);
	external double getRestitution();
	external void setRestitution(num restitution);
	external double getRestitutionThreshold();
	external void setRestitutionThreshold(num threshold);
	external B2AABBJSImpl getAABB(num childIndex);
	external void dump(num bodyIndex);
	external void __destroy__();
}

@JS('b2Transform')
class B2TransformJSImpl {
	external B2TransformJSImpl();
	external B2TransformJSImpl.from2(B2Vec2JSImpl position, B2RotJSImpl rotation);

	external void setIdentity();
	external void set(B2Vec2JSImpl position, num angle);
	external B2Vec2JSImpl get_p();
	external void set_p(B2Vec2JSImpl arg0);
	external B2RotJSImpl get_q();
	external void set_q(B2RotJSImpl arg0);
	external void __destroy__();
}

@JS('b2RayCastCallback')
class B2RayCastCallbackJSImpl {

	external void __destroy__();
}

@JS('JSRayCastCallback')
class JSRayCastCallbackJSImpl {
	external JSRayCastCallbackJSImpl();

	external double reportFixture(B2FixtureJSImpl fixture, B2Vec2JSImpl point, B2Vec2JSImpl normal, num fraction);
	external void __destroy__();
}

@JS('b2QueryCallback')
class B2QueryCallbackJSImpl {

	external void __destroy__();
}

@JS('JSQueryCallback')
class JSQueryCallbackJSImpl {
	external JSQueryCallbackJSImpl();

	external bool reportFixture(B2FixtureJSImpl fixture);
	external void __destroy__();
}

@JS('b2MassData')
class B2MassDataJSImpl {
	external B2MassDataJSImpl();

	external double get_mass();
	external void set_mass(num arg0);
	external B2Vec2JSImpl get_center();
	external void set_center(B2Vec2JSImpl arg0);
	external double get_I();
	external void set_I(num arg0);
	external void __destroy__();
}

@JS('b2Vec2')
class B2Vec2JSImpl {
	external B2Vec2JSImpl();
	external B2Vec2JSImpl.from2(num x, num y);

	external void setZero();
	external void set(num x, num y);
	external void op_add(B2Vec2JSImpl v);
	external void op_sub(B2Vec2JSImpl v);
	external void op_mul(num s);
	external double length();
	external double lengthSquared();
	external double normalize();
	external bool isValid();
	external B2Vec2JSImpl skew();
	external double get_x();
	external void set_x(num arg0);
	external double get_y();
	external void set_y(num arg0);
	external void __destroy__();
}

@JS('b2Vec3')
class B2Vec3JSImpl {
	external B2Vec3JSImpl();
	external B2Vec3JSImpl.from3(num x, num y, num z);

	external void setZero();
	external void set(num x, num y, num z);
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

@JS('b2BodyUserData')
class B2BodyUserDataJSImpl {

	external int get_pointer();
	external void set_pointer(int arg0);
	external void __destroy__();
}

@JS('b2Body')
class B2BodyJSImpl {

	external B2FixtureJSImpl createFixture1(B2FixtureDefJSImpl shape);
	external B2FixtureJSImpl createFixture2(B2ShapeJSImpl shape, num density);
	external void destroyFixture(B2FixtureJSImpl fixture);
	external void setTransform(B2Vec2JSImpl position, num angle);
	external B2TransformJSImpl getTransform();
	external B2Vec2JSImpl getPosition();
	external double getAngle();
	external B2Vec2JSImpl getWorldCenter();
	external B2Vec2JSImpl getLocalCenter();
	external void setLinearVelocity(B2Vec2JSImpl v);
	external B2Vec2JSImpl getLinearVelocity();
	external void setAngularVelocity(num omega);
	external double getAngularVelocity();
	external void applyForce(B2Vec2JSImpl force, B2Vec2JSImpl point, bool wake);
	external void applyForceToCenter(B2Vec2JSImpl force, bool wake);
	external void applyTorque(num torque, bool awake);
	external void applyLinearImpulse(B2Vec2JSImpl impulse, B2Vec2JSImpl point, bool wake);
	external void applyLinearImpulseToCenter(B2Vec2JSImpl impulse, bool wake);
	external void applyAngularImpulse(num impulse, bool wake);
	external double getMass();
	external double getInertia();
	external void getMassData(B2MassDataJSImpl data);
	external void setMassData(B2MassDataJSImpl data);
	external void resetMassData();
	external B2Vec2JSImpl getWorldPoint(B2Vec2JSImpl localPoint);
	external B2Vec2JSImpl getWorldVector(B2Vec2JSImpl localVector);
	external B2Vec2JSImpl getLocalPoint(B2Vec2JSImpl worldPoint);
	external B2Vec2JSImpl getLocalVector(B2Vec2JSImpl worldVector);
	external B2Vec2JSImpl getLinearVelocityFromWorldPoint(B2Vec2JSImpl worldPoint);
	external B2Vec2JSImpl getLinearVelocityFromLocalPoint(B2Vec2JSImpl localPoint);
	external double getLinearDamping();
	external void setLinearDamping(num linearDamping);
	external double getAngularDamping();
	external void setAngularDamping(num angularDamping);
	external double getGravityScale();
	external void setGravityScale(num scale);
	external void setType(B2BodyType type);
	external B2BodyType getType();
	external void setBullet(bool flag);
	external bool isBullet();
	external void setSleepingAllowed(bool flag);
	external bool isSleepingAllowed();
	external void setAwake(bool flag);
	external bool isAwake();
	external void setEnabled(bool flag);
	external bool isEnabled();
	external void setFixedRotation(bool flag);
	external bool isFixedRotation();
	external B2FixtureJSImpl getFixtureList();
	external B2JointEdgeJSImpl getJointList();
	external B2ContactEdgeJSImpl getContactList();
	external B2BodyJSImpl getNext();
	external B2BodyUserDataJSImpl getUserData();
	external B2WorldJSImpl getWorld();
	external void dump();
}

@JS('b2BodyDef')
class B2BodyDefJSImpl {
	external B2BodyDefJSImpl();

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

@JS('b2Filter')
class B2FilterJSImpl {
	external B2FilterJSImpl();

	external int get_categoryBits();
	external void set_categoryBits(int arg0);
	external int get_maskBits();
	external void set_maskBits(int arg0);
	external int get_groupIndex();
	external void set_groupIndex(int arg0);
	external void __destroy__();
}

@JS('b2AABB')
class B2AABBJSImpl {
	external B2AABBJSImpl();

	external bool isValid();
	external B2Vec2JSImpl getCenter();
	external B2Vec2JSImpl getExtents();
	external double getPerimeter();
	external void combine1(B2AABBJSImpl aabb1);
	external void combine2(B2AABBJSImpl aabb1, B2AABBJSImpl aabb2);
	external bool contains(B2AABBJSImpl aabb);
	external bool rayCast(B2RayCastOutputJSImpl output, B2RayCastInputJSImpl input);
	external B2Vec2JSImpl get_lowerBound();
	external void set_lowerBound(B2Vec2JSImpl arg0);
	external B2Vec2JSImpl get_upperBound();
	external void set_upperBound(B2Vec2JSImpl arg0);
	external void __destroy__();
}

@JS('b2CircleShape')
class B2CircleShapeJSImpl {
	external B2CircleShapeJSImpl();

	external B2ShapeType getType();
	external num getChildCount();
	external bool testPoint(B2TransformJSImpl xf, B2Vec2JSImpl p);
	external bool rayCast(B2RayCastOutputJSImpl output, B2RayCastInputJSImpl input, B2TransformJSImpl transform, num childIndex);
	external void computeAABB(B2AABBJSImpl aabb, B2TransformJSImpl xf, num childIndex);
	external void computeMass(B2MassDataJSImpl massData, num density);
	external B2Vec2JSImpl get_m_p();
	external void set_m_p(B2Vec2JSImpl arg0);
	external B2ShapeType get_m_type();
	external void set_m_type(B2ShapeType arg0);
	external double get_m_radius();
	external void set_m_radius(num arg0);
	external void __destroy__();
}

@JS('b2EdgeShape')
class B2EdgeShapeJSImpl {
	external B2EdgeShapeJSImpl();

	external void setOneSided(B2Vec2JSImpl v0, B2Vec2JSImpl v1, B2Vec2JSImpl v2, B2Vec2JSImpl v3);
	external void setTwoSided(B2Vec2JSImpl v1, B2Vec2JSImpl v2);
	external B2ShapeType getType();
	external num getChildCount();
	external bool testPoint(B2TransformJSImpl xf, B2Vec2JSImpl p);
	external bool rayCast(B2RayCastOutputJSImpl output, B2RayCastInputJSImpl input, B2TransformJSImpl transform, num childIndex);
	external void computeAABB(B2AABBJSImpl aabb, B2TransformJSImpl xf, num childIndex);
	external void computeMass(B2MassDataJSImpl massData, num density);
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

@JS('b2JointUserData')
class B2JointUserDataJSImpl {

	external int get_pointer();
	external void set_pointer(int arg0);
	external void __destroy__();
}

@JS('b2WeldJoint')
class B2WeldJointJSImpl {

	external B2Vec2JSImpl getLocalAnchorA();
	external B2Vec2JSImpl getLocalAnchorB();
	external double getReferenceAngle();
	external void setStiffness(num stiffness);
	external double getStiffness();
	external void setDamping(num damping);
	external double getDamping();
	external void dump();
	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void __destroy__();
}

@JS('b2WeldJointDef')
class B2WeldJointDefJSImpl {
	external B2WeldJointDefJSImpl();

	external void initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB, B2Vec2JSImpl anchor);
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

@JS('b2ChainShape')
class B2ChainShapeJSImpl {
	external B2ChainShapeJSImpl();

	external void clear();
	external void createLoop(B2Vec2JSImpl vertices, num count);
	external void createChain(B2Vec2JSImpl vertices, num count, B2Vec2JSImpl prevVertex, B2Vec2JSImpl nextVertex);
	external void getChildEdge(B2EdgeShapeJSImpl edge, num index);
	external B2ShapeType getType();
	external num getChildCount();
	external bool testPoint(B2TransformJSImpl xf, B2Vec2JSImpl p);
	external bool rayCast(B2RayCastOutputJSImpl output, B2RayCastInputJSImpl input, B2TransformJSImpl transform, num childIndex);
	external void computeAABB(B2AABBJSImpl aabb, B2TransformJSImpl xf, num childIndex);
	external void computeMass(B2MassDataJSImpl massData, num density);
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

@JS('b2Color')
class B2ColorJSImpl {
	external B2ColorJSImpl();
	external B2ColorJSImpl.from3(num r, num g, num b);

	external void set(num ri, num gi, num bi);
	external double get_r();
	external void set_r(num arg0);
	external double get_g();
	external void set_g(num arg0);
	external double get_b();
	external void set_b(num arg0);
	external void __destroy__();
}

@JS('b2ContactEdge')
class B2ContactEdgeJSImpl {
	external B2ContactEdgeJSImpl();

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

@JS('b2ContactFeature')
class B2ContactFeatureJSImpl {

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

@JS('b2ContactFilter')
class B2ContactFilterJSImpl {

	external void __destroy__();
}

@JS('JSContactFilter')
class JSContactFilterJSImpl {
	external JSContactFilterJSImpl();

	external bool shouldCollide(B2FixtureJSImpl fixtureA, B2FixtureJSImpl fixtureB);
	external void __destroy__();
}

@JS('b2ContactID')
class B2ContactIDJSImpl {

	external B2ContactFeatureJSImpl get_cf();
	external void set_cf(B2ContactFeatureJSImpl arg0);
	external int get_key();
	external void set_key(int arg0);
	external void __destroy__();
}

@JS('b2ContactImpulse')
class B2ContactImpulseJSImpl {

	external double get_normalImpulses(num arg0);
	external void set_normalImpulses(num arg0, num arg1);
	external double get_tangentImpulses(num arg0);
	external void set_tangentImpulses(num arg0, num arg1);
	external num get_count();
	external void set_count(num arg0);
	external void __destroy__();
}

@JS('b2DestructionListener')
class B2DestructionListenerJSImpl {

	external void __destroy__();
}

@JS('b2DestructionListenerWrapper')
class B2DestructionListenerWrapperJSImpl {

	external void __destroy__();
}

@JS('JSDestructionListener')
class JSDestructionListenerJSImpl {
	external JSDestructionListenerJSImpl();

	external void sayGoodbyeJoint(B2JointJSImpl joint);
	external void sayGoodbyeFixture(B2FixtureJSImpl joint);
	external void __destroy__();
}

@JS('b2DistanceJoint')
class B2DistanceJointJSImpl {

	external B2Vec2JSImpl getLocalAnchorA();
	external B2Vec2JSImpl getLocalAnchorB();
	external double getLength();
	external void setLength(num length);
	external double getMinLength();
	external void setMinLength(num minLength);
	external double getMaxLength();
	external void setMaxLength(num maxLength);
	external double getCurrentLength();
	external void setStiffness(num stiffness);
	external double getStiffness();
	external void setDamping(num damping);
	external double getDamping();
	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void __destroy__();
}

@JS('b2DistanceJointDef')
class B2DistanceJointDefJSImpl {
	external B2DistanceJointDefJSImpl();

	external void initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB, B2Vec2JSImpl anchorA, B2Vec2JSImpl anchorB);
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

@JS('b2Draw')
class B2DrawJSImpl {

	external void setFlags(int flags);
	external int getFlags();
	external void appendFlags(int flags);
	external void clearFlags(int flags);
	external void __destroy__();
}

@JS('JSDraw')
class JSDrawJSImpl {
	external JSDrawJSImpl();

	external void drawPolygon(B2Vec2JSImpl vertices, num vertexCount, B2ColorJSImpl color);
	external void drawSolidPolygon(B2Vec2JSImpl vertices, num vertexCount, B2ColorJSImpl color);
	external void drawCircle(B2Vec2JSImpl center, num radius, B2ColorJSImpl color);
	external void drawSolidCircle(B2Vec2JSImpl center, num radius, B2Vec2JSImpl axis, B2ColorJSImpl color);
	external void drawSegment(B2Vec2JSImpl p1, B2Vec2JSImpl p2, B2ColorJSImpl color);
	external void drawTransform(B2TransformJSImpl xf);
	external void drawPoint(B2Vec2JSImpl p, num size, B2ColorJSImpl color);
	external void __destroy__();
}

@JS('b2FrictionJoint')
class B2FrictionJointJSImpl {

	external B2Vec2JSImpl getLocalAnchorA();
	external B2Vec2JSImpl getLocalAnchorB();
	external void setMaxForce(num force);
	external double getMaxForce();
	external void setMaxTorque(num torque);
	external double getMaxTorque();
	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void __destroy__();
}

@JS('b2FrictionJointDef')
class B2FrictionJointDefJSImpl {
	external B2FrictionJointDefJSImpl();

	external void initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB, B2Vec2JSImpl anchor);
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

@JS('b2GearJoint')
class B2GearJointJSImpl {

	external B2JointJSImpl getJoint1();
	external B2JointJSImpl getJoint2();
	external void setRatio(num ratio);
	external double getRatio();
	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void __destroy__();
}

@JS('b2GearJointDef')
class B2GearJointDefJSImpl {
	external B2GearJointDefJSImpl();

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

@JS('b2JointEdge')
class B2JointEdgeJSImpl {
	external B2JointEdgeJSImpl();

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

@JS('b2Manifold')
class B2ManifoldJSImpl {
	external B2ManifoldJSImpl();

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

@JS('b2WorldManifold')
class B2WorldManifoldJSImpl {
	external B2WorldManifoldJSImpl();

	external void initialize(B2ManifoldJSImpl manifold, B2TransformJSImpl xfA, num radiusA, B2TransformJSImpl xfB, num radiusB);
	external B2Vec2JSImpl get_normal();
	external void set_normal(B2Vec2JSImpl arg0);
	external B2Vec2JSImpl get_points(num arg0);
	external void set_points(num arg0, B2Vec2JSImpl arg1);
	external double get_separations(num arg0);
	external void set_separations(num arg0, num arg1);
	external void __destroy__();
}

@JS('b2ManifoldPoint')
class B2ManifoldPointJSImpl {
	external B2ManifoldPointJSImpl();

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

@JS('b2Mat22')
class B2Mat22JSImpl {
	external B2Mat22JSImpl();
	external B2Mat22JSImpl.from2(B2Vec2JSImpl a11, B2Vec2JSImpl a12);
	external B2Mat22JSImpl.from4(num a11, num a12, num a21, num a22);

	external void set(B2Vec2JSImpl c1, B2Vec2JSImpl c2);
	external void setIdentity();
	external void setZero();
	external B2Mat22JSImpl getInverse();
	external B2Vec2JSImpl solve(B2Vec2JSImpl b);
	external B2Vec2JSImpl get_ex();
	external void set_ex(B2Vec2JSImpl arg0);
	external B2Vec2JSImpl get_ey();
	external void set_ey(B2Vec2JSImpl arg0);
	external void __destroy__();
}

@JS('b2Mat33')
class B2Mat33JSImpl {
	external B2Mat33JSImpl();
	external B2Mat33JSImpl.from3(B2Vec3JSImpl c1, B2Vec3JSImpl c2, B2Vec3JSImpl c3);

	external void setZero();
	external B2Vec3JSImpl solve33(B2Vec3JSImpl b);
	external B2Vec2JSImpl solve22(B2Vec2JSImpl b);
	external void getInverse22(B2Mat33JSImpl M);
	external void getSymInverse33(B2Mat33JSImpl M);
	external B2Vec3JSImpl get_ex();
	external void set_ex(B2Vec3JSImpl arg0);
	external B2Vec3JSImpl get_ey();
	external void set_ey(B2Vec3JSImpl arg0);
	external B2Vec3JSImpl get_ez();
	external void set_ez(B2Vec3JSImpl arg0);
	external void __destroy__();
}

@JS('b2MouseJoint')
class B2MouseJointJSImpl {

	external void setTarget(B2Vec2JSImpl target);
	external B2Vec2JSImpl getTarget();
	external void setMaxForce(num force);
	external double getMaxForce();
	external void setStiffness(num stiffness);
	external double getStiffness();
	external void setDamping(num damping);
	external double getDamping();
	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void __destroy__();
}

@JS('b2MouseJointDef')
class B2MouseJointDefJSImpl {
	external B2MouseJointDefJSImpl();

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

@JS('b2PolygonShape')
class B2PolygonShapeJSImpl {
	external B2PolygonShapeJSImpl();

	external void set(B2Vec2JSImpl vertices, num vertexCount);
	external void setAsBox2(num hx, num hy);
	external void setAsBox4(num hx, num hy, B2Vec2JSImpl center, num angle);
	external B2ShapeType getType();
	external num getChildCount();
	external bool testPoint(B2TransformJSImpl xf, B2Vec2JSImpl p);
	external bool rayCast(B2RayCastOutputJSImpl output, B2RayCastInputJSImpl input, B2TransformJSImpl transform, num childIndex);
	external void computeAABB(B2AABBJSImpl aabb, B2TransformJSImpl xf, num childIndex);
	external void computeMass(B2MassDataJSImpl massData, num density);
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

@JS('b2PrismaticJoint')
class B2PrismaticJointJSImpl {

	external B2Vec2JSImpl getLocalAnchorA();
	external B2Vec2JSImpl getLocalAnchorB();
	external B2Vec2JSImpl getLocalAxisA();
	external double getReferenceAngle();
	external double getJointTranslation();
	external double getJointSpeed();
	external bool isLimitEnabled();
	external void enableLimit(bool flag);
	external double getLowerLimit();
	external double getUpperLimit();
	external void setLimits(num lower, num upper);
	external bool isMotorEnabled();
	external void enableMotor(bool flag);
	external void setMotorSpeed(num speed);
	external double getMotorSpeed();
	external void setMaxMotorForce(num force);
	external double getMaxMotorForce();
	external double getMotorForce(num inv_dt);
	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void __destroy__();
}

@JS('b2PrismaticJointDef')
class B2PrismaticJointDefJSImpl {
	external B2PrismaticJointDefJSImpl();

	external void initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB, B2Vec2JSImpl anchor, B2Vec2JSImpl axis);
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

@JS('b2Profile')
class B2ProfileJSImpl {

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

@JS('b2PulleyJoint')
class B2PulleyJointJSImpl {

	external B2Vec2JSImpl getGroundAnchorA();
	external B2Vec2JSImpl getGroundAnchorB();
	external double getLengthA();
	external double getLengthB();
	external double getRatio();
	external double getCurrentLengthA();
	external double getCurrentLengthB();
	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void __destroy__();
}

@JS('b2PulleyJointDef')
class B2PulleyJointDefJSImpl {
	external B2PulleyJointDefJSImpl();

	external void initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB, B2Vec2JSImpl groundAnchorA, B2Vec2JSImpl groundAnchorB, B2Vec2JSImpl anchorA, B2Vec2JSImpl anchorB, num ratio);
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

@JS('b2RayCastInput')
class B2RayCastInputJSImpl {

	external B2Vec2JSImpl get_p1();
	external void set_p1(B2Vec2JSImpl arg0);
	external B2Vec2JSImpl get_p2();
	external void set_p2(B2Vec2JSImpl arg0);
	external double get_maxFraction();
	external void set_maxFraction(num arg0);
	external void __destroy__();
}

@JS('b2RayCastOutput')
class B2RayCastOutputJSImpl {

	external B2Vec2JSImpl get_normal();
	external void set_normal(B2Vec2JSImpl arg0);
	external double get_fraction();
	external void set_fraction(num arg0);
	external void __destroy__();
}

@JS('b2RevoluteJoint')
class B2RevoluteJointJSImpl {

	external B2Vec2JSImpl getLocalAnchorA();
	external B2Vec2JSImpl getLocalAnchorB();
	external double getReferenceAngle();
	external double getJointAngle();
	external double getJointSpeed();
	external bool isLimitEnabled();
	external void enableLimit(bool flag);
	external double getLowerLimit();
	external double getUpperLimit();
	external void setLimits(num lower, num upper);
	external bool isMotorEnabled();
	external void enableMotor(bool flag);
	external void setMotorSpeed(num speed);
	external double getMotorSpeed();
	external void setMaxMotorTorque(num torque);
	external double getMaxMotorTorque();
	external double getMotorTorque(num inv_dt);
	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void __destroy__();
}

@JS('b2RevoluteJointDef')
class B2RevoluteJointDefJSImpl {
	external B2RevoluteJointDefJSImpl();

	external void initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB, B2Vec2JSImpl anchor);
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

@JS('b2Rot')
class B2RotJSImpl {
	external B2RotJSImpl();
	external B2RotJSImpl.from1(num angle);

	external void set(num angle);
	external void setIdentity();
	external double getAngle();
	external B2Vec2JSImpl getXAxis();
	external B2Vec2JSImpl getYAxis();
	external double get_s();
	external void set_s(num arg0);
	external double get_c();
	external void set_c(num arg0);
	external void __destroy__();
}

@JS('b2WheelJoint')
class B2WheelJointJSImpl {

	external B2Vec2JSImpl getLocalAnchorA();
	external B2Vec2JSImpl getLocalAnchorB();
	external B2Vec2JSImpl getLocalAxisA();
	external double getJointTranslation();
	external double getJointLinearSpeed();
	external double getJointAngle();
	external double getJointAngularSpeed();
	external bool isLimitEnabled();
	external void enableLimit(bool flag);
	external double getLowerLimit();
	external double getUpperLimit();
	external void setLimits(num lower, num upper);
	external bool isMotorEnabled();
	external void enableMotor(bool flag);
	external void setMotorSpeed(num speed);
	external double getMotorSpeed();
	external void setMaxMotorTorque(num torque);
	external double getMaxMotorTorque();
	external double getMotorTorque(num inv_dt);
	external void setStiffness(num stiffness);
	external double getStiffness();
	external void setDamping(num damping);
	external double getDamping();
	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void __destroy__();
}

@JS('b2WheelJointDef')
class B2WheelJointDefJSImpl {
	external B2WheelJointDefJSImpl();

	external void initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB, B2Vec2JSImpl anchor, B2Vec2JSImpl axis);
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

@JS('b2MotorJoint')
class B2MotorJointJSImpl {

	external void setLinearOffset(B2Vec2JSImpl linearOffset);
	external B2Vec2JSImpl getLinearOffset();
	external void setAngularOffset(num angularOffset);
	external double getAngularOffset();
	external void setMaxForce(num force);
	external double getMaxForce();
	external void setMaxTorque(num torque);
	external double getMaxTorque();
	external void setCorrectionFactor(num factor);
	external double getCorrectionFactor();
	external B2JointType getType();
	external B2BodyJSImpl getBodyA();
	external B2BodyJSImpl getBodyB();
	external B2Vec2JSImpl getAnchorA();
	external B2Vec2JSImpl getAnchorB();
	external B2Vec2JSImpl getReactionForce(num inv_dt);
	external double getReactionTorque(num inv_dt);
	external B2JointJSImpl getNext();
	external B2JointUserDataJSImpl getUserData();
	external bool getCollideConnected();
	external void __destroy__();
}

@JS('b2MotorJointDef')
class B2MotorJointDefJSImpl {
	external B2MotorJointDefJSImpl();

	external void initialize(B2BodyJSImpl bodyA, B2BodyJSImpl bodyB);
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

@JS('b2RopeTuning')
class B2RopeTuningJSImpl {
	external B2RopeTuningJSImpl();

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

@JS('b2RopeDef')
class B2RopeDefJSImpl {
	external B2RopeDefJSImpl();

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

@JS('b2Rope')
class B2RopeJSImpl {
	external B2RopeJSImpl();

	external void create(B2RopeDefJSImpl def);
	external void setTuning(B2RopeTuningJSImpl tuning);
	external void step(num timeStep, num iterations, B2Vec2JSImpl position);
	external void reset(B2Vec2JSImpl position);
	//external void draw(B2DrawJSImpl draw);
	external void __destroy__();
}

@JS('b2ClipVertex')
class B2ClipVertexJSImpl {
	external B2ClipVertexJSImpl();

	external B2Vec2JSImpl get_v();
	external void set_v(B2Vec2JSImpl arg0);
	external B2ContactIDJSImpl get_id();
	external void set_id(B2ContactIDJSImpl arg0);
	external void __destroy__();
}

