import 'dart:ffi';

// import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'b2_delegates.dart';

final DynamicLibrary _symbols = DynamicLibrary.process();

typedef EmptyConstructor = Pointer<Void> Function();

class B2WorldFfiAdapter implements B2WorldPlatform {

	final Pointer<Void> _self;
	B2WorldFfiAdapter._(Pointer<Void> self) : _self = self;

	static final _ctr1 = _symbols.lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>('dart_bind_b2World_b2World_1').asFunction<Pointer<Void> Function(Pointer<Void>)>();

	B2WorldFfiAdapter.from1(B2Vec2FfiAdapter gravity) : _self = _ctr1(gravity._self);
/*
	static final _setDestructionListener = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_SetDestructionListener_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void setDestructionListener(B2DestructionListenerFfiAdapter listener) => _setDestructionListener(_self, listener);
*/
/*
	static final _setContactFilter = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_SetContactFilter_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void setContactFilter(JSContactFilterFfiAdapter filter) => _setContactFilter(_self, filter);
*/
/*
	static final _setContactListener = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_SetContactListener_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void setContactListener(JSContactListenerFfiAdapter listener) => _setContactListener(_self, listener);
*/
/*
	static final _setDebugDraw = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_SetDebugDraw_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void setDebugDraw(B2DrawFfiAdapter debugDraw) => _setDebugDraw(_self, debugDraw);
*/

	static final _createBody = _symbols.lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_CreateBody_1').asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
	@override
	B2BodyFfiAdapter createBody(B2BodyDefFfiAdapter def) => B2BodyFfiAdapter._(_createBody(_self, def));

	static final _destroyBody = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_DestroyBody_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void destroyBody(B2BodyFfiAdapter body) => _destroyBody(_self, body);

	static final _createJoint = _symbols.lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_CreateJoint_1').asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
	@override
	B2JointFfiAdapter createJoint(B2JointDefFfiAdapter def) => B2JointFfiAdapter._(_createJoint(_self, def));

	static final _destroyJoint = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_DestroyJoint_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void destroyJoint(B2JointFfiAdapter joint) => _destroyJoint(_self, joint);

	static final _step = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Float, Int32, Int32)>>('dart_bind_b2World_Step_3').asFunction<void Function(Pointer<Void>, double, int, int)>();
	@override
	void step(double timeStep, int velocityIterations, int positionIterations) => _step(_self, timeStep, velocityIterations, positionIterations);

	static final _clearForces = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>)>>('dart_bind_b2World_ClearForces_0').asFunction<void Function(Pointer<Void>)>();
	@override
	void clearForces() => _clearForces(_self);

	static final _debugDraw = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>)>>('dart_bind_b2World_DebugDraw_0').asFunction<void Function(Pointer<Void>)>();
	@override
	void debugDraw() => _debugDraw(_self);
/*
	static final _queryAABB = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_QueryAABB_2').asFunction<void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
	@override
	void queryAABB(B2QueryCallbackFfiAdapter callback, B2AABBFfiAdapter aabb) => _queryAABB(_self, callback, aabb._self);
*/
/*
	static final _rayCast = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_RayCast_3').asFunction<void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
	@override
	void rayCast(B2RayCastCallbackFfiAdapter callback, B2Vec2FfiAdapter point1, B2Vec2FfiAdapter point2) => _rayCast(_self, callback, point1._self, point2._self);
*/

	static final _getBodyList = _symbols.lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>('dart_bind_b2World_GetBodyList_0').asFunction<Pointer<Void> Function(Pointer<Void>)>();
	@override
	B2BodyFfiAdapter getBodyList() => B2BodyFfiAdapter._(_getBodyList(_self));

	static final _getJointList = _symbols.lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>('dart_bind_b2World_GetJointList_0').asFunction<Pointer<Void> Function(Pointer<Void>)>();
	@override
	B2JointFfiAdapter getJointList() => B2JointFfiAdapter._(_getJointList(_self));

	static final _getContactList = _symbols.lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>('dart_bind_b2World_GetContactList_0').asFunction<Pointer<Void> Function(Pointer<Void>)>();
	@override
	B2ContactFfiAdapter getContactList() => B2ContactFfiAdapter._(_getContactList(_self));

	static final _setAllowSleeping = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>('dart_bind_b2World_SetAllowSleeping_1').asFunction<void Function(Pointer<Void>, bool)>();
	@override
	void setAllowSleeping(bool flag) => _setAllowSleeping(_self, flag);

	static final _getAllowSleeping = _symbols.lookup<NativeFunction<Bool Function(Pointer<Void>)>>('dart_bind_b2World_GetAllowSleeping_0').asFunction<bool Function(Pointer<Void>)>();
	@override
	bool getAllowSleeping() => _getAllowSleeping(_self);

	static final _setWarmStarting = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>('dart_bind_b2World_SetWarmStarting_1').asFunction<void Function(Pointer<Void>, bool)>();
	@override
	void setWarmStarting(bool flag) => _setWarmStarting(_self, flag);

	static final _getWarmStarting = _symbols.lookup<NativeFunction<Bool Function(Pointer<Void>)>>('dart_bind_b2World_GetWarmStarting_0').asFunction<bool Function(Pointer<Void>)>();
	@override
	bool getWarmStarting() => _getWarmStarting(_self);

	static final _setContinuousPhysics = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>('dart_bind_b2World_SetContinuousPhysics_1').asFunction<void Function(Pointer<Void>, bool)>();
	@override
	void setContinuousPhysics(bool flag) => _setContinuousPhysics(_self, flag);

	static final _getContinuousPhysics = _symbols.lookup<NativeFunction<Bool Function(Pointer<Void>)>>('dart_bind_b2World_GetContinuousPhysics_0').asFunction<bool Function(Pointer<Void>)>();
	@override
	bool getContinuousPhysics() => _getContinuousPhysics(_self);

	static final _setSubStepping = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>('dart_bind_b2World_SetSubStepping_1').asFunction<void Function(Pointer<Void>, bool)>();
	@override
	void setSubStepping(bool flag) => _setSubStepping(_self, flag);

	static final _getSubStepping = _symbols.lookup<NativeFunction<Bool Function(Pointer<Void>)>>('dart_bind_b2World_GetSubStepping_0').asFunction<bool Function(Pointer<Void>)>();
	@override
	bool getSubStepping() => _getSubStepping(_self);

	static final _getProxyCount = _symbols.lookup<NativeFunction<Int32 Function(Pointer<Void>)>>('dart_bind_b2World_GetProxyCount_0').asFunction<int Function(Pointer<Void>)>();
	@override
	int getProxyCount() => _getProxyCount(_self);

	static final _getBodyCount = _symbols.lookup<NativeFunction<Int32 Function(Pointer<Void>)>>('dart_bind_b2World_GetBodyCount_0').asFunction<int Function(Pointer<Void>)>();
	@override
	int getBodyCount() => _getBodyCount(_self);

	static final _getJointCount = _symbols.lookup<NativeFunction<Int32 Function(Pointer<Void>)>>('dart_bind_b2World_GetJointCount_0').asFunction<int Function(Pointer<Void>)>();
	@override
	int getJointCount() => _getJointCount(_self);

	static final _getContactCount = _symbols.lookup<NativeFunction<Int32 Function(Pointer<Void>)>>('dart_bind_b2World_GetContactCount_0').asFunction<int Function(Pointer<Void>)>();
	@override
	int getContactCount() => _getContactCount(_self);

	static final _getTreeHeight = _symbols.lookup<NativeFunction<Int32 Function(Pointer<Void>)>>('dart_bind_b2World_GetTreeHeight_0').asFunction<int Function(Pointer<Void>)>();
	@override
	int getTreeHeight() => _getTreeHeight(_self);

	static final _getTreeBalance = _symbols.lookup<NativeFunction<Int32 Function(Pointer<Void>)>>('dart_bind_b2World_GetTreeBalance_0').asFunction<int Function(Pointer<Void>)>();
	@override
	int getTreeBalance() => _getTreeBalance(_self);

	static final _getTreeQuality = _symbols.lookup<NativeFunction<Float Function(Pointer<Void>)>>('dart_bind_b2World_GetTreeQuality_0').asFunction<double Function(Pointer<Void>)>();
	@override
	double getTreeQuality() => _getTreeQuality(_self);

	static final _setGravity = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_SetGravity_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void setGravity(B2Vec2FfiAdapter gravity) => _setGravity(_self, gravity._self);

	static final _getGravity = _symbols.lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>('dart_bind_b2World_GetGravity_0').asFunction<Pointer<Void> Function(Pointer<Void>)>();
	@override
	B2Vec2FfiAdapter getGravity() => B2Vec2FfiAdapter._(_getGravity(_self));

	static final _isLocked = _symbols.lookup<NativeFunction<Bool Function(Pointer<Void>)>>('dart_bind_b2World_IsLocked_0').asFunction<bool Function(Pointer<Void>)>();
	@override
	bool isLocked() => _isLocked(_self);

	static final _setAutoClearForces = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>('dart_bind_b2World_SetAutoClearForces_1').asFunction<void Function(Pointer<Void>, bool)>();
	@override
	void setAutoClearForces(bool flag) => _setAutoClearForces(_self, flag);

	static final _getAutoClearForces = _symbols.lookup<NativeFunction<Bool Function(Pointer<Void>)>>('dart_bind_b2World_GetAutoClearForces_0').asFunction<bool Function(Pointer<Void>)>();
	@override
	bool getAutoClearForces() => _getAutoClearForces(_self);

	static final _getProfile = _symbols.lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>('dart_bind_b2World_GetProfile_0').asFunction<Pointer<Void> Function(Pointer<Void>)>();
	@override
	B2ProfileFfiAdapter getProfile() => B2ProfileFfiAdapter._(_getProfile(_self));

	static final _dump = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>)>>('dart_bind_b2World_Dump_0').asFunction<void Function(Pointer<Void>)>();
	@override
	void dump() => _dump(_self);

	static final ___destroy__ = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>)>>('dart_bind_b2World___destroy___0').asFunction<void Function(Pointer<Void>)>();
	@override
	void dispose() => ___destroy__(_self);

}

class B2Vec2FfiAdapter implements B2Vec2Platform {

	final Pointer<Void> _self;
	B2Vec2FfiAdapter._(Pointer<Void> self) : _self = self;

	static final _ctr0 = _symbols.lookup<NativeFunction<Pointer<Void> Function()>>('dart_bind_b2Vec2_b2Vec2_0').asFunction<Pointer<Void> Function()>();

	B2Vec2FfiAdapter() : _self = _ctr0();

	static final _ctr2 = _symbols.lookup<NativeFunction<Pointer<Void> Function(Float, Float)>>('dart_bind_b2Vec2_b2Vec2_2').asFunction<Pointer<Void> Function(double, double)>();

	B2Vec2FfiAdapter.from2(double x, double y) : _self = _ctr2(x, y);

	static final _setZero = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>)>>('dart_bind_b2Vec2_SetZero_0').asFunction<void Function(Pointer<Void>)>();
	@override
	void setZero() => _setZero(_self);

	static final _set = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Float, Float)>>('dart_bind_b2Vec2_Set_2').asFunction<void Function(Pointer<Void>, double, double)>();
	@override
	void set(double x, double y) => _set(_self, x, y);

	static final _op_add = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2Vec2_op_add_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void op_add(B2Vec2FfiAdapter v) => _op_add(_self, v._self);

	static final _op_sub = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2Vec2_op_sub_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void op_sub(B2Vec2FfiAdapter v) => _op_sub(_self, v._self);

	static final _op_mul = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>('dart_bind_b2Vec2_op_mul_1').asFunction<void Function(Pointer<Void>, double)>();
	@override
	void op_mul(double s) => _op_mul(_self, s);

	static final _length = _symbols.lookup<NativeFunction<Float Function(Pointer<Void>)>>('dart_bind_b2Vec2_Length_0').asFunction<double Function(Pointer<Void>)>();
	@override
	double length() => _length(_self);

	static final _lengthSquared = _symbols.lookup<NativeFunction<Float Function(Pointer<Void>)>>('dart_bind_b2Vec2_LengthSquared_0').asFunction<double Function(Pointer<Void>)>();
	@override
	double lengthSquared() => _lengthSquared(_self);

	static final _normalize = _symbols.lookup<NativeFunction<Float Function(Pointer<Void>)>>('dart_bind_b2Vec2_Normalize_0').asFunction<double Function(Pointer<Void>)>();
	@override
	double normalize() => _normalize(_self);

	static final _isValid = _symbols.lookup<NativeFunction<Bool Function(Pointer<Void>)>>('dart_bind_b2Vec2_IsValid_0').asFunction<bool Function(Pointer<Void>)>();
	@override
	bool isValid() => _isValid(_self);

	static final _skew = _symbols.lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>('dart_bind_b2Vec2_Skew_0').asFunction<Pointer<Void> Function(Pointer<Void>)>();
	@override
	B2Vec2FfiAdapter skew() => B2Vec2FfiAdapter._(_skew(_self));

	static final _set_x = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>('dart_bind_b2Vec2_set_x_1').asFunction<void Function(Pointer<Void>, double)>();
	@override
	void set x(double arg0) => _set_x(_self, arg0);

	static final _set_y = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>('dart_bind_b2Vec2_set_y_1').asFunction<void Function(Pointer<Void>, double)>();
	@override
	void set y(double arg0) => _set_y(_self, arg0);

	static final ___destroy__ = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>)>>('dart_bind_b2Vec2___destroy___0').asFunction<void Function(Pointer<Void>)>();
	@override
	void dispose() => ___destroy__(_self);

}

