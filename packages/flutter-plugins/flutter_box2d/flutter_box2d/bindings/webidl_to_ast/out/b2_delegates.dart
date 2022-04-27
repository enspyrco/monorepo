import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class B2WorldPlatform extends PlatformInterface {

	static final Object _token = Object();

	B2WorldPlatform.from1(*gravity) : super(token: _token);

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

abstract class B2Vec2Platform extends PlatformInterface {

	static final Object _token = Object();

	B2Vec2Platform() : super(token: _token);

	B2Vec2Platform.from2(x, y) : super(token: _token);

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
	void set x(double arg0);
	void set y(double arg0);
	void dispose();
}

