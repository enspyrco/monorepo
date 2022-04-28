@JS()
library box2d;

import 'package:js/js.dart';

import 'b2_delegates.dart';

class B2WorldJSAdapter implements B2WorldPlatform {

	B2WorldJSAdapter._(B2WorldJSImpl impl) : _impl = impl;

	final B2WorldJSImpl _impl;

	B2WorldJSAdapter.from1(B2Vec2JSAdapter gravity) : _impl = B2WorldJSImpl.from1(gravity._impl);

	//void setDestructionListener(B2DestructionListenerJSAdapter listener) => _impl.setDestructionListener(listener);
	//void setContactFilter(JSContactFilterJSAdapter filter) => _impl.setContactFilter(filter);
	//void setContactListener(JSContactListenerJSAdapter listener) => _impl.setContactListener(listener);
	//void setDebugDraw(B2DrawJSAdapter debugDraw) => _impl.setDebugDraw(debugDraw);
	B2BodyJSAdapter createBody(B2BodyDefJSAdapter def) => B2BodyJSAdapter._(_impl.createBody(def));
	void destroyBody(B2BodyJSAdapter body) => _impl.destroyBody(body);
	B2JointJSAdapter createJoint(B2JointDefJSAdapter def) => B2JointJSAdapter._(_impl.createJoint(def));
	void destroyJoint(B2JointJSAdapter joint) => _impl.destroyJoint(joint);
	void step(double timeStep, int velocityIterations, int positionIterations) => _impl.step(timeStep, velocityIterations, positionIterations);
	void clearForces() => _impl.clearForces();
	void debugDraw() => _impl.debugDraw();
	//void queryAABB(B2QueryCallbackJSAdapter callback, B2AABBJSAdapter aabb) => _impl.queryAABB(callback, aabb._impl);
	//void rayCast(B2RayCastCallbackJSAdapter callback, B2Vec2JSAdapter point1, B2Vec2JSAdapter point2) => _impl.rayCast(callback, point1._impl, point2._impl);
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
	void set x(double arg0) => _impl.set_x(arg0);
	void set y(double arg0) => _impl.set_y(arg0);
	void dispose() => _impl.__destroy__();
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
	external void set_x(num arg0);
	external void set_y(num arg0);
	external void __destroy__();
}

