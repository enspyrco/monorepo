import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

import 'b2_delegates.dart';
import 'b2_enums.dart';

class B2Shape {

	final B2ShapePlatform _delegate;

	B2Shape._(B2ShapePlatform delegate) : _delegate = delegate;

	B2ShapeType getType() => _delegate.getType();
	int getChildCount() => _delegate.getChildCount();
	bool testPoint(B2Transform xf, B2Vec2 p) => _delegate.testPoint(xf._delegate, p._delegate);
	bool rayCast(B2RayCastOutput output, B2RayCastInput input, B2Transform transform, int childIndex) => _delegate.rayCast(output._delegate, input._delegate, transform._delegate, childIndex);
	void computeAABB(B2AABB aabb, B2Transform xf, int childIndex) => _delegate.computeAABB(aabb._delegate, xf._delegate, childIndex);
	void computeMass(B2MassData massData, double density) => _delegate.computeMass(massData._delegate, density);
	B2ShapeType get m_type => _delegate.get_m_type();
	set m_type(B2ShapeType arg0) => _delegate.set_m_type(arg0);
	double get m_radius => _delegate.get_m_radius();
	set m_radius(double arg0) => _delegate.set_m_radius(arg0);
	void dispose() => _delegate.dispose();
}

class B2JointDef {

	final B2JointDefPlatform _delegate;

	B2JointDef._(B2JointDefPlatform delegate) : _delegate = delegate;

	B2JointDef() : _delegate = FlutterBox2DPlatform.instance.b2JointDef_0();

	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2Joint {

	final B2JointPlatform _delegate;

	B2Joint._(B2JointPlatform delegate) : _delegate = delegate;

	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dump() => _delegate.dump();
}

class VoidPtr {

	final VoidPtrPlatform _delegate;

	VoidPtr._(VoidPtrPlatform delegate) : _delegate = delegate;

	void dispose() => _delegate.dispose();
}

class B2Contact {

	final B2ContactPlatform _delegate;

	B2Contact._(B2ContactPlatform delegate) : _delegate = delegate;

	B2Manifold getManifold() => B2Manifold._(_delegate.getManifold());
	void getWorldManifold(B2WorldManifold manifold) => _delegate.getWorldManifold(manifold._delegate);
	bool isTouching() => _delegate.isTouching();
	void setEnabled(bool flag) => _delegate.setEnabled(flag);
	bool isEnabled() => _delegate.isEnabled();
	B2Contact getNext() => B2Contact._(_delegate.getNext());
	B2Fixture getFixtureA() => B2Fixture._(_delegate.getFixtureA());
	int getChildIndexA() => _delegate.getChildIndexA();
	B2Fixture getFixtureB() => B2Fixture._(_delegate.getFixtureB());
	int getChildIndexB() => _delegate.getChildIndexB();
	void setFriction(double friction) => _delegate.setFriction(friction);
	double getFriction() => _delegate.getFriction();
	void resetFriction() => _delegate.resetFriction();
	void setRestitution(double restitution) => _delegate.setRestitution(restitution);
	double getRestitution() => _delegate.getRestitution();
	void resetRestitution() => _delegate.resetRestitution();
	void setRestitutionThreshold(double threshold) => _delegate.setRestitutionThreshold(threshold);
	double getRestitutionThreshold() => _delegate.getRestitutionThreshold();
	void resetRestitutionThreshold() => _delegate.resetRestitutionThreshold();
	void setTangentSpeed(double speed) => _delegate.setTangentSpeed(speed);
	double getTangentSpeed() => _delegate.getTangentSpeed();
}

class B2ContactListener {

	final B2ContactListenerPlatform _delegate;

	B2ContactListener._(B2ContactListenerPlatform delegate) : _delegate = delegate;

	void dispose() => _delegate.dispose();
}

class JSContactListener {

	final JSContactListenerPlatform _delegate;

	JSContactListener._(JSContactListenerPlatform delegate) : _delegate = delegate;

	JSContactListener() : _delegate = FlutterBox2DPlatform.instance.JSContactListener_0();

	void beginContact(B2Contact contact) => _delegate.beginContact(contact._delegate);
	void endContact(B2Contact contact) => _delegate.endContact(contact._delegate);
	void preSolve(B2Contact contact, B2Manifold oldManifold) => _delegate.preSolve(contact._delegate, oldManifold._delegate);
	void postSolve(B2Contact contact, B2ContactImpulse impulse) => _delegate.postSolve(contact._delegate, impulse._delegate);
	void dispose() => _delegate.dispose();
}

class B2World {

	final B2WorldPlatform _delegate;

	B2World._(B2WorldPlatform delegate) : _delegate = delegate;

	B2World.from1(B2Vec2 gravity) : _delegate = FlutterBox2DPlatform.instance.b2World_1(gravity._delegate);

	//void setDestructionListener(B2DestructionListener listener) => _delegate.setDestructionListener(listener._delegate);
	//void setContactFilter(JSContactFilter filter) => _delegate.setContactFilter(filter._delegate);
	//void setContactListener(JSContactListener listener) => _delegate.setContactListener(listener._delegate);
	//void setDebugDraw(B2Draw debugDraw) => _delegate.setDebugDraw(debugDraw._delegate);
	B2Body createBody(B2BodyDef def) => B2Body._(_delegate.createBody(def._delegate));
	void destroyBody(B2Body body) => _delegate.destroyBody(body._delegate);
	B2Joint createJoint(B2JointDef def) => B2Joint._(_delegate.createJoint(def._delegate));
	void destroyJoint(B2Joint joint) => _delegate.destroyJoint(joint._delegate);
	void step(double timeStep, int velocityIterations, int positionIterations) => _delegate.step(timeStep, velocityIterations, positionIterations);
	void clearForces() => _delegate.clearForces();
	void debugDraw() => _delegate.debugDraw();
	//void queryAABB(B2QueryCallback callback, B2AABB aabb) => _delegate.queryAABB(callback._delegate, aabb._delegate);
	//void rayCast(B2RayCastCallback callback, B2Vec2 point1, B2Vec2 point2) => _delegate.rayCast(callback._delegate, point1._delegate, point2._delegate);
	B2Body getBodyList() => B2Body._(_delegate.getBodyList());
	B2Joint getJointList() => B2Joint._(_delegate.getJointList());
	B2Contact getContactList() => B2Contact._(_delegate.getContactList());
	void setAllowSleeping(bool flag) => _delegate.setAllowSleeping(flag);
	bool getAllowSleeping() => _delegate.getAllowSleeping();
	void setWarmStarting(bool flag) => _delegate.setWarmStarting(flag);
	bool getWarmStarting() => _delegate.getWarmStarting();
	void setContinuousPhysics(bool flag) => _delegate.setContinuousPhysics(flag);
	bool getContinuousPhysics() => _delegate.getContinuousPhysics();
	void setSubStepping(bool flag) => _delegate.setSubStepping(flag);
	bool getSubStepping() => _delegate.getSubStepping();
	int getProxyCount() => _delegate.getProxyCount();
	int getBodyCount() => _delegate.getBodyCount();
	int getJointCount() => _delegate.getJointCount();
	int getContactCount() => _delegate.getContactCount();
	int getTreeHeight() => _delegate.getTreeHeight();
	int getTreeBalance() => _delegate.getTreeBalance();
	double getTreeQuality() => _delegate.getTreeQuality();
	void setGravity(B2Vec2 gravity) => _delegate.setGravity(gravity._delegate);
	B2Vec2 getGravity() => B2Vec2._(_delegate.getGravity());
	bool isLocked() => _delegate.isLocked();
	void setAutoClearForces(bool flag) => _delegate.setAutoClearForces(flag);
	bool getAutoClearForces() => _delegate.getAutoClearForces();
	B2Profile getProfile() => B2Profile._(_delegate.getProfile());
	void dump() => _delegate.dump();
	void dispose() => _delegate.dispose();
}

class B2FixtureUserData {

	final B2FixtureUserDataPlatform _delegate;

	B2FixtureUserData._(B2FixtureUserDataPlatform delegate) : _delegate = delegate;

	int get pointer => _delegate.get_pointer();
	set pointer(int arg0) => _delegate.set_pointer(arg0);
	void dispose() => _delegate.dispose();
}

class B2FixtureDef {

	final B2FixtureDefPlatform _delegate;

	B2FixtureDef._(B2FixtureDefPlatform delegate) : _delegate = delegate;

	B2FixtureDef() : _delegate = FlutterBox2DPlatform.instance.b2FixtureDef_0();

	B2Shape get shape => B2Shape._(_delegate.get_shape());
	set shape(B2Shape arg0) => _delegate.set_shape(arg0._delegate);
	B2FixtureUserData get userData => B2FixtureUserData._(_delegate.get_userData());
	set userData(B2FixtureUserData arg0) => _delegate.set_userData(arg0._delegate);
	double get friction => _delegate.get_friction();
	set friction(double arg0) => _delegate.set_friction(arg0);
	double get restitution => _delegate.get_restitution();
	set restitution(double arg0) => _delegate.set_restitution(arg0);
	double get restitutionThreshold => _delegate.get_restitutionThreshold();
	set restitutionThreshold(double arg0) => _delegate.set_restitutionThreshold(arg0);
	double get density => _delegate.get_density();
	set density(double arg0) => _delegate.set_density(arg0);
	bool get isSensor => _delegate.get_isSensor();
	set isSensor(bool arg0) => _delegate.set_isSensor(arg0);
	B2Filter get filter => B2Filter._(_delegate.get_filter());
	set filter(B2Filter arg0) => _delegate.set_filter(arg0._delegate);
	void dispose() => _delegate.dispose();
}

class B2Fixture {

	final B2FixturePlatform _delegate;

	B2Fixture._(B2FixturePlatform delegate) : _delegate = delegate;

	B2ShapeType getType() => _delegate.getType();
	B2Shape getShape() => B2Shape._(_delegate.getShape());
	void setSensor(bool sensor) => _delegate.setSensor(sensor);
	bool isSensor() => _delegate.isSensor();
	void setFilterData(B2Filter filter) => _delegate.setFilterData(filter._delegate);
	B2Filter getFilterData() => B2Filter._(_delegate.getFilterData());
	void refilter() => _delegate.refilter();
	B2Body getBody() => B2Body._(_delegate.getBody());
	B2Fixture getNext() => B2Fixture._(_delegate.getNext());
	B2FixtureUserData getUserData() => B2FixtureUserData._(_delegate.getUserData());
	bool testPoint(B2Vec2 p) => _delegate.testPoint(p._delegate);
	bool rayCast(B2RayCastOutput output, B2RayCastInput input, int childIndex) => _delegate.rayCast(output._delegate, input._delegate, childIndex);
	void getMassData(B2MassData massData) => _delegate.getMassData(massData._delegate);
	void setDensity(double density) => _delegate.setDensity(density);
	double getDensity() => _delegate.getDensity();
	double getFriction() => _delegate.getFriction();
	void setFriction(double friction) => _delegate.setFriction(friction);
	double getRestitution() => _delegate.getRestitution();
	void setRestitution(double restitution) => _delegate.setRestitution(restitution);
	double getRestitutionThreshold() => _delegate.getRestitutionThreshold();
	void setRestitutionThreshold(double threshold) => _delegate.setRestitutionThreshold(threshold);
	B2AABB getAABB(int childIndex) => B2AABB._(_delegate.getAABB(childIndex));
	void dump(int bodyIndex) => _delegate.dump(bodyIndex);
	void dispose() => _delegate.dispose();
}

class B2Transform {

	final B2TransformPlatform _delegate;

	B2Transform._(B2TransformPlatform delegate) : _delegate = delegate;

	B2Transform() : _delegate = FlutterBox2DPlatform.instance.b2Transform_0();

	B2Transform.from2(B2Vec2 position, B2Rot rotation) : _delegate = FlutterBox2DPlatform.instance.b2Transform_2(position._delegate, rotation._delegate);

	void setIdentity() => _delegate.setIdentity();
	void set(B2Vec2 position, double angle) => _delegate.set(position._delegate, angle);
	B2Vec2 get p => B2Vec2._(_delegate.get_p());
	set p(B2Vec2 arg0) => _delegate.set_p(arg0._delegate);
	B2Rot get q => B2Rot._(_delegate.get_q());
	set q(B2Rot arg0) => _delegate.set_q(arg0._delegate);
	void dispose() => _delegate.dispose();
}

class B2RayCastCallback {

	final B2RayCastCallbackPlatform _delegate;

	B2RayCastCallback._(B2RayCastCallbackPlatform delegate) : _delegate = delegate;

	void dispose() => _delegate.dispose();
}

class JSRayCastCallback {

	final JSRayCastCallbackPlatform _delegate;

	JSRayCastCallback._(JSRayCastCallbackPlatform delegate) : _delegate = delegate;

	JSRayCastCallback() : _delegate = FlutterBox2DPlatform.instance.JSRayCastCallback_0();

	double reportFixture(B2Fixture fixture, B2Vec2 point, B2Vec2 normal, double fraction) => _delegate.reportFixture(fixture._delegate, point._delegate, normal._delegate, fraction);
	void dispose() => _delegate.dispose();
}

class B2QueryCallback {

	final B2QueryCallbackPlatform _delegate;

	B2QueryCallback._(B2QueryCallbackPlatform delegate) : _delegate = delegate;

	void dispose() => _delegate.dispose();
}

class JSQueryCallback {

	final JSQueryCallbackPlatform _delegate;

	JSQueryCallback._(JSQueryCallbackPlatform delegate) : _delegate = delegate;

	JSQueryCallback() : _delegate = FlutterBox2DPlatform.instance.JSQueryCallback_0();

	bool reportFixture(B2Fixture fixture) => _delegate.reportFixture(fixture._delegate);
	void dispose() => _delegate.dispose();
}

class B2MassData {

	final B2MassDataPlatform _delegate;

	B2MassData._(B2MassDataPlatform delegate) : _delegate = delegate;

	B2MassData() : _delegate = FlutterBox2DPlatform.instance.b2MassData_0();

	double get mass => _delegate.get_mass();
	set mass(double arg0) => _delegate.set_mass(arg0);
	B2Vec2 get center => B2Vec2._(_delegate.get_center());
	set center(B2Vec2 arg0) => _delegate.set_center(arg0._delegate);
	double get i => _delegate.get_I();
	set i(double arg0) => _delegate.set_I(arg0);
	void dispose() => _delegate.dispose();
}

class B2Vec2 {

	final B2Vec2Platform _delegate;

	B2Vec2._(B2Vec2Platform delegate) : _delegate = delegate;

	B2Vec2() : _delegate = FlutterBox2DPlatform.instance.b2Vec2_0();

	B2Vec2.from2(double x, double y) : _delegate = FlutterBox2DPlatform.instance.b2Vec2_2(x, y);

	void setZero() => _delegate.setZero();
	void set(double x, double y) => _delegate.set(x, y);
	void op_add(B2Vec2 v) => _delegate.op_add(v._delegate);
	void op_sub(B2Vec2 v) => _delegate.op_sub(v._delegate);
	void op_mul(double s) => _delegate.op_mul(s);
	double length() => _delegate.length();
	double lengthSquared() => _delegate.lengthSquared();
	double normalize() => _delegate.normalize();
	bool isValid() => _delegate.isValid();
	B2Vec2 skew() => B2Vec2._(_delegate.skew());
	double get x => _delegate.get_x();
	set x(double arg0) => _delegate.set_x(arg0);
	double get y => _delegate.get_y();
	set y(double arg0) => _delegate.set_y(arg0);
	void dispose() => _delegate.dispose();
}

class B2Vec3 {

	final B2Vec3Platform _delegate;

	B2Vec3._(B2Vec3Platform delegate) : _delegate = delegate;

	B2Vec3() : _delegate = FlutterBox2DPlatform.instance.b2Vec3_0();

	B2Vec3.from3(double x, double y, double z) : _delegate = FlutterBox2DPlatform.instance.b2Vec3_3(x, y, z);

	void setZero() => _delegate.setZero();
	void set(double x, double y, double z) => _delegate.set(x, y, z);
	void op_add(B2Vec3 v) => _delegate.op_add(v._delegate);
	void op_sub(B2Vec3 v) => _delegate.op_sub(v._delegate);
	void op_mul(double s) => _delegate.op_mul(s);
	double get x => _delegate.get_x();
	set x(double arg0) => _delegate.set_x(arg0);
	double get y => _delegate.get_y();
	set y(double arg0) => _delegate.set_y(arg0);
	double get z => _delegate.get_z();
	set z(double arg0) => _delegate.set_z(arg0);
	void dispose() => _delegate.dispose();
}

class B2BodyUserData {

	final B2BodyUserDataPlatform _delegate;

	B2BodyUserData._(B2BodyUserDataPlatform delegate) : _delegate = delegate;

	int get pointer => _delegate.get_pointer();
	set pointer(int arg0) => _delegate.set_pointer(arg0);
	void dispose() => _delegate.dispose();
}

class B2Body {

	final B2BodyPlatform _delegate;

	B2Body._(B2BodyPlatform delegate) : _delegate = delegate;

	B2Fixture createFixture1(B2FixtureDef shape) => B2Fixture._(_delegate.createFixture1(shape._delegate));
	B2Fixture createFixture2(B2Shape shape, double density) => B2Fixture._(_delegate.createFixture2(shape._delegate, density));
	void destroyFixture(B2Fixture fixture) => _delegate.destroyFixture(fixture._delegate);
	void setTransform(B2Vec2 position, double angle) => _delegate.setTransform(position._delegate, angle);
	B2Transform getTransform() => B2Transform._(_delegate.getTransform());
	B2Vec2 getPosition() => B2Vec2._(_delegate.getPosition());
	double getAngle() => _delegate.getAngle();
	B2Vec2 getWorldCenter() => B2Vec2._(_delegate.getWorldCenter());
	B2Vec2 getLocalCenter() => B2Vec2._(_delegate.getLocalCenter());
	void setLinearVelocity(B2Vec2 v) => _delegate.setLinearVelocity(v._delegate);
	B2Vec2 getLinearVelocity() => B2Vec2._(_delegate.getLinearVelocity());
	void setAngularVelocity(double omega) => _delegate.setAngularVelocity(omega);
	double getAngularVelocity() => _delegate.getAngularVelocity();
	void applyForce(B2Vec2 force, B2Vec2 point, bool wake) => _delegate.applyForce(force._delegate, point._delegate, wake);
	void applyForceToCenter(B2Vec2 force, bool wake) => _delegate.applyForceToCenter(force._delegate, wake);
	void applyTorque(double torque, bool awake) => _delegate.applyTorque(torque, awake);
	void applyLinearImpulse(B2Vec2 impulse, B2Vec2 point, bool wake) => _delegate.applyLinearImpulse(impulse._delegate, point._delegate, wake);
	void applyLinearImpulseToCenter(B2Vec2 impulse, bool wake) => _delegate.applyLinearImpulseToCenter(impulse._delegate, wake);
	void applyAngularImpulse(double impulse, bool wake) => _delegate.applyAngularImpulse(impulse, wake);
	double getMass() => _delegate.getMass();
	double getInertia() => _delegate.getInertia();
	void getMassData(B2MassData data) => _delegate.getMassData(data._delegate);
	void setMassData(B2MassData data) => _delegate.setMassData(data._delegate);
	void resetMassData() => _delegate.resetMassData();
	B2Vec2 getWorldPoint(B2Vec2 localPoint) => B2Vec2._(_delegate.getWorldPoint(localPoint._delegate));
	B2Vec2 getWorldVector(B2Vec2 localVector) => B2Vec2._(_delegate.getWorldVector(localVector._delegate));
	B2Vec2 getLocalPoint(B2Vec2 worldPoint) => B2Vec2._(_delegate.getLocalPoint(worldPoint._delegate));
	B2Vec2 getLocalVector(B2Vec2 worldVector) => B2Vec2._(_delegate.getLocalVector(worldVector._delegate));
	B2Vec2 getLinearVelocityFromWorldPoint(B2Vec2 worldPoint) => B2Vec2._(_delegate.getLinearVelocityFromWorldPoint(worldPoint._delegate));
	B2Vec2 getLinearVelocityFromLocalPoint(B2Vec2 localPoint) => B2Vec2._(_delegate.getLinearVelocityFromLocalPoint(localPoint._delegate));
	double getLinearDamping() => _delegate.getLinearDamping();
	void setLinearDamping(double linearDamping) => _delegate.setLinearDamping(linearDamping);
	double getAngularDamping() => _delegate.getAngularDamping();
	void setAngularDamping(double angularDamping) => _delegate.setAngularDamping(angularDamping);
	double getGravityScale() => _delegate.getGravityScale();
	void setGravityScale(double scale) => _delegate.setGravityScale(scale);
	void setType(B2BodyType type) => _delegate.setType(type);
	B2BodyType getType() => _delegate.getType();
	void setBullet(bool flag) => _delegate.setBullet(flag);
	bool isBullet() => _delegate.isBullet();
	void setSleepingAllowed(bool flag) => _delegate.setSleepingAllowed(flag);
	bool isSleepingAllowed() => _delegate.isSleepingAllowed();
	void setAwake(bool flag) => _delegate.setAwake(flag);
	bool isAwake() => _delegate.isAwake();
	void setEnabled(bool flag) => _delegate.setEnabled(flag);
	bool isEnabled() => _delegate.isEnabled();
	void setFixedRotation(bool flag) => _delegate.setFixedRotation(flag);
	bool isFixedRotation() => _delegate.isFixedRotation();
	B2Fixture getFixtureList() => B2Fixture._(_delegate.getFixtureList());
	B2JointEdge getJointList() => B2JointEdge._(_delegate.getJointList());
	B2ContactEdge getContactList() => B2ContactEdge._(_delegate.getContactList());
	B2Body getNext() => B2Body._(_delegate.getNext());
	B2BodyUserData getUserData() => B2BodyUserData._(_delegate.getUserData());
	B2World getWorld() => B2World._(_delegate.getWorld());
	void dump() => _delegate.dump();
}

class B2BodyDef {

	final B2BodyDefPlatform _delegate;

	B2BodyDef._(B2BodyDefPlatform delegate) : _delegate = delegate;

	B2BodyDef() : _delegate = FlutterBox2DPlatform.instance.b2BodyDef_0();

	B2BodyType get type => _delegate.get_type();
	set type(B2BodyType arg0) => _delegate.set_type(arg0);
	B2Vec2 get position => B2Vec2._(_delegate.get_position());
	set position(B2Vec2 arg0) => _delegate.set_position(arg0._delegate);
	double get angle => _delegate.get_angle();
	set angle(double arg0) => _delegate.set_angle(arg0);
	B2Vec2 get linearVelocity => B2Vec2._(_delegate.get_linearVelocity());
	set linearVelocity(B2Vec2 arg0) => _delegate.set_linearVelocity(arg0._delegate);
	double get angularVelocity => _delegate.get_angularVelocity();
	set angularVelocity(double arg0) => _delegate.set_angularVelocity(arg0);
	double get linearDamping => _delegate.get_linearDamping();
	set linearDamping(double arg0) => _delegate.set_linearDamping(arg0);
	double get angularDamping => _delegate.get_angularDamping();
	set angularDamping(double arg0) => _delegate.set_angularDamping(arg0);
	bool get allowSleep => _delegate.get_allowSleep();
	set allowSleep(bool arg0) => _delegate.set_allowSleep(arg0);
	bool get awake => _delegate.get_awake();
	set awake(bool arg0) => _delegate.set_awake(arg0);
	bool get fixedRotation => _delegate.get_fixedRotation();
	set fixedRotation(bool arg0) => _delegate.set_fixedRotation(arg0);
	bool get bullet => _delegate.get_bullet();
	set bullet(bool arg0) => _delegate.set_bullet(arg0);
	bool get enabled => _delegate.get_enabled();
	set enabled(bool arg0) => _delegate.set_enabled(arg0);
	B2BodyUserData get userData => B2BodyUserData._(_delegate.get_userData());
	set userData(B2BodyUserData arg0) => _delegate.set_userData(arg0._delegate);
	double get gravityScale => _delegate.get_gravityScale();
	set gravityScale(double arg0) => _delegate.set_gravityScale(arg0);
	void dispose() => _delegate.dispose();
}

class B2Filter {

	final B2FilterPlatform _delegate;

	B2Filter._(B2FilterPlatform delegate) : _delegate = delegate;

	B2Filter() : _delegate = FlutterBox2DPlatform.instance.b2Filter_0();

	int get categoryBits => _delegate.get_categoryBits();
	set categoryBits(int arg0) => _delegate.set_categoryBits(arg0);
	int get maskBits => _delegate.get_maskBits();
	set maskBits(int arg0) => _delegate.set_maskBits(arg0);
	int get groupIndex => _delegate.get_groupIndex();
	set groupIndex(int arg0) => _delegate.set_groupIndex(arg0);
	void dispose() => _delegate.dispose();
}

class B2AABB {

	final B2AABBPlatform _delegate;

	B2AABB._(B2AABBPlatform delegate) : _delegate = delegate;

	B2AABB() : _delegate = FlutterBox2DPlatform.instance.b2AABB_0();

	bool isValid() => _delegate.isValid();
	B2Vec2 getCenter() => B2Vec2._(_delegate.getCenter());
	B2Vec2 getExtents() => B2Vec2._(_delegate.getExtents());
	double getPerimeter() => _delegate.getPerimeter();
	void combine1(B2AABB aabb1) => _delegate.combine1(aabb1._delegate);
	void combine2(B2AABB aabb1, B2AABB aabb2) => _delegate.combine2(aabb1._delegate, aabb2._delegate);
	bool contains(B2AABB aabb) => _delegate.contains(aabb._delegate);
	bool rayCast(B2RayCastOutput output, B2RayCastInput input) => _delegate.rayCast(output._delegate, input._delegate);
	B2Vec2 get lowerBound => B2Vec2._(_delegate.get_lowerBound());
	set lowerBound(B2Vec2 arg0) => _delegate.set_lowerBound(arg0._delegate);
	B2Vec2 get upperBound => B2Vec2._(_delegate.get_upperBound());
	set upperBound(B2Vec2 arg0) => _delegate.set_upperBound(arg0._delegate);
	void dispose() => _delegate.dispose();
}

class B2CircleShape {

	final B2CircleShapePlatform _delegate;

	B2CircleShape._(B2CircleShapePlatform delegate) : _delegate = delegate;

	B2CircleShape() : _delegate = FlutterBox2DPlatform.instance.b2CircleShape_0();

	B2ShapeType getType() => _delegate.getType();
	int getChildCount() => _delegate.getChildCount();
	bool testPoint(B2Transform xf, B2Vec2 p) => _delegate.testPoint(xf._delegate, p._delegate);
	bool rayCast(B2RayCastOutput output, B2RayCastInput input, B2Transform transform, int childIndex) => _delegate.rayCast(output._delegate, input._delegate, transform._delegate, childIndex);
	void computeAABB(B2AABB aabb, B2Transform xf, int childIndex) => _delegate.computeAABB(aabb._delegate, xf._delegate, childIndex);
	void computeMass(B2MassData massData, double density) => _delegate.computeMass(massData._delegate, density);
	B2Vec2 get m_p => B2Vec2._(_delegate.get_m_p());
	set m_p(B2Vec2 arg0) => _delegate.set_m_p(arg0._delegate);
	B2ShapeType get m_type => _delegate.get_m_type();
	set m_type(B2ShapeType arg0) => _delegate.set_m_type(arg0);
	double get m_radius => _delegate.get_m_radius();
	set m_radius(double arg0) => _delegate.set_m_radius(arg0);
	void dispose() => _delegate.dispose();
}

class B2EdgeShape {

	final B2EdgeShapePlatform _delegate;

	B2EdgeShape._(B2EdgeShapePlatform delegate) : _delegate = delegate;

	B2EdgeShape() : _delegate = FlutterBox2DPlatform.instance.b2EdgeShape_0();

	void setOneSided(B2Vec2 v0, B2Vec2 v1, B2Vec2 v2, B2Vec2 v3) => _delegate.setOneSided(v0._delegate, v1._delegate, v2._delegate, v3._delegate);
	void setTwoSided(B2Vec2 v1, B2Vec2 v2) => _delegate.setTwoSided(v1._delegate, v2._delegate);
	B2ShapeType getType() => _delegate.getType();
	int getChildCount() => _delegate.getChildCount();
	bool testPoint(B2Transform xf, B2Vec2 p) => _delegate.testPoint(xf._delegate, p._delegate);
	bool rayCast(B2RayCastOutput output, B2RayCastInput input, B2Transform transform, int childIndex) => _delegate.rayCast(output._delegate, input._delegate, transform._delegate, childIndex);
	void computeAABB(B2AABB aabb, B2Transform xf, int childIndex) => _delegate.computeAABB(aabb._delegate, xf._delegate, childIndex);
	void computeMass(B2MassData massData, double density) => _delegate.computeMass(massData._delegate, density);
	B2Vec2 get m_vertex1 => B2Vec2._(_delegate.get_m_vertex1());
	set m_vertex1(B2Vec2 arg0) => _delegate.set_m_vertex1(arg0._delegate);
	B2Vec2 get m_vertex2 => B2Vec2._(_delegate.get_m_vertex2());
	set m_vertex2(B2Vec2 arg0) => _delegate.set_m_vertex2(arg0._delegate);
	B2Vec2 get m_vertex0 => B2Vec2._(_delegate.get_m_vertex0());
	set m_vertex0(B2Vec2 arg0) => _delegate.set_m_vertex0(arg0._delegate);
	B2Vec2 get m_vertex3 => B2Vec2._(_delegate.get_m_vertex3());
	set m_vertex3(B2Vec2 arg0) => _delegate.set_m_vertex3(arg0._delegate);
	bool get m_oneSided => _delegate.get_m_oneSided();
	set m_oneSided(bool arg0) => _delegate.set_m_oneSided(arg0);
	B2ShapeType get m_type => _delegate.get_m_type();
	set m_type(B2ShapeType arg0) => _delegate.set_m_type(arg0);
	double get m_radius => _delegate.get_m_radius();
	set m_radius(double arg0) => _delegate.set_m_radius(arg0);
	void dispose() => _delegate.dispose();
}

class B2JointUserData {

	final B2JointUserDataPlatform _delegate;

	B2JointUserData._(B2JointUserDataPlatform delegate) : _delegate = delegate;

	int get pointer => _delegate.get_pointer();
	set pointer(int arg0) => _delegate.set_pointer(arg0);
	void dispose() => _delegate.dispose();
}

class B2WeldJoint {

	final B2WeldJointPlatform _delegate;

	B2WeldJoint._(B2WeldJointPlatform delegate) : _delegate = delegate;

	B2Vec2 getLocalAnchorA() => B2Vec2._(_delegate.getLocalAnchorA());
	B2Vec2 getLocalAnchorB() => B2Vec2._(_delegate.getLocalAnchorB());
	double getReferenceAngle() => _delegate.getReferenceAngle();
	void setStiffness(double stiffness) => _delegate.setStiffness(stiffness);
	double getStiffness() => _delegate.getStiffness();
	void setDamping(double damping) => _delegate.setDamping(damping);
	double getDamping() => _delegate.getDamping();
	void dump() => _delegate.dump();
	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dispose() => _delegate.dispose();
}

class B2WeldJointDef {

	final B2WeldJointDefPlatform _delegate;

	B2WeldJointDef._(B2WeldJointDefPlatform delegate) : _delegate = delegate;

	B2WeldJointDef() : _delegate = FlutterBox2DPlatform.instance.b2WeldJointDef_0();

	void initialize(B2Body bodyA, B2Body bodyB, B2Vec2 anchor) => _delegate.initialize(bodyA._delegate, bodyB._delegate, anchor._delegate);
	B2Vec2 get localAnchorA => B2Vec2._(_delegate.get_localAnchorA());
	set localAnchorA(B2Vec2 arg0) => _delegate.set_localAnchorA(arg0._delegate);
	B2Vec2 get localAnchorB => B2Vec2._(_delegate.get_localAnchorB());
	set localAnchorB(B2Vec2 arg0) => _delegate.set_localAnchorB(arg0._delegate);
	double get referenceAngle => _delegate.get_referenceAngle();
	set referenceAngle(double arg0) => _delegate.set_referenceAngle(arg0);
	double get stiffness => _delegate.get_stiffness();
	set stiffness(double arg0) => _delegate.set_stiffness(arg0);
	double get damping => _delegate.get_damping();
	set damping(double arg0) => _delegate.set_damping(arg0);
	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2ChainShape {

	final B2ChainShapePlatform _delegate;

	B2ChainShape._(B2ChainShapePlatform delegate) : _delegate = delegate;

	B2ChainShape() : _delegate = FlutterBox2DPlatform.instance.b2ChainShape_0();

	void clear() => _delegate.clear();
	void createLoop(B2Vec2 vertices, int count) => _delegate.createLoop(vertices._delegate, count);
	void createChain(B2Vec2 vertices, int count, B2Vec2 prevVertex, B2Vec2 nextVertex) => _delegate.createChain(vertices._delegate, count, prevVertex._delegate, nextVertex._delegate);
	void getChildEdge(B2EdgeShape edge, int index) => _delegate.getChildEdge(edge._delegate, index);
	B2ShapeType getType() => _delegate.getType();
	int getChildCount() => _delegate.getChildCount();
	bool testPoint(B2Transform xf, B2Vec2 p) => _delegate.testPoint(xf._delegate, p._delegate);
	bool rayCast(B2RayCastOutput output, B2RayCastInput input, B2Transform transform, int childIndex) => _delegate.rayCast(output._delegate, input._delegate, transform._delegate, childIndex);
	void computeAABB(B2AABB aabb, B2Transform xf, int childIndex) => _delegate.computeAABB(aabb._delegate, xf._delegate, childIndex);
	void computeMass(B2MassData massData, double density) => _delegate.computeMass(massData._delegate, density);
	B2Vec2 get m_vertices => B2Vec2._(_delegate.get_m_vertices());
	set m_vertices(B2Vec2 arg0) => _delegate.set_m_vertices(arg0._delegate);
	int get m_count => _delegate.get_m_count();
	set m_count(int arg0) => _delegate.set_m_count(arg0);
	B2Vec2 get m_prevVertex => B2Vec2._(_delegate.get_m_prevVertex());
	set m_prevVertex(B2Vec2 arg0) => _delegate.set_m_prevVertex(arg0._delegate);
	B2Vec2 get m_nextVertex => B2Vec2._(_delegate.get_m_nextVertex());
	set m_nextVertex(B2Vec2 arg0) => _delegate.set_m_nextVertex(arg0._delegate);
	B2ShapeType get m_type => _delegate.get_m_type();
	set m_type(B2ShapeType arg0) => _delegate.set_m_type(arg0);
	double get m_radius => _delegate.get_m_radius();
	set m_radius(double arg0) => _delegate.set_m_radius(arg0);
	void dispose() => _delegate.dispose();
}

class B2Color {

	final B2ColorPlatform _delegate;

	B2Color._(B2ColorPlatform delegate) : _delegate = delegate;

	B2Color() : _delegate = FlutterBox2DPlatform.instance.b2Color_0();

	B2Color.from3(double r, double g, double b) : _delegate = FlutterBox2DPlatform.instance.b2Color_3(r, g, b);

	void set(double ri, double gi, double bi) => _delegate.set(ri, gi, bi);
	double get r => _delegate.get_r();
	set r(double arg0) => _delegate.set_r(arg0);
	double get g => _delegate.get_g();
	set g(double arg0) => _delegate.set_g(arg0);
	double get b => _delegate.get_b();
	set b(double arg0) => _delegate.set_b(arg0);
	void dispose() => _delegate.dispose();
}

class B2ContactEdge {

	final B2ContactEdgePlatform _delegate;

	B2ContactEdge._(B2ContactEdgePlatform delegate) : _delegate = delegate;

	B2ContactEdge() : _delegate = FlutterBox2DPlatform.instance.b2ContactEdge_0();

	B2Body get other => B2Body._(_delegate.get_other());
	set other(B2Body arg0) => _delegate.set_other(arg0._delegate);
	B2Contact get contact => B2Contact._(_delegate.get_contact());
	set contact(B2Contact arg0) => _delegate.set_contact(arg0._delegate);
	B2ContactEdge get prev => B2ContactEdge._(_delegate.get_prev());
	set prev(B2ContactEdge arg0) => _delegate.set_prev(arg0._delegate);
	B2ContactEdge get next => B2ContactEdge._(_delegate.get_next());
	set next(B2ContactEdge arg0) => _delegate.set_next(arg0._delegate);
	void dispose() => _delegate.dispose();
}

class B2ContactFeature {

	final B2ContactFeaturePlatform _delegate;

	B2ContactFeature._(B2ContactFeaturePlatform delegate) : _delegate = delegate;

	int get indexA => _delegate.get_indexA();
	set indexA(int arg0) => _delegate.set_indexA(arg0);
	int get indexB => _delegate.get_indexB();
	set indexB(int arg0) => _delegate.set_indexB(arg0);
	int get typeA => _delegate.get_typeA();
	set typeA(int arg0) => _delegate.set_typeA(arg0);
	int get typeB => _delegate.get_typeB();
	set typeB(int arg0) => _delegate.set_typeB(arg0);
	void dispose() => _delegate.dispose();
}

class B2ContactFilter {

	final B2ContactFilterPlatform _delegate;

	B2ContactFilter._(B2ContactFilterPlatform delegate) : _delegate = delegate;

	void dispose() => _delegate.dispose();
}

class JSContactFilter {

	final JSContactFilterPlatform _delegate;

	JSContactFilter._(JSContactFilterPlatform delegate) : _delegate = delegate;

	JSContactFilter() : _delegate = FlutterBox2DPlatform.instance.JSContactFilter_0();

	bool shouldCollide(B2Fixture fixtureA, B2Fixture fixtureB) => _delegate.shouldCollide(fixtureA._delegate, fixtureB._delegate);
	void dispose() => _delegate.dispose();
}

class B2ContactID {

	final B2ContactIDPlatform _delegate;

	B2ContactID._(B2ContactIDPlatform delegate) : _delegate = delegate;

	B2ContactFeature get cf => B2ContactFeature._(_delegate.get_cf());
	set cf(B2ContactFeature arg0) => _delegate.set_cf(arg0._delegate);
	int get key => _delegate.get_key();
	set key(int arg0) => _delegate.set_key(arg0);
	void dispose() => _delegate.dispose();
}

class B2ContactImpulse {

	final B2ContactImpulsePlatform _delegate;

	B2ContactImpulse._(B2ContactImpulsePlatform delegate) : _delegate = delegate;

	double normalImpulsesElementAt(int arg0) => _delegate.get_normalImpulses(arg0);
	void normalImpulsesInsert(int arg0, double arg1) => _delegate.set_normalImpulses(arg0, arg1);
	double tangentImpulsesElementAt(int arg0) => _delegate.get_tangentImpulses(arg0);
	void tangentImpulsesInsert(int arg0, double arg1) => _delegate.set_tangentImpulses(arg0, arg1);
	int get count => _delegate.get_count();
	set count(int arg0) => _delegate.set_count(arg0);
	void dispose() => _delegate.dispose();
}

class B2DestructionListener {

	final B2DestructionListenerPlatform _delegate;

	B2DestructionListener._(B2DestructionListenerPlatform delegate) : _delegate = delegate;

	void dispose() => _delegate.dispose();
}

class B2DestructionListenerWrapper {

	final B2DestructionListenerWrapperPlatform _delegate;

	B2DestructionListenerWrapper._(B2DestructionListenerWrapperPlatform delegate) : _delegate = delegate;

	void dispose() => _delegate.dispose();
}

class JSDestructionListener {

	final JSDestructionListenerPlatform _delegate;

	JSDestructionListener._(JSDestructionListenerPlatform delegate) : _delegate = delegate;

	JSDestructionListener() : _delegate = FlutterBox2DPlatform.instance.JSDestructionListener_0();

	void sayGoodbyeJoint(B2Joint joint) => _delegate.sayGoodbyeJoint(joint._delegate);
	void sayGoodbyeFixture(B2Fixture joint) => _delegate.sayGoodbyeFixture(joint._delegate);
	void dispose() => _delegate.dispose();
}

class B2DistanceJoint {

	final B2DistanceJointPlatform _delegate;

	B2DistanceJoint._(B2DistanceJointPlatform delegate) : _delegate = delegate;

	B2Vec2 getLocalAnchorA() => B2Vec2._(_delegate.getLocalAnchorA());
	B2Vec2 getLocalAnchorB() => B2Vec2._(_delegate.getLocalAnchorB());
	double getLength() => _delegate.getLength();
	void setLength(double length) => _delegate.setLength(length);
	double getMinLength() => _delegate.getMinLength();
	void setMinLength(double minLength) => _delegate.setMinLength(minLength);
	double getMaxLength() => _delegate.getMaxLength();
	void setMaxLength(double maxLength) => _delegate.setMaxLength(maxLength);
	double getCurrentLength() => _delegate.getCurrentLength();
	void setStiffness(double stiffness) => _delegate.setStiffness(stiffness);
	double getStiffness() => _delegate.getStiffness();
	void setDamping(double damping) => _delegate.setDamping(damping);
	double getDamping() => _delegate.getDamping();
	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dispose() => _delegate.dispose();
}

class B2DistanceJointDef {

	final B2DistanceJointDefPlatform _delegate;

	B2DistanceJointDef._(B2DistanceJointDefPlatform delegate) : _delegate = delegate;

	B2DistanceJointDef() : _delegate = FlutterBox2DPlatform.instance.b2DistanceJointDef_0();

	void initialize(B2Body bodyA, B2Body bodyB, B2Vec2 anchorA, B2Vec2 anchorB) => _delegate.initialize(bodyA._delegate, bodyB._delegate, anchorA._delegate, anchorB._delegate);
	B2Vec2 get localAnchorA => B2Vec2._(_delegate.get_localAnchorA());
	set localAnchorA(B2Vec2 arg0) => _delegate.set_localAnchorA(arg0._delegate);
	B2Vec2 get localAnchorB => B2Vec2._(_delegate.get_localAnchorB());
	set localAnchorB(B2Vec2 arg0) => _delegate.set_localAnchorB(arg0._delegate);
	double get length => _delegate.get_length();
	set length(double arg0) => _delegate.set_length(arg0);
	double get minLength => _delegate.get_minLength();
	set minLength(double arg0) => _delegate.set_minLength(arg0);
	double get maxLength => _delegate.get_maxLength();
	set maxLength(double arg0) => _delegate.set_maxLength(arg0);
	double get stiffness => _delegate.get_stiffness();
	set stiffness(double arg0) => _delegate.set_stiffness(arg0);
	double get damping => _delegate.get_damping();
	set damping(double arg0) => _delegate.set_damping(arg0);
	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2Draw {

	final B2DrawPlatform _delegate;

	B2Draw._(B2DrawPlatform delegate) : _delegate = delegate;

	void setFlags(int flags) => _delegate.setFlags(flags);
	int getFlags() => _delegate.getFlags();
	void appendFlags(int flags) => _delegate.appendFlags(flags);
	void clearFlags(int flags) => _delegate.clearFlags(flags);
	void dispose() => _delegate.dispose();
}

class JSDraw {

	final JSDrawPlatform _delegate;

	JSDraw._(JSDrawPlatform delegate) : _delegate = delegate;

	JSDraw() : _delegate = FlutterBox2DPlatform.instance.JSDraw_0();

	void drawPolygon(B2Vec2 vertices, int vertexCount, B2Color color) => _delegate.drawPolygon(vertices._delegate, vertexCount, color._delegate);
	void drawSolidPolygon(B2Vec2 vertices, int vertexCount, B2Color color) => _delegate.drawSolidPolygon(vertices._delegate, vertexCount, color._delegate);
	void drawCircle(B2Vec2 center, double radius, B2Color color) => _delegate.drawCircle(center._delegate, radius, color._delegate);
	void drawSolidCircle(B2Vec2 center, double radius, B2Vec2 axis, B2Color color) => _delegate.drawSolidCircle(center._delegate, radius, axis._delegate, color._delegate);
	void drawSegment(B2Vec2 p1, B2Vec2 p2, B2Color color) => _delegate.drawSegment(p1._delegate, p2._delegate, color._delegate);
	void drawTransform(B2Transform xf) => _delegate.drawTransform(xf._delegate);
	void drawPoint(B2Vec2 p, double size, B2Color color) => _delegate.drawPoint(p._delegate, size, color._delegate);
	void dispose() => _delegate.dispose();
}

class B2FrictionJoint {

	final B2FrictionJointPlatform _delegate;

	B2FrictionJoint._(B2FrictionJointPlatform delegate) : _delegate = delegate;

	B2Vec2 getLocalAnchorA() => B2Vec2._(_delegate.getLocalAnchorA());
	B2Vec2 getLocalAnchorB() => B2Vec2._(_delegate.getLocalAnchorB());
	void setMaxForce(double force) => _delegate.setMaxForce(force);
	double getMaxForce() => _delegate.getMaxForce();
	void setMaxTorque(double torque) => _delegate.setMaxTorque(torque);
	double getMaxTorque() => _delegate.getMaxTorque();
	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dispose() => _delegate.dispose();
}

class B2FrictionJointDef {

	final B2FrictionJointDefPlatform _delegate;

	B2FrictionJointDef._(B2FrictionJointDefPlatform delegate) : _delegate = delegate;

	B2FrictionJointDef() : _delegate = FlutterBox2DPlatform.instance.b2FrictionJointDef_0();

	void initialize(B2Body bodyA, B2Body bodyB, B2Vec2 anchor) => _delegate.initialize(bodyA._delegate, bodyB._delegate, anchor._delegate);
	B2Vec2 get localAnchorA => B2Vec2._(_delegate.get_localAnchorA());
	set localAnchorA(B2Vec2 arg0) => _delegate.set_localAnchorA(arg0._delegate);
	B2Vec2 get localAnchorB => B2Vec2._(_delegate.get_localAnchorB());
	set localAnchorB(B2Vec2 arg0) => _delegate.set_localAnchorB(arg0._delegate);
	double get maxForce => _delegate.get_maxForce();
	set maxForce(double arg0) => _delegate.set_maxForce(arg0);
	double get maxTorque => _delegate.get_maxTorque();
	set maxTorque(double arg0) => _delegate.set_maxTorque(arg0);
	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2GearJoint {

	final B2GearJointPlatform _delegate;

	B2GearJoint._(B2GearJointPlatform delegate) : _delegate = delegate;

	B2Joint getJoint1() => B2Joint._(_delegate.getJoint1());
	B2Joint getJoint2() => B2Joint._(_delegate.getJoint2());
	void setRatio(double ratio) => _delegate.setRatio(ratio);
	double getRatio() => _delegate.getRatio();
	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dispose() => _delegate.dispose();
}

class B2GearJointDef {

	final B2GearJointDefPlatform _delegate;

	B2GearJointDef._(B2GearJointDefPlatform delegate) : _delegate = delegate;

	B2GearJointDef() : _delegate = FlutterBox2DPlatform.instance.b2GearJointDef_0();

	B2Joint get joint1 => B2Joint._(_delegate.get_joint1());
	set joint1(B2Joint arg0) => _delegate.set_joint1(arg0._delegate);
	B2Joint get joint2 => B2Joint._(_delegate.get_joint2());
	set joint2(B2Joint arg0) => _delegate.set_joint2(arg0._delegate);
	double get ratio => _delegate.get_ratio();
	set ratio(double arg0) => _delegate.set_ratio(arg0);
	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2JointEdge {

	final B2JointEdgePlatform _delegate;

	B2JointEdge._(B2JointEdgePlatform delegate) : _delegate = delegate;

	B2JointEdge() : _delegate = FlutterBox2DPlatform.instance.b2JointEdge_0();

	B2Body get other => B2Body._(_delegate.get_other());
	set other(B2Body arg0) => _delegate.set_other(arg0._delegate);
	B2Joint get joint => B2Joint._(_delegate.get_joint());
	set joint(B2Joint arg0) => _delegate.set_joint(arg0._delegate);
	B2JointEdge get prev => B2JointEdge._(_delegate.get_prev());
	set prev(B2JointEdge arg0) => _delegate.set_prev(arg0._delegate);
	B2JointEdge get next => B2JointEdge._(_delegate.get_next());
	set next(B2JointEdge arg0) => _delegate.set_next(arg0._delegate);
	void dispose() => _delegate.dispose();
}

class B2Manifold {

	final B2ManifoldPlatform _delegate;

	B2Manifold._(B2ManifoldPlatform delegate) : _delegate = delegate;

	B2Manifold() : _delegate = FlutterBox2DPlatform.instance.b2Manifold_0();

	B2ManifoldPoint pointsElementAt(int arg0) => B2ManifoldPoint._(_delegate.get_points(arg0));
	void pointsInsert(int arg0, B2ManifoldPoint arg1) => _delegate.set_points(arg0, arg1._delegate);
	B2Vec2 get localNormal => B2Vec2._(_delegate.get_localNormal());
	set localNormal(B2Vec2 arg0) => _delegate.set_localNormal(arg0._delegate);
	B2Vec2 get localPoint => B2Vec2._(_delegate.get_localPoint());
	set localPoint(B2Vec2 arg0) => _delegate.set_localPoint(arg0._delegate);
	B2ManifoldType get type => _delegate.get_type();
	set type(B2ManifoldType arg0) => _delegate.set_type(arg0);
	int get pointCount => _delegate.get_pointCount();
	set pointCount(int arg0) => _delegate.set_pointCount(arg0);
	void dispose() => _delegate.dispose();
}

class B2WorldManifold {

	final B2WorldManifoldPlatform _delegate;

	B2WorldManifold._(B2WorldManifoldPlatform delegate) : _delegate = delegate;

	B2WorldManifold() : _delegate = FlutterBox2DPlatform.instance.b2WorldManifold_0();

	void initialize(B2Manifold manifold, B2Transform xfA, double radiusA, B2Transform xfB, double radiusB) => _delegate.initialize(manifold._delegate, xfA._delegate, radiusA, xfB._delegate, radiusB);
	B2Vec2 get normal => B2Vec2._(_delegate.get_normal());
	set normal(B2Vec2 arg0) => _delegate.set_normal(arg0._delegate);
	B2Vec2 pointsElementAt(int arg0) => B2Vec2._(_delegate.get_points(arg0));
	void pointsInsert(int arg0, B2Vec2 arg1) => _delegate.set_points(arg0, arg1._delegate);
	double separationsElementAt(int arg0) => _delegate.get_separations(arg0);
	void separationsInsert(int arg0, double arg1) => _delegate.set_separations(arg0, arg1);
	void dispose() => _delegate.dispose();
}

class B2ManifoldPoint {

	final B2ManifoldPointPlatform _delegate;

	B2ManifoldPoint._(B2ManifoldPointPlatform delegate) : _delegate = delegate;

	B2ManifoldPoint() : _delegate = FlutterBox2DPlatform.instance.b2ManifoldPoint_0();

	B2Vec2 get localPoint => B2Vec2._(_delegate.get_localPoint());
	set localPoint(B2Vec2 arg0) => _delegate.set_localPoint(arg0._delegate);
	double get normalImpulse => _delegate.get_normalImpulse();
	set normalImpulse(double arg0) => _delegate.set_normalImpulse(arg0);
	double get tangentImpulse => _delegate.get_tangentImpulse();
	set tangentImpulse(double arg0) => _delegate.set_tangentImpulse(arg0);
	B2ContactID get id => B2ContactID._(_delegate.get_id());
	set id(B2ContactID arg0) => _delegate.set_id(arg0._delegate);
	void dispose() => _delegate.dispose();
}

class B2Mat22 {

	final B2Mat22Platform _delegate;

	B2Mat22._(B2Mat22Platform delegate) : _delegate = delegate;

	B2Mat22() : _delegate = FlutterBox2DPlatform.instance.b2Mat22_0();

	B2Mat22.from2(B2Vec2 a11, B2Vec2 a12) : _delegate = FlutterBox2DPlatform.instance.b2Mat22_2(a11._delegate, a12._delegate);

	B2Mat22.from4(double a11, double a12, double a21, double a22) : _delegate = FlutterBox2DPlatform.instance.b2Mat22_4(a11, a12, a21, a22);

	void set(B2Vec2 c1, B2Vec2 c2) => _delegate.set(c1._delegate, c2._delegate);
	void setIdentity() => _delegate.setIdentity();
	void setZero() => _delegate.setZero();
	B2Mat22 getInverse() => B2Mat22._(_delegate.getInverse());
	B2Vec2 solve(B2Vec2 b) => B2Vec2._(_delegate.solve(b._delegate));
	B2Vec2 get ex => B2Vec2._(_delegate.get_ex());
	set ex(B2Vec2 arg0) => _delegate.set_ex(arg0._delegate);
	B2Vec2 get ey => B2Vec2._(_delegate.get_ey());
	set ey(B2Vec2 arg0) => _delegate.set_ey(arg0._delegate);
	void dispose() => _delegate.dispose();
}

class B2Mat33 {

	final B2Mat33Platform _delegate;

	B2Mat33._(B2Mat33Platform delegate) : _delegate = delegate;

	B2Mat33() : _delegate = FlutterBox2DPlatform.instance.b2Mat33_0();

	B2Mat33.from3(B2Vec3 c1, B2Vec3 c2, B2Vec3 c3) : _delegate = FlutterBox2DPlatform.instance.b2Mat33_3(c1._delegate, c2._delegate, c3._delegate);

	void setZero() => _delegate.setZero();
	B2Vec3 solve33(B2Vec3 b) => B2Vec3._(_delegate.solve33(b._delegate));
	B2Vec2 solve22(B2Vec2 b) => B2Vec2._(_delegate.solve22(b._delegate));
	void getInverse22(B2Mat33 M) => _delegate.getInverse22(M._delegate);
	void getSymInverse33(B2Mat33 M) => _delegate.getSymInverse33(M._delegate);
	B2Vec3 get ex => B2Vec3._(_delegate.get_ex());
	set ex(B2Vec3 arg0) => _delegate.set_ex(arg0._delegate);
	B2Vec3 get ey => B2Vec3._(_delegate.get_ey());
	set ey(B2Vec3 arg0) => _delegate.set_ey(arg0._delegate);
	B2Vec3 get ez => B2Vec3._(_delegate.get_ez());
	set ez(B2Vec3 arg0) => _delegate.set_ez(arg0._delegate);
	void dispose() => _delegate.dispose();
}

class B2MouseJoint {

	final B2MouseJointPlatform _delegate;

	B2MouseJoint._(B2MouseJointPlatform delegate) : _delegate = delegate;

	void setTarget(B2Vec2 target) => _delegate.setTarget(target._delegate);
	B2Vec2 getTarget() => B2Vec2._(_delegate.getTarget());
	void setMaxForce(double force) => _delegate.setMaxForce(force);
	double getMaxForce() => _delegate.getMaxForce();
	void setStiffness(double stiffness) => _delegate.setStiffness(stiffness);
	double getStiffness() => _delegate.getStiffness();
	void setDamping(double damping) => _delegate.setDamping(damping);
	double getDamping() => _delegate.getDamping();
	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dispose() => _delegate.dispose();
}

class B2MouseJointDef {

	final B2MouseJointDefPlatform _delegate;

	B2MouseJointDef._(B2MouseJointDefPlatform delegate) : _delegate = delegate;

	B2MouseJointDef() : _delegate = FlutterBox2DPlatform.instance.b2MouseJointDef_0();

	B2Vec2 get target => B2Vec2._(_delegate.get_target());
	set target(B2Vec2 arg0) => _delegate.set_target(arg0._delegate);
	double get maxForce => _delegate.get_maxForce();
	set maxForce(double arg0) => _delegate.set_maxForce(arg0);
	double get stiffness => _delegate.get_stiffness();
	set stiffness(double arg0) => _delegate.set_stiffness(arg0);
	double get damping => _delegate.get_damping();
	set damping(double arg0) => _delegate.set_damping(arg0);
	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2PolygonShape {

	final B2PolygonShapePlatform _delegate;

	B2PolygonShape._(B2PolygonShapePlatform delegate) : _delegate = delegate;

	B2PolygonShape() : _delegate = FlutterBox2DPlatform.instance.b2PolygonShape_0();

	void set(B2Vec2 vertices, int vertexCount) => _delegate.set(vertices._delegate, vertexCount);
	void setAsBox2(double hx, double hy) => _delegate.setAsBox2(hx, hy);
	void setAsBox4(double hx, double hy, B2Vec2 center, double angle) => _delegate.setAsBox4(hx, hy, center._delegate, angle);
	B2ShapeType getType() => _delegate.getType();
	int getChildCount() => _delegate.getChildCount();
	bool testPoint(B2Transform xf, B2Vec2 p) => _delegate.testPoint(xf._delegate, p._delegate);
	bool rayCast(B2RayCastOutput output, B2RayCastInput input, B2Transform transform, int childIndex) => _delegate.rayCast(output._delegate, input._delegate, transform._delegate, childIndex);
	void computeAABB(B2AABB aabb, B2Transform xf, int childIndex) => _delegate.computeAABB(aabb._delegate, xf._delegate, childIndex);
	void computeMass(B2MassData massData, double density) => _delegate.computeMass(massData._delegate, density);
	B2Vec2 get m_centroid => B2Vec2._(_delegate.get_m_centroid());
	set m_centroid(B2Vec2 arg0) => _delegate.set_m_centroid(arg0._delegate);
	B2Vec2 m_verticesElementAt(int arg0) => B2Vec2._(_delegate.get_m_vertices(arg0));
	void m_verticesInsert(int arg0, B2Vec2 arg1) => _delegate.set_m_vertices(arg0, arg1._delegate);
	B2Vec2 m_normalsElementAt(int arg0) => B2Vec2._(_delegate.get_m_normals(arg0));
	void m_normalsInsert(int arg0, B2Vec2 arg1) => _delegate.set_m_normals(arg0, arg1._delegate);
	int get m_count => _delegate.get_m_count();
	set m_count(int arg0) => _delegate.set_m_count(arg0);
	B2ShapeType get m_type => _delegate.get_m_type();
	set m_type(B2ShapeType arg0) => _delegate.set_m_type(arg0);
	double get m_radius => _delegate.get_m_radius();
	set m_radius(double arg0) => _delegate.set_m_radius(arg0);
	void dispose() => _delegate.dispose();
}

class B2PrismaticJoint {

	final B2PrismaticJointPlatform _delegate;

	B2PrismaticJoint._(B2PrismaticJointPlatform delegate) : _delegate = delegate;

	B2Vec2 getLocalAnchorA() => B2Vec2._(_delegate.getLocalAnchorA());
	B2Vec2 getLocalAnchorB() => B2Vec2._(_delegate.getLocalAnchorB());
	B2Vec2 getLocalAxisA() => B2Vec2._(_delegate.getLocalAxisA());
	double getReferenceAngle() => _delegate.getReferenceAngle();
	double getJointTranslation() => _delegate.getJointTranslation();
	double getJointSpeed() => _delegate.getJointSpeed();
	bool isLimitEnabled() => _delegate.isLimitEnabled();
	void enableLimit(bool flag) => _delegate.enableLimit(flag);
	double getLowerLimit() => _delegate.getLowerLimit();
	double getUpperLimit() => _delegate.getUpperLimit();
	void setLimits(double lower, double upper) => _delegate.setLimits(lower, upper);
	bool isMotorEnabled() => _delegate.isMotorEnabled();
	void enableMotor(bool flag) => _delegate.enableMotor(flag);
	void setMotorSpeed(double speed) => _delegate.setMotorSpeed(speed);
	double getMotorSpeed() => _delegate.getMotorSpeed();
	void setMaxMotorForce(double force) => _delegate.setMaxMotorForce(force);
	double getMaxMotorForce() => _delegate.getMaxMotorForce();
	double getMotorForce(double inv_dt) => _delegate.getMotorForce(inv_dt);
	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dispose() => _delegate.dispose();
}

class B2PrismaticJointDef {

	final B2PrismaticJointDefPlatform _delegate;

	B2PrismaticJointDef._(B2PrismaticJointDefPlatform delegate) : _delegate = delegate;

	B2PrismaticJointDef() : _delegate = FlutterBox2DPlatform.instance.b2PrismaticJointDef_0();

	void initialize(B2Body bodyA, B2Body bodyB, B2Vec2 anchor, B2Vec2 axis) => _delegate.initialize(bodyA._delegate, bodyB._delegate, anchor._delegate, axis._delegate);
	B2Vec2 get localAnchorA => B2Vec2._(_delegate.get_localAnchorA());
	set localAnchorA(B2Vec2 arg0) => _delegate.set_localAnchorA(arg0._delegate);
	B2Vec2 get localAnchorB => B2Vec2._(_delegate.get_localAnchorB());
	set localAnchorB(B2Vec2 arg0) => _delegate.set_localAnchorB(arg0._delegate);
	B2Vec2 get localAxisA => B2Vec2._(_delegate.get_localAxisA());
	set localAxisA(B2Vec2 arg0) => _delegate.set_localAxisA(arg0._delegate);
	double get referenceAngle => _delegate.get_referenceAngle();
	set referenceAngle(double arg0) => _delegate.set_referenceAngle(arg0);
	bool get enableLimit => _delegate.get_enableLimit();
	set enableLimit(bool arg0) => _delegate.set_enableLimit(arg0);
	double get lowerTranslation => _delegate.get_lowerTranslation();
	set lowerTranslation(double arg0) => _delegate.set_lowerTranslation(arg0);
	double get upperTranslation => _delegate.get_upperTranslation();
	set upperTranslation(double arg0) => _delegate.set_upperTranslation(arg0);
	bool get enableMotor => _delegate.get_enableMotor();
	set enableMotor(bool arg0) => _delegate.set_enableMotor(arg0);
	double get maxMotorForce => _delegate.get_maxMotorForce();
	set maxMotorForce(double arg0) => _delegate.set_maxMotorForce(arg0);
	double get motorSpeed => _delegate.get_motorSpeed();
	set motorSpeed(double arg0) => _delegate.set_motorSpeed(arg0);
	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2Profile {

	final B2ProfilePlatform _delegate;

	B2Profile._(B2ProfilePlatform delegate) : _delegate = delegate;

	double get step => _delegate.get_step();
	set step(double arg0) => _delegate.set_step(arg0);
	double get collide => _delegate.get_collide();
	set collide(double arg0) => _delegate.set_collide(arg0);
	double get solve => _delegate.get_solve();
	set solve(double arg0) => _delegate.set_solve(arg0);
	double get solveInit => _delegate.get_solveInit();
	set solveInit(double arg0) => _delegate.set_solveInit(arg0);
	double get solveVelocity => _delegate.get_solveVelocity();
	set solveVelocity(double arg0) => _delegate.set_solveVelocity(arg0);
	double get solvePosition => _delegate.get_solvePosition();
	set solvePosition(double arg0) => _delegate.set_solvePosition(arg0);
	double get broadphase => _delegate.get_broadphase();
	set broadphase(double arg0) => _delegate.set_broadphase(arg0);
	double get solveTOI => _delegate.get_solveTOI();
	set solveTOI(double arg0) => _delegate.set_solveTOI(arg0);
	void dispose() => _delegate.dispose();
}

class B2PulleyJoint {

	final B2PulleyJointPlatform _delegate;

	B2PulleyJoint._(B2PulleyJointPlatform delegate) : _delegate = delegate;

	B2Vec2 getGroundAnchorA() => B2Vec2._(_delegate.getGroundAnchorA());
	B2Vec2 getGroundAnchorB() => B2Vec2._(_delegate.getGroundAnchorB());
	double getLengthA() => _delegate.getLengthA();
	double getLengthB() => _delegate.getLengthB();
	double getRatio() => _delegate.getRatio();
	double getCurrentLengthA() => _delegate.getCurrentLengthA();
	double getCurrentLengthB() => _delegate.getCurrentLengthB();
	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dispose() => _delegate.dispose();
}

class B2PulleyJointDef {

	final B2PulleyJointDefPlatform _delegate;

	B2PulleyJointDef._(B2PulleyJointDefPlatform delegate) : _delegate = delegate;

	B2PulleyJointDef() : _delegate = FlutterBox2DPlatform.instance.b2PulleyJointDef_0();

	void initialize(B2Body bodyA, B2Body bodyB, B2Vec2 groundAnchorA, B2Vec2 groundAnchorB, B2Vec2 anchorA, B2Vec2 anchorB, double ratio) => _delegate.initialize(bodyA._delegate, bodyB._delegate, groundAnchorA._delegate, groundAnchorB._delegate, anchorA._delegate, anchorB._delegate, ratio);
	B2Vec2 get groundAnchorA => B2Vec2._(_delegate.get_groundAnchorA());
	set groundAnchorA(B2Vec2 arg0) => _delegate.set_groundAnchorA(arg0._delegate);
	B2Vec2 get groundAnchorB => B2Vec2._(_delegate.get_groundAnchorB());
	set groundAnchorB(B2Vec2 arg0) => _delegate.set_groundAnchorB(arg0._delegate);
	B2Vec2 get localAnchorA => B2Vec2._(_delegate.get_localAnchorA());
	set localAnchorA(B2Vec2 arg0) => _delegate.set_localAnchorA(arg0._delegate);
	B2Vec2 get localAnchorB => B2Vec2._(_delegate.get_localAnchorB());
	set localAnchorB(B2Vec2 arg0) => _delegate.set_localAnchorB(arg0._delegate);
	double get lengthA => _delegate.get_lengthA();
	set lengthA(double arg0) => _delegate.set_lengthA(arg0);
	double get lengthB => _delegate.get_lengthB();
	set lengthB(double arg0) => _delegate.set_lengthB(arg0);
	double get ratio => _delegate.get_ratio();
	set ratio(double arg0) => _delegate.set_ratio(arg0);
	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2RayCastInput {

	final B2RayCastInputPlatform _delegate;

	B2RayCastInput._(B2RayCastInputPlatform delegate) : _delegate = delegate;

	B2Vec2 get p1 => B2Vec2._(_delegate.get_p1());
	set p1(B2Vec2 arg0) => _delegate.set_p1(arg0._delegate);
	B2Vec2 get p2 => B2Vec2._(_delegate.get_p2());
	set p2(B2Vec2 arg0) => _delegate.set_p2(arg0._delegate);
	double get maxFraction => _delegate.get_maxFraction();
	set maxFraction(double arg0) => _delegate.set_maxFraction(arg0);
	void dispose() => _delegate.dispose();
}

class B2RayCastOutput {

	final B2RayCastOutputPlatform _delegate;

	B2RayCastOutput._(B2RayCastOutputPlatform delegate) : _delegate = delegate;

	B2Vec2 get normal => B2Vec2._(_delegate.get_normal());
	set normal(B2Vec2 arg0) => _delegate.set_normal(arg0._delegate);
	double get fraction => _delegate.get_fraction();
	set fraction(double arg0) => _delegate.set_fraction(arg0);
	void dispose() => _delegate.dispose();
}

class B2RevoluteJoint {

	final B2RevoluteJointPlatform _delegate;

	B2RevoluteJoint._(B2RevoluteJointPlatform delegate) : _delegate = delegate;

	B2Vec2 getLocalAnchorA() => B2Vec2._(_delegate.getLocalAnchorA());
	B2Vec2 getLocalAnchorB() => B2Vec2._(_delegate.getLocalAnchorB());
	double getReferenceAngle() => _delegate.getReferenceAngle();
	double getJointAngle() => _delegate.getJointAngle();
	double getJointSpeed() => _delegate.getJointSpeed();
	bool isLimitEnabled() => _delegate.isLimitEnabled();
	void enableLimit(bool flag) => _delegate.enableLimit(flag);
	double getLowerLimit() => _delegate.getLowerLimit();
	double getUpperLimit() => _delegate.getUpperLimit();
	void setLimits(double lower, double upper) => _delegate.setLimits(lower, upper);
	bool isMotorEnabled() => _delegate.isMotorEnabled();
	void enableMotor(bool flag) => _delegate.enableMotor(flag);
	void setMotorSpeed(double speed) => _delegate.setMotorSpeed(speed);
	double getMotorSpeed() => _delegate.getMotorSpeed();
	void setMaxMotorTorque(double torque) => _delegate.setMaxMotorTorque(torque);
	double getMaxMotorTorque() => _delegate.getMaxMotorTorque();
	double getMotorTorque(double inv_dt) => _delegate.getMotorTorque(inv_dt);
	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dispose() => _delegate.dispose();
}

class B2RevoluteJointDef {

	final B2RevoluteJointDefPlatform _delegate;

	B2RevoluteJointDef._(B2RevoluteJointDefPlatform delegate) : _delegate = delegate;

	B2RevoluteJointDef() : _delegate = FlutterBox2DPlatform.instance.b2RevoluteJointDef_0();

	void initialize(B2Body bodyA, B2Body bodyB, B2Vec2 anchor) => _delegate.initialize(bodyA._delegate, bodyB._delegate, anchor._delegate);
	B2Vec2 get localAnchorA => B2Vec2._(_delegate.get_localAnchorA());
	set localAnchorA(B2Vec2 arg0) => _delegate.set_localAnchorA(arg0._delegate);
	B2Vec2 get localAnchorB => B2Vec2._(_delegate.get_localAnchorB());
	set localAnchorB(B2Vec2 arg0) => _delegate.set_localAnchorB(arg0._delegate);
	double get referenceAngle => _delegate.get_referenceAngle();
	set referenceAngle(double arg0) => _delegate.set_referenceAngle(arg0);
	bool get enableLimit => _delegate.get_enableLimit();
	set enableLimit(bool arg0) => _delegate.set_enableLimit(arg0);
	double get lowerAngle => _delegate.get_lowerAngle();
	set lowerAngle(double arg0) => _delegate.set_lowerAngle(arg0);
	double get upperAngle => _delegate.get_upperAngle();
	set upperAngle(double arg0) => _delegate.set_upperAngle(arg0);
	bool get enableMotor => _delegate.get_enableMotor();
	set enableMotor(bool arg0) => _delegate.set_enableMotor(arg0);
	double get motorSpeed => _delegate.get_motorSpeed();
	set motorSpeed(double arg0) => _delegate.set_motorSpeed(arg0);
	double get maxMotorTorque => _delegate.get_maxMotorTorque();
	set maxMotorTorque(double arg0) => _delegate.set_maxMotorTorque(arg0);
	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2Rot {

	final B2RotPlatform _delegate;

	B2Rot._(B2RotPlatform delegate) : _delegate = delegate;

	B2Rot() : _delegate = FlutterBox2DPlatform.instance.b2Rot_0();

	B2Rot.from1(double angle) : _delegate = FlutterBox2DPlatform.instance.b2Rot_1(angle);

	void set(double angle) => _delegate.set(angle);
	void setIdentity() => _delegate.setIdentity();
	double getAngle() => _delegate.getAngle();
	B2Vec2 getXAxis() => B2Vec2._(_delegate.getXAxis());
	B2Vec2 getYAxis() => B2Vec2._(_delegate.getYAxis());
	double get s => _delegate.get_s();
	set s(double arg0) => _delegate.set_s(arg0);
	double get c => _delegate.get_c();
	set c(double arg0) => _delegate.set_c(arg0);
	void dispose() => _delegate.dispose();
}

class B2WheelJoint {

	final B2WheelJointPlatform _delegate;

	B2WheelJoint._(B2WheelJointPlatform delegate) : _delegate = delegate;

	B2Vec2 getLocalAnchorA() => B2Vec2._(_delegate.getLocalAnchorA());
	B2Vec2 getLocalAnchorB() => B2Vec2._(_delegate.getLocalAnchorB());
	B2Vec2 getLocalAxisA() => B2Vec2._(_delegate.getLocalAxisA());
	double getJointTranslation() => _delegate.getJointTranslation();
	double getJointLinearSpeed() => _delegate.getJointLinearSpeed();
	double getJointAngle() => _delegate.getJointAngle();
	double getJointAngularSpeed() => _delegate.getJointAngularSpeed();
	bool isLimitEnabled() => _delegate.isLimitEnabled();
	void enableLimit(bool flag) => _delegate.enableLimit(flag);
	double getLowerLimit() => _delegate.getLowerLimit();
	double getUpperLimit() => _delegate.getUpperLimit();
	void setLimits(double lower, double upper) => _delegate.setLimits(lower, upper);
	bool isMotorEnabled() => _delegate.isMotorEnabled();
	void enableMotor(bool flag) => _delegate.enableMotor(flag);
	void setMotorSpeed(double speed) => _delegate.setMotorSpeed(speed);
	double getMotorSpeed() => _delegate.getMotorSpeed();
	void setMaxMotorTorque(double torque) => _delegate.setMaxMotorTorque(torque);
	double getMaxMotorTorque() => _delegate.getMaxMotorTorque();
	double getMotorTorque(double inv_dt) => _delegate.getMotorTorque(inv_dt);
	void setStiffness(double stiffness) => _delegate.setStiffness(stiffness);
	double getStiffness() => _delegate.getStiffness();
	void setDamping(double damping) => _delegate.setDamping(damping);
	double getDamping() => _delegate.getDamping();
	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dispose() => _delegate.dispose();
}

class B2WheelJointDef {

	final B2WheelJointDefPlatform _delegate;

	B2WheelJointDef._(B2WheelJointDefPlatform delegate) : _delegate = delegate;

	B2WheelJointDef() : _delegate = FlutterBox2DPlatform.instance.b2WheelJointDef_0();

	void initialize(B2Body bodyA, B2Body bodyB, B2Vec2 anchor, B2Vec2 axis) => _delegate.initialize(bodyA._delegate, bodyB._delegate, anchor._delegate, axis._delegate);
	B2Vec2 get localAnchorA => B2Vec2._(_delegate.get_localAnchorA());
	set localAnchorA(B2Vec2 arg0) => _delegate.set_localAnchorA(arg0._delegate);
	B2Vec2 get localAnchorB => B2Vec2._(_delegate.get_localAnchorB());
	set localAnchorB(B2Vec2 arg0) => _delegate.set_localAnchorB(arg0._delegate);
	B2Vec2 get localAxisA => B2Vec2._(_delegate.get_localAxisA());
	set localAxisA(B2Vec2 arg0) => _delegate.set_localAxisA(arg0._delegate);
	bool get enableLimit => _delegate.get_enableLimit();
	set enableLimit(bool arg0) => _delegate.set_enableLimit(arg0);
	double get lowerTranslation => _delegate.get_lowerTranslation();
	set lowerTranslation(double arg0) => _delegate.set_lowerTranslation(arg0);
	double get upperTranslation => _delegate.get_upperTranslation();
	set upperTranslation(double arg0) => _delegate.set_upperTranslation(arg0);
	bool get enableMotor => _delegate.get_enableMotor();
	set enableMotor(bool arg0) => _delegate.set_enableMotor(arg0);
	double get maxMotorTorque => _delegate.get_maxMotorTorque();
	set maxMotorTorque(double arg0) => _delegate.set_maxMotorTorque(arg0);
	double get motorSpeed => _delegate.get_motorSpeed();
	set motorSpeed(double arg0) => _delegate.set_motorSpeed(arg0);
	double get stiffness => _delegate.get_stiffness();
	set stiffness(double arg0) => _delegate.set_stiffness(arg0);
	double get damping => _delegate.get_damping();
	set damping(double arg0) => _delegate.set_damping(arg0);
	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2MotorJoint {

	final B2MotorJointPlatform _delegate;

	B2MotorJoint._(B2MotorJointPlatform delegate) : _delegate = delegate;

	void setLinearOffset(B2Vec2 linearOffset) => _delegate.setLinearOffset(linearOffset._delegate);
	B2Vec2 getLinearOffset() => B2Vec2._(_delegate.getLinearOffset());
	void setAngularOffset(double angularOffset) => _delegate.setAngularOffset(angularOffset);
	double getAngularOffset() => _delegate.getAngularOffset();
	void setMaxForce(double force) => _delegate.setMaxForce(force);
	double getMaxForce() => _delegate.getMaxForce();
	void setMaxTorque(double torque) => _delegate.setMaxTorque(torque);
	double getMaxTorque() => _delegate.getMaxTorque();
	void setCorrectionFactor(double factor) => _delegate.setCorrectionFactor(factor);
	double getCorrectionFactor() => _delegate.getCorrectionFactor();
	B2JointType getType() => _delegate.getType();
	B2Body getBodyA() => B2Body._(_delegate.getBodyA());
	B2Body getBodyB() => B2Body._(_delegate.getBodyB());
	B2Vec2 getAnchorA() => B2Vec2._(_delegate.getAnchorA());
	B2Vec2 getAnchorB() => B2Vec2._(_delegate.getAnchorB());
	B2Vec2 getReactionForce(double inv_dt) => B2Vec2._(_delegate.getReactionForce(inv_dt));
	double getReactionTorque(double inv_dt) => _delegate.getReactionTorque(inv_dt);
	B2Joint getNext() => B2Joint._(_delegate.getNext());
	B2JointUserData getUserData() => B2JointUserData._(_delegate.getUserData());
	bool getCollideConnected() => _delegate.getCollideConnected();
	void dispose() => _delegate.dispose();
}

class B2MotorJointDef {

	final B2MotorJointDefPlatform _delegate;

	B2MotorJointDef._(B2MotorJointDefPlatform delegate) : _delegate = delegate;

	B2MotorJointDef() : _delegate = FlutterBox2DPlatform.instance.b2MotorJointDef_0();

	void initialize(B2Body bodyA, B2Body bodyB) => _delegate.initialize(bodyA._delegate, bodyB._delegate);
	B2Vec2 get linearOffset => B2Vec2._(_delegate.get_linearOffset());
	set linearOffset(B2Vec2 arg0) => _delegate.set_linearOffset(arg0._delegate);
	double get angularOffset => _delegate.get_angularOffset();
	set angularOffset(double arg0) => _delegate.set_angularOffset(arg0);
	double get maxForce => _delegate.get_maxForce();
	set maxForce(double arg0) => _delegate.set_maxForce(arg0);
	double get maxTorque => _delegate.get_maxTorque();
	set maxTorque(double arg0) => _delegate.set_maxTorque(arg0);
	double get correctionFactor => _delegate.get_correctionFactor();
	set correctionFactor(double arg0) => _delegate.set_correctionFactor(arg0);
	B2JointType get type => _delegate.get_type();
	set type(B2JointType arg0) => _delegate.set_type(arg0);
	B2JointUserData get userData => B2JointUserData._(_delegate.get_userData());
	set userData(B2JointUserData arg0) => _delegate.set_userData(arg0._delegate);
	B2Body get bodyA => B2Body._(_delegate.get_bodyA());
	set bodyA(B2Body arg0) => _delegate.set_bodyA(arg0._delegate);
	B2Body get bodyB => B2Body._(_delegate.get_bodyB());
	set bodyB(B2Body arg0) => _delegate.set_bodyB(arg0._delegate);
	bool get collideConnected => _delegate.get_collideConnected();
	set collideConnected(bool arg0) => _delegate.set_collideConnected(arg0);
	void dispose() => _delegate.dispose();
}

class B2RopeTuning {

	final B2RopeTuningPlatform _delegate;

	B2RopeTuning._(B2RopeTuningPlatform delegate) : _delegate = delegate;

	B2RopeTuning() : _delegate = FlutterBox2DPlatform.instance.b2RopeTuning_0();

	B2StretchingModel get stretchingModel => _delegate.get_stretchingModel();
	set stretchingModel(B2StretchingModel arg0) => _delegate.set_stretchingModel(arg0);
	B2BendingModel get bendingModel => _delegate.get_bendingModel();
	set bendingModel(B2BendingModel arg0) => _delegate.set_bendingModel(arg0);
	double get damping => _delegate.get_damping();
	set damping(double arg0) => _delegate.set_damping(arg0);
	double get stretchStiffness => _delegate.get_stretchStiffness();
	set stretchStiffness(double arg0) => _delegate.set_stretchStiffness(arg0);
	double get stretchHertz => _delegate.get_stretchHertz();
	set stretchHertz(double arg0) => _delegate.set_stretchHertz(arg0);
	double get stretchDamping => _delegate.get_stretchDamping();
	set stretchDamping(double arg0) => _delegate.set_stretchDamping(arg0);
	double get bendStiffness => _delegate.get_bendStiffness();
	set bendStiffness(double arg0) => _delegate.set_bendStiffness(arg0);
	double get bendHertz => _delegate.get_bendHertz();
	set bendHertz(double arg0) => _delegate.set_bendHertz(arg0);
	double get bendDamping => _delegate.get_bendDamping();
	set bendDamping(double arg0) => _delegate.set_bendDamping(arg0);
	bool get isometric => _delegate.get_isometric();
	set isometric(bool arg0) => _delegate.set_isometric(arg0);
	bool get fixedEffectiveMass => _delegate.get_fixedEffectiveMass();
	set fixedEffectiveMass(bool arg0) => _delegate.set_fixedEffectiveMass(arg0);
	bool get warmStart => _delegate.get_warmStart();
	set warmStart(bool arg0) => _delegate.set_warmStart(arg0);
	void dispose() => _delegate.dispose();
}

class B2RopeDef {

	final B2RopeDefPlatform _delegate;

	B2RopeDef._(B2RopeDefPlatform delegate) : _delegate = delegate;

	B2RopeDef() : _delegate = FlutterBox2DPlatform.instance.b2RopeDef_0();

	B2Vec2 get position => B2Vec2._(_delegate.get_position());
	set position(B2Vec2 arg0) => _delegate.set_position(arg0._delegate);
	B2Vec2 get vertices => B2Vec2._(_delegate.get_vertices());
	set vertices(B2Vec2 arg0) => _delegate.set_vertices(arg0._delegate);
	int get count => _delegate.get_count();
	set count(int arg0) => _delegate.set_count(arg0);
	B2Vec2 get gravity => B2Vec2._(_delegate.get_gravity());
	set gravity(B2Vec2 arg0) => _delegate.set_gravity(arg0._delegate);
	B2RopeTuning get tuning => B2RopeTuning._(_delegate.get_tuning());
	set tuning(B2RopeTuning arg0) => _delegate.set_tuning(arg0._delegate);
	void dispose() => _delegate.dispose();
}

class B2Rope {

	final B2RopePlatform _delegate;

	B2Rope._(B2RopePlatform delegate) : _delegate = delegate;

	B2Rope() : _delegate = FlutterBox2DPlatform.instance.b2Rope_0();

	void create(B2RopeDef def) => _delegate.create(def._delegate);
	void setTuning(B2RopeTuning tuning) => _delegate.setTuning(tuning._delegate);
	void step(double timeStep, int iterations, B2Vec2 position) => _delegate.step(timeStep, iterations, position._delegate);
	void reset(B2Vec2 position) => _delegate.reset(position._delegate);
	//void draw(B2Draw draw) => _delegate.draw(draw._delegate);
	void dispose() => _delegate.dispose();
}

class B2ClipVertex {

	final B2ClipVertexPlatform _delegate;

	B2ClipVertex._(B2ClipVertexPlatform delegate) : _delegate = delegate;

	B2ClipVertex() : _delegate = FlutterBox2DPlatform.instance.b2ClipVertex_0();

	B2Vec2 get v => B2Vec2._(_delegate.get_v());
	set v(B2Vec2 arg0) => _delegate.set_v(arg0._delegate);
	B2ContactID get id => B2ContactID._(_delegate.get_id());
	set id(B2ContactID arg0) => _delegate.set_id(arg0._delegate);
	void dispose() => _delegate.dispose();
}

