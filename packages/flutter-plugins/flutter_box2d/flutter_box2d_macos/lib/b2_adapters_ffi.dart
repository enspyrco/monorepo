import 'dart:ffi';

import 'package:flutter_box2d_platform_interface/b2_delegates.dart';
import 'package:flutter_box2d_platform_interface/b2_enums.dart';

final DynamicLibrary _symbols = DynamicLibrary.process();

typedef EmptyConstructor = Pointer<Void> Function();

class B2ShapeFfiAdapter implements B2ShapePlatform {
  final Pointer<Void> _self;
  B2ShapeFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2Shape_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType getType() => _getType(_self).toB2ShapeType();

  static final _getChildCount = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2Shape_GetChildCount_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getChildCount() => _getChildCount(_self);

  static final _testPoint = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2Shape_TestPoint_2')
      .asFunction<bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  bool testPoint(B2TransformFfiAdapter xf, B2Vec2FfiAdapter p) =>
      _testPoint(_self, xf._self, p._self);

  static final _rayCast = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Pointer<Void>, Int32)>>('dart_bind_b2Shape_RayCast_4')
      .asFunction<
          bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
              Pointer<Void>, int)>();
  @override
  bool rayCast(B2RayCastOutputFfiAdapter output, B2RayCastInputFfiAdapter input,
          B2TransformFfiAdapter transform, int childIndex) =>
      _rayCast(_self, output._self, input._self, transform._self, childIndex);

  static final _computeAABB = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Int32)>>('dart_bind_b2Shape_ComputeAABB_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>();
  @override
  void computeAABB(
          B2AABBFfiAdapter aabb, B2TransformFfiAdapter xf, int childIndex) =>
      _computeAABB(_self, aabb._self, xf._self, childIndex);

  static final _computeMass = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Float)>>('dart_bind_b2Shape_ComputeMass_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, double)>();
  @override
  void computeMass(B2MassDataFfiAdapter massData, double density) =>
      _computeMass(_self, massData._self, density);

  static final _get_m_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2Shape_get_m_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType get_m_type() => _get_m_type(_self).toB2ShapeType();

  static final _set_m_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2Shape_set_m_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_m_type(B2ShapeType arg0) => _set_m_type(_self, arg0.index);

  static final _get_m_radius = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Shape_get_m_radius_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_m_radius() => _get_m_radius(_self);

  static final _set_m_radius = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Shape_set_m_radius_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_m_radius(double arg0) => _set_m_radius(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Shape___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2JointDefFfiAdapter implements B2JointDefPlatform {
  final Pointer<Void> _self;
  B2JointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2JointDef_b2JointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2JointDefFfiAdapter() : _self = _ctr0();

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2JointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2JointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2JointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2JointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2JointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2JointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2JointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2JointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2JointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2JointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2JointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2JointFfiAdapter implements B2JointPlatform {
  final Pointer<Void> _self;
  B2JointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2Joint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Joint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Joint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Joint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Joint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Joint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Joint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Joint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Joint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2Joint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Joint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);
}

class VoidPtrFfiAdapter implements VoidPtrPlatform {
  final Pointer<Void> _self;
  VoidPtrFfiAdapter._(Pointer<Void> self) : _self = self;

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_VoidPtr___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ContactFfiAdapter implements B2ContactPlatform {
  final Pointer<Void> _self;
  B2ContactFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getManifold = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_GetManifold_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ManifoldFfiAdapter getManifold() =>
      B2ManifoldFfiAdapter._(_getManifold(_self));

  static final _getWorldManifold = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Contact_GetWorldManifold_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void getWorldManifold(B2WorldManifoldFfiAdapter manifold) =>
      _getWorldManifold(_self, manifold._self);

  static final _isTouching = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_IsTouching_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isTouching() => _isTouching(_self);

  static final _setEnabled = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2Contact_SetEnabled_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setEnabled(bool flag) => _setEnabled(_self, flag);

  static final _isEnabled = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_IsEnabled_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isEnabled() => _isEnabled(_self);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ContactFfiAdapter getNext() => B2ContactFfiAdapter._(_getNext(_self));

  static final _getFixtureA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_GetFixtureA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2FixtureFfiAdapter getFixtureA() =>
      B2FixtureFfiAdapter._(_getFixtureA(_self));

  static final _getChildIndexA = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_GetChildIndexA_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getChildIndexA() => _getChildIndexA(_self);

  static final _getFixtureB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_GetFixtureB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2FixtureFfiAdapter getFixtureB() =>
      B2FixtureFfiAdapter._(_getFixtureB(_self));

  static final _getChildIndexB = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_GetChildIndexB_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getChildIndexB() => _getChildIndexB(_self);

  static final _setFriction = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Contact_SetFriction_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setFriction(double friction) => _setFriction(_self, friction);

  static final _getFriction = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_GetFriction_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getFriction() => _getFriction(_self);

  static final _resetFriction = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_ResetFriction_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void resetFriction() => _resetFriction(_self);

  static final _setRestitution = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Contact_SetRestitution_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setRestitution(double restitution) =>
      _setRestitution(_self, restitution);

  static final _getRestitution = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_GetRestitution_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getRestitution() => _getRestitution(_self);

  static final _resetRestitution = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_ResetRestitution_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void resetRestitution() => _resetRestitution(_self);

  static final _setRestitutionThreshold = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Contact_SetRestitutionThreshold_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setRestitutionThreshold(double threshold) =>
      _setRestitutionThreshold(_self, threshold);

  static final _getRestitutionThreshold = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_GetRestitutionThreshold_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getRestitutionThreshold() => _getRestitutionThreshold(_self);

  static final _resetRestitutionThreshold = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_ResetRestitutionThreshold_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void resetRestitutionThreshold() => _resetRestitutionThreshold(_self);

  static final _setTangentSpeed = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Contact_SetTangentSpeed_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setTangentSpeed(double speed) => _setTangentSpeed(_self, speed);

  static final _getTangentSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Contact_GetTangentSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getTangentSpeed() => _getTangentSpeed(_self);
}

class B2ContactListenerFfiAdapter implements B2ContactListenerPlatform {
  final Pointer<Void> _self;
  B2ContactListenerFfiAdapter._(Pointer<Void> self) : _self = self;

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2ContactListener___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class JSContactListenerFfiAdapter implements JSContactListenerPlatform {
  final Pointer<Void> _self;
  JSContactListenerFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_JSContactListener_JSContactListener_0')
      .asFunction<Pointer<Void> Function()>();

  JSContactListenerFfiAdapter() : _self = _ctr0();

  static final _beginContact = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_JSContactListener_BeginContact_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void beginContact(B2ContactFfiAdapter contact) =>
      _beginContact(_self, contact._self);

  static final _endContact = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_JSContactListener_EndContact_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void endContact(B2ContactFfiAdapter contact) =>
      _endContact(_self, contact._self);

  static final _preSolve = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_JSContactListener_PreSolve_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  void preSolve(
          B2ContactFfiAdapter contact, B2ManifoldFfiAdapter oldManifold) =>
      _preSolve(_self, contact._self, oldManifold._self);

  static final _postSolve = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_JSContactListener_PostSolve_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  void postSolve(
          B2ContactFfiAdapter contact, B2ContactImpulseFfiAdapter impulse) =>
      _postSolve(_self, contact._self, impulse._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_JSContactListener___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2WorldFfiAdapter implements B2WorldPlatform {
  final Pointer<Void> _self;
  B2WorldFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr1 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2World_b2World_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();

  B2WorldFfiAdapter.from1(B2Vec2FfiAdapter gravity)
      : _self = _ctr1(gravity._self);
/*
	static final _setDestructionListener = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_SetDestructionListener_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void setDestructionListener(B2DestructionListenerFfiAdapter listener) => _setDestructionListener(_self, listener._self);
*/
/*
	static final _setContactFilter = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_SetContactFilter_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void setContactFilter(JSContactFilterFfiAdapter filter) => _setContactFilter(_self, filter._self);
*/
/*
	static final _setContactListener = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_SetContactListener_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void setContactListener(JSContactListenerFfiAdapter listener) => _setContactListener(_self, listener._self);
*/
/*
	static final _setDebugDraw = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_SetDebugDraw_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void setDebugDraw(B2DrawFfiAdapter debugDraw) => _setDebugDraw(_self, debugDraw._self);
*/

  static final _createBody = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2World_CreateBody_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2BodyFfiAdapter createBody(B2BodyDefFfiAdapter def) =>
      B2BodyFfiAdapter._(_createBody(_self, def._self));

  static final _destroyBody = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2World_DestroyBody_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void destroyBody(B2BodyFfiAdapter body) => _destroyBody(_self, body._self);

  static final _createJoint = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2World_CreateJoint_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2JointFfiAdapter createJoint(B2JointDefFfiAdapter def) =>
      B2JointFfiAdapter._(_createJoint(_self, def._self));

  static final _destroyJoint = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2World_DestroyJoint_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void destroyJoint(B2JointFfiAdapter joint) =>
      _destroyJoint(_self, joint._self);

  static final _step = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Float, Int32,
                  Int32)>>('dart_bind_b2World_Step_3')
      .asFunction<void Function(Pointer<Void>, double, int, int)>();
  @override
  void step(double timeStep, int velocityIterations, int positionIterations) =>
      _step(_self, timeStep, velocityIterations, positionIterations);

  static final _clearForces = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2World_ClearForces_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void clearForces() => _clearForces(_self);

  static final _debugDraw = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2World_DebugDraw_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void debugDraw() => _debugDraw(_self);
/*
	static final _queryAABB = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_QueryAABB_2').asFunction<void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
	@override
	void queryAABB(B2QueryCallbackFfiAdapter callback, B2AABBFfiAdapter aabb) => _queryAABB(_self, callback._self, aabb._self);
*/
/*
	static final _rayCast = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>>('dart_bind_b2World_RayCast_3').asFunction<void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
	@override
	void rayCast(B2RayCastCallbackFfiAdapter callback, B2Vec2FfiAdapter point1, B2Vec2FfiAdapter point2) => _rayCast(_self, callback._self, point1._self, point2._self);
*/

  static final _getBodyList = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetBodyList_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyList() => B2BodyFfiAdapter._(_getBodyList(_self));

  static final _getJointList = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetJointList_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getJointList() => B2JointFfiAdapter._(_getJointList(_self));

  static final _getContactList = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetContactList_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ContactFfiAdapter getContactList() =>
      B2ContactFfiAdapter._(_getContactList(_self));

  static final _setAllowSleeping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2World_SetAllowSleeping_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setAllowSleeping(bool flag) => _setAllowSleeping(_self, flag);

  static final _getAllowSleeping = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetAllowSleeping_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getAllowSleeping() => _getAllowSleeping(_self);

  static final _setWarmStarting = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2World_SetWarmStarting_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setWarmStarting(bool flag) => _setWarmStarting(_self, flag);

  static final _getWarmStarting = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetWarmStarting_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getWarmStarting() => _getWarmStarting(_self);

  static final _setContinuousPhysics = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2World_SetContinuousPhysics_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setContinuousPhysics(bool flag) => _setContinuousPhysics(_self, flag);

  static final _getContinuousPhysics = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetContinuousPhysics_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getContinuousPhysics() => _getContinuousPhysics(_self);

  static final _setSubStepping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2World_SetSubStepping_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setSubStepping(bool flag) => _setSubStepping(_self, flag);

  static final _getSubStepping = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetSubStepping_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getSubStepping() => _getSubStepping(_self);

  static final _getProxyCount = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetProxyCount_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getProxyCount() => _getProxyCount(_self);

  static final _getBodyCount = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetBodyCount_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getBodyCount() => _getBodyCount(_self);

  static final _getJointCount = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetJointCount_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getJointCount() => _getJointCount(_self);

  static final _getContactCount = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetContactCount_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getContactCount() => _getContactCount(_self);

  static final _getTreeHeight = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetTreeHeight_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getTreeHeight() => _getTreeHeight(_self);

  static final _getTreeBalance = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetTreeBalance_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getTreeBalance() => _getTreeBalance(_self);

  static final _getTreeQuality = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetTreeQuality_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getTreeQuality() => _getTreeQuality(_self);

  static final _setGravity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2World_SetGravity_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void setGravity(B2Vec2FfiAdapter gravity) =>
      _setGravity(_self, gravity._self);

  static final _getGravity = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetGravity_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getGravity() => B2Vec2FfiAdapter._(_getGravity(_self));

  static final _isLocked = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2World_IsLocked_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isLocked() => _isLocked(_self);

  static final _setAutoClearForces = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2World_SetAutoClearForces_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setAutoClearForces(bool flag) => _setAutoClearForces(_self, flag);

  static final _getAutoClearForces = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetAutoClearForces_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getAutoClearForces() => _getAutoClearForces(_self);

  static final _getProfile = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2World_GetProfile_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ProfileFfiAdapter getProfile() => B2ProfileFfiAdapter._(_getProfile(_self));

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2World_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2World___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2FixtureUserDataFfiAdapter implements B2FixtureUserDataPlatform {
  final Pointer<Void> _self;
  B2FixtureUserDataFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _get_pointer = _symbols
      .lookup<NativeFunction<Uint32 Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureUserData_get_pointer_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_pointer() => _get_pointer(_self);

  static final _set_pointer = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint32)>>(
          'dart_bind_b2FixtureUserData_set_pointer_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_pointer(int arg0) => _set_pointer(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureUserData___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2FixtureDefFfiAdapter implements B2FixtureDefPlatform {
  final Pointer<Void> _self;
  B2FixtureDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2FixtureDef_b2FixtureDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2FixtureDefFfiAdapter() : _self = _ctr0();

  static final _get_shape = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_get_shape_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ShapeFfiAdapter get_shape() => B2ShapeFfiAdapter._(_get_shape(_self));

  static final _set_shape = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_set_shape_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_shape(B2ShapeFfiAdapter arg0) => _set_shape(_self, arg0._self);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2FixtureUserDataFfiAdapter get_userData() =>
      B2FixtureUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2FixtureUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_friction = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_get_friction_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_friction() => _get_friction(_self);

  static final _set_friction = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2FixtureDef_set_friction_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_friction(double arg0) => _set_friction(_self, arg0);

  static final _get_restitution = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_get_restitution_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_restitution() => _get_restitution(_self);

  static final _set_restitution = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2FixtureDef_set_restitution_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_restitution(double arg0) => _set_restitution(_self, arg0);

  static final _get_restitutionThreshold = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_get_restitutionThreshold_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_restitutionThreshold() => _get_restitutionThreshold(_self);

  static final _set_restitutionThreshold = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2FixtureDef_set_restitutionThreshold_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_restitutionThreshold(double arg0) =>
      _set_restitutionThreshold(_self, arg0);

  static final _get_density = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_get_density_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_density() => _get_density(_self);

  static final _set_density = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2FixtureDef_set_density_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_density(double arg0) => _set_density(_self, arg0);

  static final _get_isSensor = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_get_isSensor_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_isSensor() => _get_isSensor(_self);

  static final _set_isSensor = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2FixtureDef_set_isSensor_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_isSensor(bool arg0) => _set_isSensor(_self, arg0);

  static final _get_filter = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_get_filter_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2FilterFfiAdapter get_filter() => B2FilterFfiAdapter._(_get_filter(_self));

  static final _set_filter = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2FixtureDef_set_filter_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_filter(B2FilterFfiAdapter arg0) => _set_filter(_self, arg0._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2FixtureDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2FixtureFfiAdapter implements B2FixturePlatform {
  final Pointer<Void> _self;
  B2FixtureFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType getType() => _getType(_self).toB2ShapeType();

  static final _getShape = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetShape_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ShapeFfiAdapter getShape() => B2ShapeFfiAdapter._(_getShape(_self));

  static final _setSensor = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2Fixture_SetSensor_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setSensor(bool sensor) => _setSensor(_self, sensor);

  static final _isSensor = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_IsSensor_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isSensor() => _isSensor(_self);

  static final _setFilterData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Fixture_SetFilterData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void setFilterData(B2FilterFfiAdapter filter) =>
      _setFilterData(_self, filter._self);

  static final _getFilterData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetFilterData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2FilterFfiAdapter getFilterData() =>
      B2FilterFfiAdapter._(_getFilterData(_self));

  static final _refilter = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_Refilter_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void refilter() => _refilter(_self);

  static final _getBody = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetBody_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBody() => B2BodyFfiAdapter._(_getBody(_self));

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2FixtureFfiAdapter getNext() => B2FixtureFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2FixtureUserDataFfiAdapter getUserData() =>
      B2FixtureUserDataFfiAdapter._(_getUserData(_self));

  static final _testPoint = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Fixture_TestPoint_1')
      .asFunction<bool Function(Pointer<Void>, Pointer<Void>)>();
  @override
  bool testPoint(B2Vec2FfiAdapter p) => _testPoint(_self, p._self);

  static final _rayCast = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Int32)>>('dart_bind_b2Fixture_RayCast_3')
      .asFunction<
          bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>();
  @override
  bool rayCast(B2RayCastOutputFfiAdapter output, B2RayCastInputFfiAdapter input,
          int childIndex) =>
      _rayCast(_self, output._self, input._self, childIndex);

  static final _getMassData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetMassData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void getMassData(B2MassDataFfiAdapter massData) =>
      _getMassData(_self, massData._self);

  static final _setDensity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Fixture_SetDensity_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setDensity(double density) => _setDensity(_self, density);

  static final _getDensity = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetDensity_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getDensity() => _getDensity(_self);

  static final _getFriction = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetFriction_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getFriction() => _getFriction(_self);

  static final _setFriction = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Fixture_SetFriction_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setFriction(double friction) => _setFriction(_self, friction);

  static final _getRestitution = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetRestitution_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getRestitution() => _getRestitution(_self);

  static final _setRestitution = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Fixture_SetRestitution_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setRestitution(double restitution) =>
      _setRestitution(_self, restitution);

  static final _getRestitutionThreshold = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture_GetRestitutionThreshold_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getRestitutionThreshold() => _getRestitutionThreshold(_self);

  static final _setRestitutionThreshold = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Fixture_SetRestitutionThreshold_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setRestitutionThreshold(double threshold) =>
      _setRestitutionThreshold(_self, threshold);

  static final _getAABB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2Fixture_GetAABB_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, int)>();
  @override
  B2AABBFfiAdapter getAABB(int childIndex) =>
      B2AABBFfiAdapter._(_getAABB(_self, childIndex));

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2Fixture_Dump_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void dump(int bodyIndex) => _dump(_self, bodyIndex);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Fixture___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2TransformFfiAdapter implements B2TransformPlatform {
  final Pointer<Void> _self;
  B2TransformFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2Transform_b2Transform_0')
      .asFunction<Pointer<Void> Function()>();

  B2TransformFfiAdapter() : _self = _ctr0();

  static final _ctr2 = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2Transform_b2Transform_2')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();

  B2TransformFfiAdapter.from2(
      B2Vec2FfiAdapter position, B2RotFfiAdapter rotation)
      : _self = _ctr2(position._self, rotation._self);

  static final _setIdentity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Transform_SetIdentity_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void setIdentity() => _setIdentity(_self);

  static final _set = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Float)>>('dart_bind_b2Transform_Set_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, double)>();
  @override
  void set(B2Vec2FfiAdapter position, double angle) =>
      _set(_self, position._self, angle);

  static final _get_p = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Transform_get_p_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_p() => B2Vec2FfiAdapter._(_get_p(_self));

  static final _set_p = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Transform_set_p_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_p(B2Vec2FfiAdapter arg0) => _set_p(_self, arg0._self);

  static final _get_q = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Transform_get_q_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2RotFfiAdapter get_q() => B2RotFfiAdapter._(_get_q(_self));

  static final _set_q = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Transform_set_q_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_q(B2RotFfiAdapter arg0) => _set_q(_self, arg0._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Transform___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2RayCastCallbackFfiAdapter implements B2RayCastCallbackPlatform {
  final Pointer<Void> _self;
  B2RayCastCallbackFfiAdapter._(Pointer<Void> self) : _self = self;

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2RayCastCallback___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class JSRayCastCallbackFfiAdapter implements JSRayCastCallbackPlatform {
  final Pointer<Void> _self;
  JSRayCastCallbackFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_JSRayCastCallback_JSRayCastCallback_0')
      .asFunction<Pointer<Void> Function()>();

  JSRayCastCallbackFfiAdapter() : _self = _ctr0();

  static final _reportFixture = _symbols
      .lookup<
          NativeFunction<
              Float Function(
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Float)>>('dart_bind_JSRayCastCallback_ReportFixture_4')
      .asFunction<
          double Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
              Pointer<Void>, double)>();
  @override
  double reportFixture(B2FixtureFfiAdapter fixture, B2Vec2FfiAdapter point,
          B2Vec2FfiAdapter normal, double fraction) =>
      _reportFixture(_self, fixture._self, point._self, normal._self, fraction);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_JSRayCastCallback___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2QueryCallbackFfiAdapter implements B2QueryCallbackPlatform {
  final Pointer<Void> _self;
  B2QueryCallbackFfiAdapter._(Pointer<Void> self) : _self = self;

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2QueryCallback___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class JSQueryCallbackFfiAdapter implements JSQueryCallbackPlatform {
  final Pointer<Void> _self;
  JSQueryCallbackFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_JSQueryCallback_JSQueryCallback_0')
      .asFunction<Pointer<Void> Function()>();

  JSQueryCallbackFfiAdapter() : _self = _ctr0();

  static final _reportFixture = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_JSQueryCallback_ReportFixture_1')
      .asFunction<bool Function(Pointer<Void>, Pointer<Void>)>();
  @override
  bool reportFixture(B2FixtureFfiAdapter fixture) =>
      _reportFixture(_self, fixture._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_JSQueryCallback___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2MassDataFfiAdapter implements B2MassDataPlatform {
  final Pointer<Void> _self;
  B2MassDataFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2MassData_b2MassData_0')
      .asFunction<Pointer<Void> Function()>();

  B2MassDataFfiAdapter() : _self = _ctr0();

  static final _get_mass = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MassData_get_mass_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_mass() => _get_mass(_self);

  static final _set_mass = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MassData_set_mass_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_mass(double arg0) => _set_mass(_self, arg0);

  static final _get_center = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MassData_get_center_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_center() => B2Vec2FfiAdapter._(_get_center(_self));

  static final _set_center = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MassData_set_center_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_center(B2Vec2FfiAdapter arg0) => _set_center(_self, arg0._self);

  static final _get_I = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MassData_get_I_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_I() => _get_I(_self);

  static final _set_I = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MassData_set_I_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_I(double arg0) => _set_I(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2MassData___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2Vec2FfiAdapter implements B2Vec2Platform {
  final Pointer<Void> _self;
  B2Vec2FfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2Vec2_b2Vec2_0')
      .asFunction<Pointer<Void> Function()>();

  B2Vec2FfiAdapter() : _self = _ctr0();

  static final _ctr2 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Float, Float)>>(
          'dart_bind_b2Vec2_b2Vec2_2')
      .asFunction<Pointer<Void> Function(double, double)>();

  B2Vec2FfiAdapter.from2(double x, double y) : _self = _ctr2(x, y);

  static final _setZero = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Vec2_SetZero_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void setZero() => _setZero(_self);

  static final _set = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float, Float)>>(
          'dart_bind_b2Vec2_Set_2')
      .asFunction<void Function(Pointer<Void>, double, double)>();
  @override
  void set(double x, double y) => _set(_self, x, y);

  static final _op_add = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Vec2_op_add_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void op_add(B2Vec2FfiAdapter v) => _op_add(_self, v._self);

  static final _op_sub = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Vec2_op_sub_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void op_sub(B2Vec2FfiAdapter v) => _op_sub(_self, v._self);

  static final _op_mul = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Vec2_op_mul_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void op_mul(double s) => _op_mul(_self, s);

  static final _length = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Vec2_Length_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double length() => _length(_self);

  static final _lengthSquared = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Vec2_LengthSquared_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double lengthSquared() => _lengthSquared(_self);

  static final _normalize = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Vec2_Normalize_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double normalize() => _normalize(_self);

  static final _isValid = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2Vec2_IsValid_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isValid() => _isValid(_self);

  static final _skew = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Vec2_Skew_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter skew() => B2Vec2FfiAdapter._(_skew(_self));

  static final _get_x = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Vec2_get_x_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_x() => _get_x(_self);

  static final _set_x = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Vec2_set_x_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_x(double arg0) => _set_x(_self, arg0);

  static final _get_y = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Vec2_get_y_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_y() => _get_y(_self);

  static final _set_y = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Vec2_set_y_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_y(double arg0) => _set_y(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Vec2___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2Vec3FfiAdapter implements B2Vec3Platform {
  final Pointer<Void> _self;
  B2Vec3FfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2Vec3_b2Vec3_0')
      .asFunction<Pointer<Void> Function()>();

  B2Vec3FfiAdapter() : _self = _ctr0();

  static final _ctr3 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Float, Float, Float)>>(
          'dart_bind_b2Vec3_b2Vec3_3')
      .asFunction<Pointer<Void> Function(double, double, double)>();

  B2Vec3FfiAdapter.from3(double x, double y, double z) : _self = _ctr3(x, y, z);

  static final _setZero = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Vec3_SetZero_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void setZero() => _setZero(_self);

  static final _set = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Float, Float,
                  Float)>>('dart_bind_b2Vec3_Set_3')
      .asFunction<void Function(Pointer<Void>, double, double, double)>();
  @override
  void set(double x, double y, double z) => _set(_self, x, y, z);

  static final _op_add = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Vec3_op_add_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void op_add(B2Vec3FfiAdapter v) => _op_add(_self, v._self);

  static final _op_sub = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Vec3_op_sub_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void op_sub(B2Vec3FfiAdapter v) => _op_sub(_self, v._self);

  static final _op_mul = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Vec3_op_mul_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void op_mul(double s) => _op_mul(_self, s);

  static final _get_x = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Vec3_get_x_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_x() => _get_x(_self);

  static final _set_x = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Vec3_set_x_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_x(double arg0) => _set_x(_self, arg0);

  static final _get_y = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Vec3_get_y_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_y() => _get_y(_self);

  static final _set_y = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Vec3_set_y_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_y(double arg0) => _set_y(_self, arg0);

  static final _get_z = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Vec3_get_z_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_z() => _get_z(_self);

  static final _set_z = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Vec3_set_z_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_z(double arg0) => _set_z(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Vec3___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2BodyUserDataFfiAdapter implements B2BodyUserDataPlatform {
  final Pointer<Void> _self;
  B2BodyUserDataFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _get_pointer = _symbols
      .lookup<NativeFunction<Uint32 Function(Pointer<Void>)>>(
          'dart_bind_b2BodyUserData_get_pointer_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_pointer() => _get_pointer(_self);

  static final _set_pointer = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint32)>>(
          'dart_bind_b2BodyUserData_set_pointer_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_pointer(int arg0) => _set_pointer(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2BodyUserData___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2BodyFfiAdapter implements B2BodyPlatform {
  final Pointer<Void> _self;
  B2BodyFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _createFixture1 = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2Body_CreateFixture_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2FixtureFfiAdapter createFixture1(B2FixtureDefFfiAdapter shape) =>
      B2FixtureFfiAdapter._(_createFixture1(_self, shape._self));

  static final _createFixture2 = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(Pointer<Void>, Pointer<Void>,
                  Float)>>('dart_bind_b2Body_CreateFixture_2')
      .asFunction<
          Pointer<Void> Function(Pointer<Void>, Pointer<Void>, double)>();
  @override
  B2FixtureFfiAdapter createFixture2(B2ShapeFfiAdapter shape, double density) =>
      B2FixtureFfiAdapter._(_createFixture2(_self, shape._self, density));

  static final _destroyFixture = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Body_DestroyFixture_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void destroyFixture(B2FixtureFfiAdapter fixture) =>
      _destroyFixture(_self, fixture._self);

  static final _setTransform = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Float)>>('dart_bind_b2Body_SetTransform_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, double)>();
  @override
  void setTransform(B2Vec2FfiAdapter position, double angle) =>
      _setTransform(_self, position._self, angle);

  static final _getTransform = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetTransform_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2TransformFfiAdapter getTransform() =>
      B2TransformFfiAdapter._(_getTransform(_self));

  static final _getPosition = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetPosition_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getPosition() => B2Vec2FfiAdapter._(_getPosition(_self));

  static final _getAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getAngle() => _getAngle(_self);

  static final _getWorldCenter = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetWorldCenter_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getWorldCenter() =>
      B2Vec2FfiAdapter._(_getWorldCenter(_self));

  static final _getLocalCenter = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetLocalCenter_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalCenter() =>
      B2Vec2FfiAdapter._(_getLocalCenter(_self));

  static final _setLinearVelocity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Body_SetLinearVelocity_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void setLinearVelocity(B2Vec2FfiAdapter v) =>
      _setLinearVelocity(_self, v._self);

  static final _getLinearVelocity = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetLinearVelocity_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLinearVelocity() =>
      B2Vec2FfiAdapter._(_getLinearVelocity(_self));

  static final _setAngularVelocity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Body_SetAngularVelocity_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setAngularVelocity(double omega) => _setAngularVelocity(_self, omega);

  static final _getAngularVelocity = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetAngularVelocity_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getAngularVelocity() => _getAngularVelocity(_self);

  static final _applyForce = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Bool)>>('dart_bind_b2Body_ApplyForce_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, bool)>();
  @override
  void applyForce(B2Vec2FfiAdapter force, B2Vec2FfiAdapter point, bool wake) =>
      _applyForce(_self, force._self, point._self, wake);

  static final _applyForceToCenter = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Bool)>>('dart_bind_b2Body_ApplyForceToCenter_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, bool)>();
  @override
  void applyForceToCenter(B2Vec2FfiAdapter force, bool wake) =>
      _applyForceToCenter(_self, force._self, wake);

  static final _applyTorque = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float, Bool)>>(
          'dart_bind_b2Body_ApplyTorque_2')
      .asFunction<void Function(Pointer<Void>, double, bool)>();
  @override
  void applyTorque(double torque, bool awake) =>
      _applyTorque(_self, torque, awake);

  static final _applyLinearImpulse = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Bool)>>('dart_bind_b2Body_ApplyLinearImpulse_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, bool)>();
  @override
  void applyLinearImpulse(
          B2Vec2FfiAdapter impulse, B2Vec2FfiAdapter point, bool wake) =>
      _applyLinearImpulse(_self, impulse._self, point._self, wake);

  static final _applyLinearImpulseToCenter = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Bool)>>('dart_bind_b2Body_ApplyLinearImpulseToCenter_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, bool)>();
  @override
  void applyLinearImpulseToCenter(B2Vec2FfiAdapter impulse, bool wake) =>
      _applyLinearImpulseToCenter(_self, impulse._self, wake);

  static final _applyAngularImpulse = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float, Bool)>>(
          'dart_bind_b2Body_ApplyAngularImpulse_2')
      .asFunction<void Function(Pointer<Void>, double, bool)>();
  @override
  void applyAngularImpulse(double impulse, bool wake) =>
      _applyAngularImpulse(_self, impulse, wake);

  static final _getMass = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetMass_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMass() => _getMass(_self);

  static final _getInertia = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetInertia_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getInertia() => _getInertia(_self);

  static final _getMassData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Body_GetMassData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void getMassData(B2MassDataFfiAdapter data) =>
      _getMassData(_self, data._self);

  static final _setMassData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Body_SetMassData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void setMassData(B2MassDataFfiAdapter data) =>
      _setMassData(_self, data._self);

  static final _resetMassData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Body_ResetMassData_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void resetMassData() => _resetMassData(_self);

  static final _getWorldPoint = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2Body_GetWorldPoint_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getWorldPoint(B2Vec2FfiAdapter localPoint) =>
      B2Vec2FfiAdapter._(_getWorldPoint(_self, localPoint._self));

  static final _getWorldVector = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2Body_GetWorldVector_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getWorldVector(B2Vec2FfiAdapter localVector) =>
      B2Vec2FfiAdapter._(_getWorldVector(_self, localVector._self));

  static final _getLocalPoint = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2Body_GetLocalPoint_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalPoint(B2Vec2FfiAdapter worldPoint) =>
      B2Vec2FfiAdapter._(_getLocalPoint(_self, worldPoint._self));

  static final _getLocalVector = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2Body_GetLocalVector_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalVector(B2Vec2FfiAdapter worldVector) =>
      B2Vec2FfiAdapter._(_getLocalVector(_self, worldVector._self));

  static final _getLinearVelocityFromWorldPoint = _symbols
      .lookup<
              NativeFunction<
                  Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Body_GetLinearVelocityFromWorldPoint_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLinearVelocityFromWorldPoint(
          B2Vec2FfiAdapter worldPoint) =>
      B2Vec2FfiAdapter._(
          _getLinearVelocityFromWorldPoint(_self, worldPoint._self));

  static final _getLinearVelocityFromLocalPoint = _symbols
      .lookup<
              NativeFunction<
                  Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Body_GetLinearVelocityFromLocalPoint_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLinearVelocityFromLocalPoint(
          B2Vec2FfiAdapter localPoint) =>
      B2Vec2FfiAdapter._(
          _getLinearVelocityFromLocalPoint(_self, localPoint._self));

  static final _getLinearDamping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetLinearDamping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getLinearDamping() => _getLinearDamping(_self);

  static final _setLinearDamping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Body_SetLinearDamping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setLinearDamping(double linearDamping) =>
      _setLinearDamping(_self, linearDamping);

  static final _getAngularDamping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetAngularDamping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getAngularDamping() => _getAngularDamping(_self);

  static final _setAngularDamping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Body_SetAngularDamping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setAngularDamping(double angularDamping) =>
      _setAngularDamping(_self, angularDamping);

  static final _getGravityScale = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetGravityScale_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getGravityScale() => _getGravityScale(_self);

  static final _setGravityScale = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Body_SetGravityScale_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setGravityScale(double scale) => _setGravityScale(_self, scale);

  static final _setType = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2Body_SetType_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void setType(B2BodyType type) => _setType(_self, type.index);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2BodyType getType() => _getType(_self).toB2BodyType();

  static final _setBullet = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2Body_SetBullet_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setBullet(bool flag) => _setBullet(_self, flag);

  static final _isBullet = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2Body_IsBullet_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isBullet() => _isBullet(_self);

  static final _setSleepingAllowed = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2Body_SetSleepingAllowed_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setSleepingAllowed(bool flag) => _setSleepingAllowed(_self, flag);

  static final _isSleepingAllowed = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2Body_IsSleepingAllowed_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isSleepingAllowed() => _isSleepingAllowed(_self);

  static final _setAwake = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2Body_SetAwake_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setAwake(bool flag) => _setAwake(_self, flag);

  static final _isAwake = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2Body_IsAwake_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isAwake() => _isAwake(_self);

  static final _setEnabled = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2Body_SetEnabled_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setEnabled(bool flag) => _setEnabled(_self, flag);

  static final _isEnabled = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2Body_IsEnabled_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isEnabled() => _isEnabled(_self);

  static final _setFixedRotation = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2Body_SetFixedRotation_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void setFixedRotation(bool flag) => _setFixedRotation(_self, flag);

  static final _isFixedRotation = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2Body_IsFixedRotation_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isFixedRotation() => _isFixedRotation(_self);

  static final _getFixtureList = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetFixtureList_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2FixtureFfiAdapter getFixtureList() =>
      B2FixtureFfiAdapter._(_getFixtureList(_self));

  static final _getJointList = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetJointList_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointEdgeFfiAdapter getJointList() =>
      B2JointEdgeFfiAdapter._(_getJointList(_self));

  static final _getContactList = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetContactList_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ContactEdgeFfiAdapter getContactList() =>
      B2ContactEdgeFfiAdapter._(_getContactList(_self));

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getNext() => B2BodyFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyUserDataFfiAdapter getUserData() =>
      B2BodyUserDataFfiAdapter._(_getUserData(_self));

  static final _getWorld = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Body_GetWorld_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2WorldFfiAdapter getWorld() => B2WorldFfiAdapter._(_getWorld(_self));

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Body_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);
}

class B2BodyDefFfiAdapter implements B2BodyDefPlatform {
  final Pointer<Void> _self;
  B2BodyDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2BodyDef_b2BodyDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2BodyDefFfiAdapter() : _self = _ctr0();

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2BodyType get_type() => _get_type(_self).toB2BodyType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2BodyDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2BodyType arg0) => _set_type(_self, arg0.index);

  static final _get_position = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_position_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_position() => B2Vec2FfiAdapter._(_get_position(_self));

  static final _set_position = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2BodyDef_set_position_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_position(B2Vec2FfiAdapter arg0) => _set_position(_self, arg0._self);

  static final _get_angle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_angle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_angle() => _get_angle(_self);

  static final _set_angle = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2BodyDef_set_angle_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_angle(double arg0) => _set_angle(_self, arg0);

  static final _get_linearVelocity = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_linearVelocity_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_linearVelocity() =>
      B2Vec2FfiAdapter._(_get_linearVelocity(_self));

  static final _set_linearVelocity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2BodyDef_set_linearVelocity_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_linearVelocity(B2Vec2FfiAdapter arg0) =>
      _set_linearVelocity(_self, arg0._self);

  static final _get_angularVelocity = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_angularVelocity_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_angularVelocity() => _get_angularVelocity(_self);

  static final _set_angularVelocity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2BodyDef_set_angularVelocity_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_angularVelocity(double arg0) => _set_angularVelocity(_self, arg0);

  static final _get_linearDamping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_linearDamping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_linearDamping() => _get_linearDamping(_self);

  static final _set_linearDamping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2BodyDef_set_linearDamping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_linearDamping(double arg0) => _set_linearDamping(_self, arg0);

  static final _get_angularDamping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_angularDamping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_angularDamping() => _get_angularDamping(_self);

  static final _set_angularDamping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2BodyDef_set_angularDamping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_angularDamping(double arg0) => _set_angularDamping(_self, arg0);

  static final _get_allowSleep = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_allowSleep_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_allowSleep() => _get_allowSleep(_self);

  static final _set_allowSleep = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2BodyDef_set_allowSleep_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_allowSleep(bool arg0) => _set_allowSleep(_self, arg0);

  static final _get_awake = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_awake_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_awake() => _get_awake(_self);

  static final _set_awake = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2BodyDef_set_awake_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_awake(bool arg0) => _set_awake(_self, arg0);

  static final _get_fixedRotation = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_fixedRotation_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_fixedRotation() => _get_fixedRotation(_self);

  static final _set_fixedRotation = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2BodyDef_set_fixedRotation_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_fixedRotation(bool arg0) => _set_fixedRotation(_self, arg0);

  static final _get_bullet = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_bullet_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_bullet() => _get_bullet(_self);

  static final _set_bullet = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2BodyDef_set_bullet_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_bullet(bool arg0) => _set_bullet(_self, arg0);

  static final _get_enabled = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_enabled_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_enabled() => _get_enabled(_self);

  static final _set_enabled = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2BodyDef_set_enabled_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_enabled(bool arg0) => _set_enabled(_self, arg0);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyUserDataFfiAdapter get_userData() =>
      B2BodyUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2BodyDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2BodyUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_gravityScale = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef_get_gravityScale_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_gravityScale() => _get_gravityScale(_self);

  static final _set_gravityScale = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2BodyDef_set_gravityScale_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_gravityScale(double arg0) => _set_gravityScale(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2BodyDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2FilterFfiAdapter implements B2FilterPlatform {
  final Pointer<Void> _self;
  B2FilterFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2Filter_b2Filter_0')
      .asFunction<Pointer<Void> Function()>();

  B2FilterFfiAdapter() : _self = _ctr0();

  static final _get_categoryBits = _symbols
      .lookup<NativeFunction<Uint16 Function(Pointer<Void>)>>(
          'dart_bind_b2Filter_get_categoryBits_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_categoryBits() => _get_categoryBits(_self);

  static final _set_categoryBits = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint16)>>(
          'dart_bind_b2Filter_set_categoryBits_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_categoryBits(int arg0) => _set_categoryBits(_self, arg0);

  static final _get_maskBits = _symbols
      .lookup<NativeFunction<Uint16 Function(Pointer<Void>)>>(
          'dart_bind_b2Filter_get_maskBits_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_maskBits() => _get_maskBits(_self);

  static final _set_maskBits = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint16)>>(
          'dart_bind_b2Filter_set_maskBits_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_maskBits(int arg0) => _set_maskBits(_self, arg0);

  static final _get_groupIndex = _symbols
      .lookup<NativeFunction<Int16 Function(Pointer<Void>)>>(
          'dart_bind_b2Filter_get_groupIndex_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_groupIndex() => _get_groupIndex(_self);

  static final _set_groupIndex = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int16)>>(
          'dart_bind_b2Filter_set_groupIndex_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_groupIndex(int arg0) => _set_groupIndex(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Filter___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2AABBFfiAdapter implements B2AABBPlatform {
  final Pointer<Void> _self;
  B2AABBFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2AABB_b2AABB_0')
      .asFunction<Pointer<Void> Function()>();

  B2AABBFfiAdapter() : _self = _ctr0();

  static final _isValid = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2AABB_IsValid_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isValid() => _isValid(_self);

  static final _getCenter = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2AABB_GetCenter_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getCenter() => B2Vec2FfiAdapter._(_getCenter(_self));

  static final _getExtents = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2AABB_GetExtents_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getExtents() => B2Vec2FfiAdapter._(_getExtents(_self));

  static final _getPerimeter = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2AABB_GetPerimeter_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getPerimeter() => _getPerimeter(_self);

  static final _combine1 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2AABB_Combine_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void combine1(B2AABBFfiAdapter aabb1) => _combine1(_self, aabb1._self);

  static final _combine2 = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2AABB_Combine_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  void combine2(B2AABBFfiAdapter aabb1, B2AABBFfiAdapter aabb2) =>
      _combine2(_self, aabb1._self, aabb2._self);

  static final _contains = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2AABB_Contains_1')
      .asFunction<bool Function(Pointer<Void>, Pointer<Void>)>();
  @override
  bool contains(B2AABBFfiAdapter aabb) => _contains(_self, aabb._self);

  static final _rayCast = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2AABB_RayCast_2')
      .asFunction<bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  bool rayCast(
          B2RayCastOutputFfiAdapter output, B2RayCastInputFfiAdapter input) =>
      _rayCast(_self, output._self, input._self);

  static final _get_lowerBound = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2AABB_get_lowerBound_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_lowerBound() =>
      B2Vec2FfiAdapter._(_get_lowerBound(_self));

  static final _set_lowerBound = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2AABB_set_lowerBound_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_lowerBound(B2Vec2FfiAdapter arg0) =>
      _set_lowerBound(_self, arg0._self);

  static final _get_upperBound = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2AABB_get_upperBound_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_upperBound() =>
      B2Vec2FfiAdapter._(_get_upperBound(_self));

  static final _set_upperBound = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2AABB_set_upperBound_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_upperBound(B2Vec2FfiAdapter arg0) =>
      _set_upperBound(_self, arg0._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2AABB___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2CircleShapeFfiAdapter
    implements B2CircleShapePlatform, B2ShapeFfiAdapter {
  final Pointer<Void> _self;
  B2CircleShapeFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2CircleShape_b2CircleShape_0')
      .asFunction<Pointer<Void> Function()>();

  B2CircleShapeFfiAdapter() : _self = _ctr0();

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2CircleShape_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType getType() => _getType(_self).toB2ShapeType();

  static final _getChildCount = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2CircleShape_GetChildCount_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getChildCount() => _getChildCount(_self);

  static final _testPoint = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2CircleShape_TestPoint_2')
      .asFunction<bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  bool testPoint(B2TransformFfiAdapter xf, B2Vec2FfiAdapter p) =>
      _testPoint(_self, xf._self, p._self);

  static final _rayCast = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Pointer<Void>, Int32)>>('dart_bind_b2CircleShape_RayCast_4')
      .asFunction<
          bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
              Pointer<Void>, int)>();
  @override
  bool rayCast(B2RayCastOutputFfiAdapter output, B2RayCastInputFfiAdapter input,
          B2TransformFfiAdapter transform, int childIndex) =>
      _rayCast(_self, output._self, input._self, transform._self, childIndex);

  static final _computeAABB = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Int32)>>('dart_bind_b2CircleShape_ComputeAABB_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>();
  @override
  void computeAABB(
          B2AABBFfiAdapter aabb, B2TransformFfiAdapter xf, int childIndex) =>
      _computeAABB(_self, aabb._self, xf._self, childIndex);

  static final _computeMass = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Float)>>('dart_bind_b2CircleShape_ComputeMass_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, double)>();
  @override
  void computeMass(B2MassDataFfiAdapter massData, double density) =>
      _computeMass(_self, massData._self, density);

  static final _get_m_p = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2CircleShape_get_m_p_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_m_p() => B2Vec2FfiAdapter._(_get_m_p(_self));

  static final _set_m_p = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2CircleShape_set_m_p_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_m_p(B2Vec2FfiAdapter arg0) => _set_m_p(_self, arg0._self);

  static final _get_m_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2CircleShape_get_m_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType get_m_type() => _get_m_type(_self).toB2ShapeType();

  static final _set_m_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2CircleShape_set_m_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_m_type(B2ShapeType arg0) => _set_m_type(_self, arg0.index);

  static final _get_m_radius = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2CircleShape_get_m_radius_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_m_radius() => _get_m_radius(_self);

  static final _set_m_radius = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2CircleShape_set_m_radius_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_m_radius(double arg0) => _set_m_radius(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2CircleShape___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2EdgeShapeFfiAdapter implements B2EdgeShapePlatform, B2ShapeFfiAdapter {
  final Pointer<Void> _self;
  B2EdgeShapeFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2EdgeShape_b2EdgeShape_0')
      .asFunction<Pointer<Void> Function()>();

  B2EdgeShapeFfiAdapter() : _self = _ctr0();

  static final _setOneSided = _symbols
      .lookup<
          NativeFunction<
              Void Function(
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2EdgeShape_SetOneSided_4')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
              Pointer<Void>, Pointer<Void>)>();
  @override
  void setOneSided(B2Vec2FfiAdapter v0, B2Vec2FfiAdapter v1,
          B2Vec2FfiAdapter v2, B2Vec2FfiAdapter v3) =>
      _setOneSided(_self, v0._self, v1._self, v2._self, v3._self);

  static final _setTwoSided = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2EdgeShape_SetTwoSided_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  void setTwoSided(B2Vec2FfiAdapter v1, B2Vec2FfiAdapter v2) =>
      _setTwoSided(_self, v1._self, v2._self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType getType() => _getType(_self).toB2ShapeType();

  static final _getChildCount = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_GetChildCount_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getChildCount() => _getChildCount(_self);

  static final _testPoint = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2EdgeShape_TestPoint_2')
      .asFunction<bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  bool testPoint(B2TransformFfiAdapter xf, B2Vec2FfiAdapter p) =>
      _testPoint(_self, xf._self, p._self);

  static final _rayCast = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Pointer<Void>, Int32)>>('dart_bind_b2EdgeShape_RayCast_4')
      .asFunction<
          bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
              Pointer<Void>, int)>();
  @override
  bool rayCast(B2RayCastOutputFfiAdapter output, B2RayCastInputFfiAdapter input,
          B2TransformFfiAdapter transform, int childIndex) =>
      _rayCast(_self, output._self, input._self, transform._self, childIndex);

  static final _computeAABB = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Int32)>>('dart_bind_b2EdgeShape_ComputeAABB_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>();
  @override
  void computeAABB(
          B2AABBFfiAdapter aabb, B2TransformFfiAdapter xf, int childIndex) =>
      _computeAABB(_self, aabb._self, xf._self, childIndex);

  static final _computeMass = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Float)>>('dart_bind_b2EdgeShape_ComputeMass_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, double)>();
  @override
  void computeMass(B2MassDataFfiAdapter massData, double density) =>
      _computeMass(_self, massData._self, density);

  static final _get_m_vertex1 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_get_m_vertex1_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_m_vertex1() => B2Vec2FfiAdapter._(_get_m_vertex1(_self));

  static final _set_m_vertex1 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_set_m_vertex1_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_m_vertex1(B2Vec2FfiAdapter arg0) =>
      _set_m_vertex1(_self, arg0._self);

  static final _get_m_vertex2 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_get_m_vertex2_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_m_vertex2() => B2Vec2FfiAdapter._(_get_m_vertex2(_self));

  static final _set_m_vertex2 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_set_m_vertex2_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_m_vertex2(B2Vec2FfiAdapter arg0) =>
      _set_m_vertex2(_self, arg0._self);

  static final _get_m_vertex0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_get_m_vertex0_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_m_vertex0() => B2Vec2FfiAdapter._(_get_m_vertex0(_self));

  static final _set_m_vertex0 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_set_m_vertex0_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_m_vertex0(B2Vec2FfiAdapter arg0) =>
      _set_m_vertex0(_self, arg0._self);

  static final _get_m_vertex3 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_get_m_vertex3_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_m_vertex3() => B2Vec2FfiAdapter._(_get_m_vertex3(_self));

  static final _set_m_vertex3 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_set_m_vertex3_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_m_vertex3(B2Vec2FfiAdapter arg0) =>
      _set_m_vertex3(_self, arg0._self);

  static final _get_m_oneSided = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_get_m_oneSided_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_m_oneSided() => _get_m_oneSided(_self);

  static final _set_m_oneSided = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2EdgeShape_set_m_oneSided_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_m_oneSided(bool arg0) => _set_m_oneSided(_self, arg0);

  static final _get_m_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_get_m_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType get_m_type() => _get_m_type(_self).toB2ShapeType();

  static final _set_m_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2EdgeShape_set_m_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_m_type(B2ShapeType arg0) => _set_m_type(_self, arg0.index);

  static final _get_m_radius = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2EdgeShape_get_m_radius_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_m_radius() => _get_m_radius(_self);

  static final _set_m_radius = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2EdgeShape_set_m_radius_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_m_radius(double arg0) => _set_m_radius(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2EdgeShape___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2JointUserDataFfiAdapter implements B2JointUserDataPlatform {
  final Pointer<Void> _self;
  B2JointUserDataFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _get_pointer = _symbols
      .lookup<NativeFunction<Uint32 Function(Pointer<Void>)>>(
          'dart_bind_b2JointUserData_get_pointer_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_pointer() => _get_pointer(_self);

  static final _set_pointer = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint32)>>(
          'dart_bind_b2JointUserData_set_pointer_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_pointer(int arg0) => _set_pointer(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2JointUserData___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2WeldJointFfiAdapter implements B2WeldJointPlatform, B2JointFfiAdapter {
  final Pointer<Void> _self;
  B2WeldJointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getLocalAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetLocalAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorA() =>
      B2Vec2FfiAdapter._(_getLocalAnchorA(_self));

  static final _getLocalAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetLocalAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorB() =>
      B2Vec2FfiAdapter._(_getLocalAnchorB(_self));

  static final _getReferenceAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetReferenceAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getReferenceAngle() => _getReferenceAngle(_self);

  static final _setStiffness = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WeldJoint_SetStiffness_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setStiffness(double stiffness) => _setStiffness(_self, stiffness);

  static final _getStiffness = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetStiffness_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getStiffness() => _getStiffness(_self);

  static final _setDamping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WeldJoint_SetDamping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setDamping(double damping) => _setDamping(_self, damping);

  static final _getDamping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetDamping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getDamping() => _getDamping(_self);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WeldJoint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WeldJoint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2WeldJointDefFfiAdapter
    implements B2WeldJointDefPlatform, B2JointDefFfiAdapter {
  final Pointer<Void> _self;
  B2WeldJointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2WeldJointDef_b2WeldJointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2WeldJointDefFfiAdapter() : _self = _ctr0();

  static final _initialize = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2WeldJointDef_Initialize_3')
      .asFunction<
          void Function(
              Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  void initialize(B2BodyFfiAdapter bodyA, B2BodyFfiAdapter bodyB,
          B2Vec2FfiAdapter anchor) =>
      _initialize(_self, bodyA._self, bodyB._self, anchor._self);

  static final _get_localAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_get_localAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorA() =>
      B2Vec2FfiAdapter._(_get_localAnchorA(_self));

  static final _set_localAnchorA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_set_localAnchorA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorA(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorA(_self, arg0._self);

  static final _get_localAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_get_localAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorB() =>
      B2Vec2FfiAdapter._(_get_localAnchorB(_self));

  static final _set_localAnchorB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_set_localAnchorB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorB(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorB(_self, arg0._self);

  static final _get_referenceAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_get_referenceAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_referenceAngle() => _get_referenceAngle(_self);

  static final _set_referenceAngle = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WeldJointDef_set_referenceAngle_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_referenceAngle(double arg0) => _set_referenceAngle(_self, arg0);

  static final _get_stiffness = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_get_stiffness_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_stiffness() => _get_stiffness(_self);

  static final _set_stiffness = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WeldJointDef_set_stiffness_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_stiffness(double arg0) => _set_stiffness(_self, arg0);

  static final _get_damping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_get_damping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_damping() => _get_damping(_self);

  static final _set_damping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WeldJointDef_set_damping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_damping(double arg0) => _set_damping(_self, arg0);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2WeldJointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2WeldJointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2WeldJointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ChainShapeFfiAdapter
    implements B2ChainShapePlatform, B2ShapeFfiAdapter {
  final Pointer<Void> _self;
  B2ChainShapeFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2ChainShape_b2ChainShape_0')
      .asFunction<Pointer<Void> Function()>();

  B2ChainShapeFfiAdapter() : _self = _ctr0();

  static final _clear = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2ChainShape_Clear_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void clear() => _clear(_self);

  static final _createLoop = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Int32)>>('dart_bind_b2ChainShape_CreateLoop_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, int)>();
  @override
  void createLoop(B2Vec2FfiAdapter vertices, int count) =>
      _createLoop(_self, vertices._self, count);

  static final _createChain = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Int32, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2ChainShape_CreateChain_4')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, int, Pointer<Void>,
              Pointer<Void>)>();
  @override
  void createChain(B2Vec2FfiAdapter vertices, int count,
          B2Vec2FfiAdapter prevVertex, B2Vec2FfiAdapter nextVertex) =>
      _createChain(
          _self, vertices._self, count, prevVertex._self, nextVertex._self);

  static final _getChildEdge = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Int32)>>('dart_bind_b2ChainShape_GetChildEdge_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, int)>();
  @override
  void getChildEdge(B2EdgeShapeFfiAdapter edge, int index) =>
      _getChildEdge(_self, edge._self, index);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2ChainShape_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType getType() => _getType(_self).toB2ShapeType();

  static final _getChildCount = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2ChainShape_GetChildCount_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getChildCount() => _getChildCount(_self);

  static final _testPoint = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2ChainShape_TestPoint_2')
      .asFunction<bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  bool testPoint(B2TransformFfiAdapter xf, B2Vec2FfiAdapter p) =>
      _testPoint(_self, xf._self, p._self);

  static final _rayCast = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Pointer<Void>, Int32)>>('dart_bind_b2ChainShape_RayCast_4')
      .asFunction<
          bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
              Pointer<Void>, int)>();
  @override
  bool rayCast(B2RayCastOutputFfiAdapter output, B2RayCastInputFfiAdapter input,
          B2TransformFfiAdapter transform, int childIndex) =>
      _rayCast(_self, output._self, input._self, transform._self, childIndex);

  static final _computeAABB = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Int32)>>('dart_bind_b2ChainShape_ComputeAABB_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>();
  @override
  void computeAABB(
          B2AABBFfiAdapter aabb, B2TransformFfiAdapter xf, int childIndex) =>
      _computeAABB(_self, aabb._self, xf._self, childIndex);

  static final _computeMass = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Float)>>('dart_bind_b2ChainShape_ComputeMass_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, double)>();
  @override
  void computeMass(B2MassDataFfiAdapter massData, double density) =>
      _computeMass(_self, massData._self, density);

  static final _get_m_vertices = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ChainShape_get_m_vertices_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_m_vertices() =>
      B2Vec2FfiAdapter._(_get_m_vertices(_self));

  static final _set_m_vertices = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ChainShape_set_m_vertices_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_m_vertices(B2Vec2FfiAdapter arg0) =>
      _set_m_vertices(_self, arg0._self);

  static final _get_m_count = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2ChainShape_get_m_count_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_m_count() => _get_m_count(_self);

  static final _set_m_count = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2ChainShape_set_m_count_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_m_count(int arg0) => _set_m_count(_self, arg0);

  static final _get_m_prevVertex = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ChainShape_get_m_prevVertex_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_m_prevVertex() =>
      B2Vec2FfiAdapter._(_get_m_prevVertex(_self));

  static final _set_m_prevVertex = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ChainShape_set_m_prevVertex_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_m_prevVertex(B2Vec2FfiAdapter arg0) =>
      _set_m_prevVertex(_self, arg0._self);

  static final _get_m_nextVertex = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ChainShape_get_m_nextVertex_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_m_nextVertex() =>
      B2Vec2FfiAdapter._(_get_m_nextVertex(_self));

  static final _set_m_nextVertex = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ChainShape_set_m_nextVertex_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_m_nextVertex(B2Vec2FfiAdapter arg0) =>
      _set_m_nextVertex(_self, arg0._self);

  static final _get_m_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2ChainShape_get_m_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType get_m_type() => _get_m_type(_self).toB2ShapeType();

  static final _set_m_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2ChainShape_set_m_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_m_type(B2ShapeType arg0) => _set_m_type(_self, arg0.index);

  static final _get_m_radius = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2ChainShape_get_m_radius_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_m_radius() => _get_m_radius(_self);

  static final _set_m_radius = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2ChainShape_set_m_radius_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_m_radius(double arg0) => _set_m_radius(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2ChainShape___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ColorFfiAdapter implements B2ColorPlatform {
  final Pointer<Void> _self;
  B2ColorFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2Color_b2Color_0')
      .asFunction<Pointer<Void> Function()>();

  B2ColorFfiAdapter() : _self = _ctr0();

  static final _ctr3 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Float, Float, Float)>>(
          'dart_bind_b2Color_b2Color_3')
      .asFunction<Pointer<Void> Function(double, double, double)>();

  B2ColorFfiAdapter.from3(double r, double g, double b)
      : _self = _ctr3(r, g, b);

  static final _set = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Float, Float,
                  Float)>>('dart_bind_b2Color_Set_3')
      .asFunction<void Function(Pointer<Void>, double, double, double)>();
  @override
  void set(double ri, double gi, double bi) => _set(_self, ri, gi, bi);

  static final _get_r = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Color_get_r_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_r() => _get_r(_self);

  static final _set_r = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Color_set_r_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_r(double arg0) => _set_r(_self, arg0);

  static final _get_g = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Color_get_g_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_g() => _get_g(_self);

  static final _set_g = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Color_set_g_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_g(double arg0) => _set_g(_self, arg0);

  static final _get_b = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Color_get_b_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_b() => _get_b(_self);

  static final _set_b = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Color_set_b_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_b(double arg0) => _set_b(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Color___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ContactEdgeFfiAdapter implements B2ContactEdgePlatform {
  final Pointer<Void> _self;
  B2ContactEdgeFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2ContactEdge_b2ContactEdge_0')
      .asFunction<Pointer<Void> Function()>();

  B2ContactEdgeFfiAdapter() : _self = _ctr0();

  static final _get_other = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ContactEdge_get_other_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_other() => B2BodyFfiAdapter._(_get_other(_self));

  static final _set_other = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ContactEdge_set_other_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_other(B2BodyFfiAdapter arg0) => _set_other(_self, arg0._self);

  static final _get_contact = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ContactEdge_get_contact_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ContactFfiAdapter get_contact() =>
      B2ContactFfiAdapter._(_get_contact(_self));

  static final _set_contact = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ContactEdge_set_contact_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_contact(B2ContactFfiAdapter arg0) => _set_contact(_self, arg0._self);

  static final _get_prev = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ContactEdge_get_prev_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ContactEdgeFfiAdapter get_prev() =>
      B2ContactEdgeFfiAdapter._(_get_prev(_self));

  static final _set_prev = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ContactEdge_set_prev_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_prev(B2ContactEdgeFfiAdapter arg0) => _set_prev(_self, arg0._self);

  static final _get_next = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ContactEdge_get_next_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ContactEdgeFfiAdapter get_next() =>
      B2ContactEdgeFfiAdapter._(_get_next(_self));

  static final _set_next = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ContactEdge_set_next_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_next(B2ContactEdgeFfiAdapter arg0) => _set_next(_self, arg0._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2ContactEdge___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ContactFeatureFfiAdapter implements B2ContactFeaturePlatform {
  final Pointer<Void> _self;
  B2ContactFeatureFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _get_indexA = _symbols
      .lookup<NativeFunction<Uint8 Function(Pointer<Void>)>>(
          'dart_bind_b2ContactFeature_get_indexA_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_indexA() => _get_indexA(_self);

  static final _set_indexA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint8)>>(
          'dart_bind_b2ContactFeature_set_indexA_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_indexA(int arg0) => _set_indexA(_self, arg0);

  static final _get_indexB = _symbols
      .lookup<NativeFunction<Uint8 Function(Pointer<Void>)>>(
          'dart_bind_b2ContactFeature_get_indexB_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_indexB() => _get_indexB(_self);

  static final _set_indexB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint8)>>(
          'dart_bind_b2ContactFeature_set_indexB_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_indexB(int arg0) => _set_indexB(_self, arg0);

  static final _get_typeA = _symbols
      .lookup<NativeFunction<Uint8 Function(Pointer<Void>)>>(
          'dart_bind_b2ContactFeature_get_typeA_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_typeA() => _get_typeA(_self);

  static final _set_typeA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint8)>>(
          'dart_bind_b2ContactFeature_set_typeA_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_typeA(int arg0) => _set_typeA(_self, arg0);

  static final _get_typeB = _symbols
      .lookup<NativeFunction<Uint8 Function(Pointer<Void>)>>(
          'dart_bind_b2ContactFeature_get_typeB_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_typeB() => _get_typeB(_self);

  static final _set_typeB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint8)>>(
          'dart_bind_b2ContactFeature_set_typeB_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_typeB(int arg0) => _set_typeB(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2ContactFeature___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ContactFilterFfiAdapter implements B2ContactFilterPlatform {
  final Pointer<Void> _self;
  B2ContactFilterFfiAdapter._(Pointer<Void> self) : _self = self;

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2ContactFilter___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class JSContactFilterFfiAdapter implements JSContactFilterPlatform {
  final Pointer<Void> _self;
  JSContactFilterFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_JSContactFilter_JSContactFilter_0')
      .asFunction<Pointer<Void> Function()>();

  JSContactFilterFfiAdapter() : _self = _ctr0();

  static final _shouldCollide = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_JSContactFilter_ShouldCollide_2')
      .asFunction<bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  bool shouldCollide(
          B2FixtureFfiAdapter fixtureA, B2FixtureFfiAdapter fixtureB) =>
      _shouldCollide(_self, fixtureA._self, fixtureB._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_JSContactFilter___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ContactIDFfiAdapter implements B2ContactIDPlatform {
  final Pointer<Void> _self;
  B2ContactIDFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _get_cf = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ContactID_get_cf_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ContactFeatureFfiAdapter get_cf() =>
      B2ContactFeatureFfiAdapter._(_get_cf(_self));

  static final _set_cf = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ContactID_set_cf_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_cf(B2ContactFeatureFfiAdapter arg0) => _set_cf(_self, arg0._self);

  static final _get_key = _symbols
      .lookup<NativeFunction<Uint32 Function(Pointer<Void>)>>(
          'dart_bind_b2ContactID_get_key_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_key() => _get_key(_self);

  static final _set_key = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint32)>>(
          'dart_bind_b2ContactID_set_key_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_key(int arg0) => _set_key(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2ContactID___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ContactImpulseFfiAdapter implements B2ContactImpulsePlatform {
  final Pointer<Void> _self;
  B2ContactImpulseFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _get_normalImpulses = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2ContactImpulse_get_normalImpulses_1')
      .asFunction<double Function(Pointer<Void>, int)>();
  @override
  double get_normalImpulses(int arg0) => _get_normalImpulses(_self, arg0);

  static final _set_normalImpulses = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32, Float)>>(
          'dart_bind_b2ContactImpulse_set_normalImpulses_2')
      .asFunction<void Function(Pointer<Void>, int, double)>();
  @override
  void set_normalImpulses(int arg0, double arg1) =>
      _set_normalImpulses(_self, arg0, arg1);

  static final _get_tangentImpulses = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2ContactImpulse_get_tangentImpulses_1')
      .asFunction<double Function(Pointer<Void>, int)>();
  @override
  double get_tangentImpulses(int arg0) => _get_tangentImpulses(_self, arg0);

  static final _set_tangentImpulses = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32, Float)>>(
          'dart_bind_b2ContactImpulse_set_tangentImpulses_2')
      .asFunction<void Function(Pointer<Void>, int, double)>();
  @override
  void set_tangentImpulses(int arg0, double arg1) =>
      _set_tangentImpulses(_self, arg0, arg1);

  static final _get_count = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2ContactImpulse_get_count_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_count() => _get_count(_self);

  static final _set_count = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2ContactImpulse_set_count_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_count(int arg0) => _set_count(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2ContactImpulse___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2DestructionListenerFfiAdapter implements B2DestructionListenerPlatform {
  final Pointer<Void> _self;
  B2DestructionListenerFfiAdapter._(Pointer<Void> self) : _self = self;

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2DestructionListener___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2DestructionListenerWrapperFfiAdapter
    implements B2DestructionListenerWrapperPlatform {
  final Pointer<Void> _self;
  B2DestructionListenerWrapperFfiAdapter._(Pointer<Void> self) : _self = self;

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2DestructionListenerWrapper___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class JSDestructionListenerFfiAdapter implements JSDestructionListenerPlatform {
  final Pointer<Void> _self;
  JSDestructionListenerFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_JSDestructionListener_JSDestructionListener_0')
      .asFunction<Pointer<Void> Function()>();

  JSDestructionListenerFfiAdapter() : _self = _ctr0();

  static final _sayGoodbyeJoint = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_JSDestructionListener_SayGoodbyeJoint_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void sayGoodbyeJoint(B2JointFfiAdapter joint) =>
      _sayGoodbyeJoint(_self, joint._self);

  static final _sayGoodbyeFixture = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_JSDestructionListener_SayGoodbyeFixture_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void sayGoodbyeFixture(B2FixtureFfiAdapter joint) =>
      _sayGoodbyeFixture(_self, joint._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_JSDestructionListener___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2DistanceJointFfiAdapter
    implements B2DistanceJointPlatform, B2JointFfiAdapter {
  final Pointer<Void> _self;
  B2DistanceJointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getLocalAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetLocalAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorA() =>
      B2Vec2FfiAdapter._(_getLocalAnchorA(_self));

  static final _getLocalAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetLocalAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorB() =>
      B2Vec2FfiAdapter._(_getLocalAnchorB(_self));

  static final _getLength = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetLength_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getLength() => _getLength(_self);

  static final _setLength = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJoint_SetLength_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setLength(double length) => _setLength(_self, length);

  static final _getMinLength = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetMinLength_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMinLength() => _getMinLength(_self);

  static final _setMinLength = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJoint_SetMinLength_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMinLength(double minLength) => _setMinLength(_self, minLength);

  static final _getMaxLength = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetMaxLength_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMaxLength() => _getMaxLength(_self);

  static final _setMaxLength = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJoint_SetMaxLength_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMaxLength(double maxLength) => _setMaxLength(_self, maxLength);

  static final _getCurrentLength = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetCurrentLength_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getCurrentLength() => _getCurrentLength(_self);

  static final _setStiffness = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJoint_SetStiffness_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setStiffness(double stiffness) => _setStiffness(_self, stiffness);

  static final _getStiffness = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetStiffness_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getStiffness() => _getStiffness(_self);

  static final _setDamping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJoint_SetDamping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setDamping(double damping) => _setDamping(_self, damping);

  static final _getDamping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetDamping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getDamping() => _getDamping(_self);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJoint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJoint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2DistanceJointDefFfiAdapter
    implements B2DistanceJointDefPlatform, B2JointDefFfiAdapter {
  final Pointer<Void> _self;
  B2DistanceJointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2DistanceJointDef_b2DistanceJointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2DistanceJointDefFfiAdapter() : _self = _ctr0();

  static final _initialize = _symbols
      .lookup<
          NativeFunction<
              Void Function(
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2DistanceJointDef_Initialize_4')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
              Pointer<Void>, Pointer<Void>)>();
  @override
  void initialize(B2BodyFfiAdapter bodyA, B2BodyFfiAdapter bodyB,
          B2Vec2FfiAdapter anchorA, B2Vec2FfiAdapter anchorB) =>
      _initialize(
          _self, bodyA._self, bodyB._self, anchorA._self, anchorB._self);

  static final _get_localAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_localAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorA() =>
      B2Vec2FfiAdapter._(_get_localAnchorA(_self));

  static final _set_localAnchorA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_set_localAnchorA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorA(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorA(_self, arg0._self);

  static final _get_localAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_localAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorB() =>
      B2Vec2FfiAdapter._(_get_localAnchorB(_self));

  static final _set_localAnchorB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_set_localAnchorB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorB(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorB(_self, arg0._self);

  static final _get_length = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_length_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_length() => _get_length(_self);

  static final _set_length = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJointDef_set_length_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_length(double arg0) => _set_length(_self, arg0);

  static final _get_minLength = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_minLength_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_minLength() => _get_minLength(_self);

  static final _set_minLength = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJointDef_set_minLength_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_minLength(double arg0) => _set_minLength(_self, arg0);

  static final _get_maxLength = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_maxLength_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_maxLength() => _get_maxLength(_self);

  static final _set_maxLength = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJointDef_set_maxLength_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_maxLength(double arg0) => _set_maxLength(_self, arg0);

  static final _get_stiffness = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_stiffness_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_stiffness() => _get_stiffness(_self);

  static final _set_stiffness = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJointDef_set_stiffness_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_stiffness(double arg0) => _set_stiffness(_self, arg0);

  static final _get_damping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_damping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_damping() => _get_damping(_self);

  static final _set_damping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2DistanceJointDef_set_damping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_damping(double arg0) => _set_damping(_self, arg0);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2DistanceJointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2DistanceJointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2DistanceJointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2DrawFfiAdapter implements B2DrawPlatform {
  final Pointer<Void> _self;
  B2DrawFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _setFlags = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint32)>>(
          'dart_bind_b2Draw_SetFlags_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void setFlags(int flags) => _setFlags(_self, flags);

  static final _getFlags = _symbols
      .lookup<NativeFunction<Uint32 Function(Pointer<Void>)>>(
          'dart_bind_b2Draw_GetFlags_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getFlags() => _getFlags(_self);

  static final _appendFlags = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint32)>>(
          'dart_bind_b2Draw_AppendFlags_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void appendFlags(int flags) => _appendFlags(_self, flags);

  static final _clearFlags = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Uint32)>>(
          'dart_bind_b2Draw_ClearFlags_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void clearFlags(int flags) => _clearFlags(_self, flags);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Draw___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class JSDrawFfiAdapter implements JSDrawPlatform {
  final Pointer<Void> _self;
  JSDrawFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_JSDraw_JSDraw_0')
      .asFunction<Pointer<Void> Function()>();

  JSDrawFfiAdapter() : _self = _ctr0();

  static final _drawPolygon = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Int32,
                  Pointer<Void>)>>('dart_bind_JSDraw_DrawPolygon_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, int, Pointer<Void>)>();
  @override
  void drawPolygon(B2Vec2FfiAdapter vertices, int vertexCount,
          B2ColorFfiAdapter color) =>
      _drawPolygon(_self, vertices._self, vertexCount, color._self);

  static final _drawSolidPolygon = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Int32,
                  Pointer<Void>)>>('dart_bind_JSDraw_DrawSolidPolygon_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, int, Pointer<Void>)>();
  @override
  void drawSolidPolygon(B2Vec2FfiAdapter vertices, int vertexCount,
          B2ColorFfiAdapter color) =>
      _drawSolidPolygon(_self, vertices._self, vertexCount, color._self);

  static final _drawCircle = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Float,
                  Pointer<Void>)>>('dart_bind_JSDraw_DrawCircle_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, double, Pointer<Void>)>();
  @override
  void drawCircle(
          B2Vec2FfiAdapter center, double radius, B2ColorFfiAdapter color) =>
      _drawCircle(_self, center._self, radius, color._self);

  static final _drawSolidCircle = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Float, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_JSDraw_DrawSolidCircle_4')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, double, Pointer<Void>,
              Pointer<Void>)>();
  @override
  void drawSolidCircle(B2Vec2FfiAdapter center, double radius,
          B2Vec2FfiAdapter axis, B2ColorFfiAdapter color) =>
      _drawSolidCircle(_self, center._self, radius, axis._self, color._self);

  static final _drawSegment = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_JSDraw_DrawSegment_3')
      .asFunction<
          void Function(
              Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  void drawSegment(
          B2Vec2FfiAdapter p1, B2Vec2FfiAdapter p2, B2ColorFfiAdapter color) =>
      _drawSegment(_self, p1._self, p2._self, color._self);

  static final _drawTransform = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_JSDraw_DrawTransform_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void drawTransform(B2TransformFfiAdapter xf) =>
      _drawTransform(_self, xf._self);

  static final _drawPoint = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Float,
                  Pointer<Void>)>>('dart_bind_JSDraw_DrawPoint_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, double, Pointer<Void>)>();
  @override
  void drawPoint(B2Vec2FfiAdapter p, double size, B2ColorFfiAdapter color) =>
      _drawPoint(_self, p._self, size, color._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_JSDraw___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2FrictionJointFfiAdapter
    implements B2FrictionJointPlatform, B2JointFfiAdapter {
  final Pointer<Void> _self;
  B2FrictionJointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getLocalAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetLocalAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorA() =>
      B2Vec2FfiAdapter._(_getLocalAnchorA(_self));

  static final _getLocalAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetLocalAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorB() =>
      B2Vec2FfiAdapter._(_getLocalAnchorB(_self));

  static final _setMaxForce = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2FrictionJoint_SetMaxForce_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMaxForce(double force) => _setMaxForce(_self, force);

  static final _getMaxForce = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetMaxForce_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMaxForce() => _getMaxForce(_self);

  static final _setMaxTorque = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2FrictionJoint_SetMaxTorque_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMaxTorque(double torque) => _setMaxTorque(_self, torque);

  static final _getMaxTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetMaxTorque_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMaxTorque() => _getMaxTorque(_self);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2FrictionJoint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2FrictionJoint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2FrictionJointDefFfiAdapter
    implements B2FrictionJointDefPlatform, B2JointDefFfiAdapter {
  final Pointer<Void> _self;
  B2FrictionJointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2FrictionJointDef_b2FrictionJointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2FrictionJointDefFfiAdapter() : _self = _ctr0();

  static final _initialize = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2FrictionJointDef_Initialize_3')
      .asFunction<
          void Function(
              Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  void initialize(B2BodyFfiAdapter bodyA, B2BodyFfiAdapter bodyB,
          B2Vec2FfiAdapter anchor) =>
      _initialize(_self, bodyA._self, bodyB._self, anchor._self);

  static final _get_localAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_get_localAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorA() =>
      B2Vec2FfiAdapter._(_get_localAnchorA(_self));

  static final _set_localAnchorA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_set_localAnchorA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorA(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorA(_self, arg0._self);

  static final _get_localAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_get_localAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorB() =>
      B2Vec2FfiAdapter._(_get_localAnchorB(_self));

  static final _set_localAnchorB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_set_localAnchorB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorB(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorB(_self, arg0._self);

  static final _get_maxForce = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_get_maxForce_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_maxForce() => _get_maxForce(_self);

  static final _set_maxForce = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2FrictionJointDef_set_maxForce_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_maxForce(double arg0) => _set_maxForce(_self, arg0);

  static final _get_maxTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_get_maxTorque_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_maxTorque() => _get_maxTorque(_self);

  static final _set_maxTorque = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2FrictionJointDef_set_maxTorque_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_maxTorque(double arg0) => _set_maxTorque(_self, arg0);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2FrictionJointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2FrictionJointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2FrictionJointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2GearJointFfiAdapter implements B2GearJointPlatform, B2JointFfiAdapter {
  final Pointer<Void> _self;
  B2GearJointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getJoint1 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetJoint1_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getJoint1() => B2JointFfiAdapter._(_getJoint1(_self));

  static final _getJoint2 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetJoint2_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getJoint2() => B2JointFfiAdapter._(_getJoint2(_self));

  static final _setRatio = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2GearJoint_SetRatio_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setRatio(double ratio) => _setRatio(_self, ratio);

  static final _getRatio = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetRatio_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getRatio() => _getRatio(_self);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2GearJoint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2GearJoint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2GearJoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2GearJointDefFfiAdapter
    implements B2GearJointDefPlatform, B2JointDefFfiAdapter {
  final Pointer<Void> _self;
  B2GearJointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2GearJointDef_b2GearJointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2GearJointDefFfiAdapter() : _self = _ctr0();

  static final _get_joint1 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_get_joint1_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter get_joint1() => B2JointFfiAdapter._(_get_joint1(_self));

  static final _set_joint1 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_set_joint1_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_joint1(B2JointFfiAdapter arg0) => _set_joint1(_self, arg0._self);

  static final _get_joint2 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_get_joint2_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter get_joint2() => B2JointFfiAdapter._(_get_joint2(_self));

  static final _set_joint2 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_set_joint2_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_joint2(B2JointFfiAdapter arg0) => _set_joint2(_self, arg0._self);

  static final _get_ratio = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_get_ratio_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_ratio() => _get_ratio(_self);

  static final _set_ratio = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2GearJointDef_set_ratio_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_ratio(double arg0) => _set_ratio(_self, arg0);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2GearJointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2GearJointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2GearJointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2GearJointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2JointEdgeFfiAdapter implements B2JointEdgePlatform {
  final Pointer<Void> _self;
  B2JointEdgeFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2JointEdge_b2JointEdge_0')
      .asFunction<Pointer<Void> Function()>();

  B2JointEdgeFfiAdapter() : _self = _ctr0();

  static final _get_other = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2JointEdge_get_other_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_other() => B2BodyFfiAdapter._(_get_other(_self));

  static final _set_other = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2JointEdge_set_other_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_other(B2BodyFfiAdapter arg0) => _set_other(_self, arg0._self);

  static final _get_joint = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2JointEdge_get_joint_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter get_joint() => B2JointFfiAdapter._(_get_joint(_self));

  static final _set_joint = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2JointEdge_set_joint_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_joint(B2JointFfiAdapter arg0) => _set_joint(_self, arg0._self);

  static final _get_prev = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2JointEdge_get_prev_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointEdgeFfiAdapter get_prev() => B2JointEdgeFfiAdapter._(_get_prev(_self));

  static final _set_prev = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2JointEdge_set_prev_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_prev(B2JointEdgeFfiAdapter arg0) => _set_prev(_self, arg0._self);

  static final _get_next = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2JointEdge_get_next_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointEdgeFfiAdapter get_next() => B2JointEdgeFfiAdapter._(_get_next(_self));

  static final _set_next = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2JointEdge_set_next_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_next(B2JointEdgeFfiAdapter arg0) => _set_next(_self, arg0._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2JointEdge___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ManifoldFfiAdapter implements B2ManifoldPlatform {
  final Pointer<Void> _self;
  B2ManifoldFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2Manifold_b2Manifold_0')
      .asFunction<Pointer<Void> Function()>();

  B2ManifoldFfiAdapter() : _self = _ctr0();

  static final _get_points = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2Manifold_get_points_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, int)>();
  @override
  B2ManifoldPointFfiAdapter get_points(int arg0) =>
      B2ManifoldPointFfiAdapter._(_get_points(_self, arg0));

  static final _set_points = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Int32,
                  Pointer<Void>)>>('dart_bind_b2Manifold_set_points_2')
      .asFunction<void Function(Pointer<Void>, int, Pointer<Void>)>();
  @override
  void set_points(int arg0, B2ManifoldPointFfiAdapter arg1) =>
      _set_points(_self, arg0, arg1._self);

  static final _get_localNormal = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Manifold_get_localNormal_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localNormal() =>
      B2Vec2FfiAdapter._(_get_localNormal(_self));

  static final _set_localNormal = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Manifold_set_localNormal_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localNormal(B2Vec2FfiAdapter arg0) =>
      _set_localNormal(_self, arg0._self);

  static final _get_localPoint = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Manifold_get_localPoint_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localPoint() =>
      B2Vec2FfiAdapter._(_get_localPoint(_self));

  static final _set_localPoint = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Manifold_set_localPoint_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localPoint(B2Vec2FfiAdapter arg0) =>
      _set_localPoint(_self, arg0._self);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2Manifold_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ManifoldType get_type() => _get_type(_self).toB2ManifoldType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2Manifold_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2ManifoldType arg0) => _set_type(_self, arg0.index);

  static final _get_pointCount = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2Manifold_get_pointCount_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_pointCount() => _get_pointCount(_self);

  static final _set_pointCount = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2Manifold_set_pointCount_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_pointCount(int arg0) => _set_pointCount(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Manifold___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2WorldManifoldFfiAdapter implements B2WorldManifoldPlatform {
  final Pointer<Void> _self;
  B2WorldManifoldFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2WorldManifold_b2WorldManifold_0')
      .asFunction<Pointer<Void> Function()>();

  B2WorldManifoldFfiAdapter() : _self = _ctr0();

  static final _initialize = _symbols
      .lookup<
          NativeFunction<
              Void Function(
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Float,
                  Pointer<Void>,
                  Float)>>('dart_bind_b2WorldManifold_Initialize_5')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, double,
              Pointer<Void>, double)>();
  @override
  void initialize(B2ManifoldFfiAdapter manifold, B2TransformFfiAdapter xfA,
          double radiusA, B2TransformFfiAdapter xfB, double radiusB) =>
      _initialize(
          _self, manifold._self, xfA._self, radiusA, xfB._self, radiusB);

  static final _get_normal = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WorldManifold_get_normal_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_normal() => B2Vec2FfiAdapter._(_get_normal(_self));

  static final _set_normal = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WorldManifold_set_normal_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_normal(B2Vec2FfiAdapter arg0) => _set_normal(_self, arg0._self);

  static final _get_points = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2WorldManifold_get_points_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, int)>();
  @override
  B2Vec2FfiAdapter get_points(int arg0) =>
      B2Vec2FfiAdapter._(_get_points(_self, arg0));

  static final _set_points = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Int32,
                  Pointer<Void>)>>('dart_bind_b2WorldManifold_set_points_2')
      .asFunction<void Function(Pointer<Void>, int, Pointer<Void>)>();
  @override
  void set_points(int arg0, B2Vec2FfiAdapter arg1) =>
      _set_points(_self, arg0, arg1._self);

  static final _get_separations = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2WorldManifold_get_separations_1')
      .asFunction<double Function(Pointer<Void>, int)>();
  @override
  double get_separations(int arg0) => _get_separations(_self, arg0);

  static final _set_separations = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32, Float)>>(
          'dart_bind_b2WorldManifold_set_separations_2')
      .asFunction<void Function(Pointer<Void>, int, double)>();
  @override
  void set_separations(int arg0, double arg1) =>
      _set_separations(_self, arg0, arg1);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2WorldManifold___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ManifoldPointFfiAdapter implements B2ManifoldPointPlatform {
  final Pointer<Void> _self;
  B2ManifoldPointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2ManifoldPoint_b2ManifoldPoint_0')
      .asFunction<Pointer<Void> Function()>();

  B2ManifoldPointFfiAdapter() : _self = _ctr0();

  static final _get_localPoint = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ManifoldPoint_get_localPoint_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localPoint() =>
      B2Vec2FfiAdapter._(_get_localPoint(_self));

  static final _set_localPoint = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ManifoldPoint_set_localPoint_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localPoint(B2Vec2FfiAdapter arg0) =>
      _set_localPoint(_self, arg0._self);

  static final _get_normalImpulse = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2ManifoldPoint_get_normalImpulse_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_normalImpulse() => _get_normalImpulse(_self);

  static final _set_normalImpulse = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2ManifoldPoint_set_normalImpulse_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_normalImpulse(double arg0) => _set_normalImpulse(_self, arg0);

  static final _get_tangentImpulse = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2ManifoldPoint_get_tangentImpulse_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_tangentImpulse() => _get_tangentImpulse(_self);

  static final _set_tangentImpulse = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2ManifoldPoint_set_tangentImpulse_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_tangentImpulse(double arg0) => _set_tangentImpulse(_self, arg0);

  static final _get_id = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ManifoldPoint_get_id_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ContactIDFfiAdapter get_id() => B2ContactIDFfiAdapter._(_get_id(_self));

  static final _set_id = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ManifoldPoint_set_id_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_id(B2ContactIDFfiAdapter arg0) => _set_id(_self, arg0._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2ManifoldPoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2Mat22FfiAdapter implements B2Mat22Platform {
  final Pointer<Void> _self;
  B2Mat22FfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2Mat22_b2Mat22_0')
      .asFunction<Pointer<Void> Function()>();

  B2Mat22FfiAdapter() : _self = _ctr0();

  static final _ctr2 = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(
                  Pointer<Void>, Pointer<Void>)>>('dart_bind_b2Mat22_b2Mat22_2')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();

  B2Mat22FfiAdapter.from2(B2Vec2FfiAdapter a11, B2Vec2FfiAdapter a12)
      : _self = _ctr2(a11._self, a12._self);

  static final _ctr4 = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(
                  Float, Float, Float, Float)>>('dart_bind_b2Mat22_b2Mat22_4')
      .asFunction<Pointer<Void> Function(double, double, double, double)>();

  B2Mat22FfiAdapter.from4(double a11, double a12, double a21, double a22)
      : _self = _ctr4(a11, a12, a21, a22);

  static final _set = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2Mat22_Set_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  void set(B2Vec2FfiAdapter c1, B2Vec2FfiAdapter c2) =>
      _set(_self, c1._self, c2._self);

  static final _setIdentity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Mat22_SetIdentity_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void setIdentity() => _setIdentity(_self);

  static final _setZero = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Mat22_SetZero_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void setZero() => _setZero(_self);

  static final _getInverse = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Mat22_GetInverse_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Mat22FfiAdapter getInverse() => B2Mat22FfiAdapter._(_getInverse(_self));

  static final _solve = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(
                  Pointer<Void>, Pointer<Void>)>>('dart_bind_b2Mat22_Solve_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter solve(B2Vec2FfiAdapter b) =>
      B2Vec2FfiAdapter._(_solve(_self, b._self));

  static final _get_ex = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Mat22_get_ex_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_ex() => B2Vec2FfiAdapter._(_get_ex(_self));

  static final _set_ex = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Mat22_set_ex_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_ex(B2Vec2FfiAdapter arg0) => _set_ex(_self, arg0._self);

  static final _get_ey = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Mat22_get_ey_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_ey() => B2Vec2FfiAdapter._(_get_ey(_self));

  static final _set_ey = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Mat22_set_ey_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_ey(B2Vec2FfiAdapter arg0) => _set_ey(_self, arg0._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Mat22___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2Mat33FfiAdapter implements B2Mat33Platform {
  final Pointer<Void> _self;
  B2Mat33FfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2Mat33_b2Mat33_0')
      .asFunction<Pointer<Void> Function()>();

  B2Mat33FfiAdapter() : _self = _ctr0();

  static final _ctr3 = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2Mat33_b2Mat33_3')
      .asFunction<
          Pointer<Void> Function(
              Pointer<Void>, Pointer<Void>, Pointer<Void>)>();

  B2Mat33FfiAdapter.from3(
      B2Vec3FfiAdapter c1, B2Vec3FfiAdapter c2, B2Vec3FfiAdapter c3)
      : _self = _ctr3(c1._self, c2._self, c3._self);

  static final _setZero = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Mat33_SetZero_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void setZero() => _setZero(_self);

  static final _solve33 = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(
                  Pointer<Void>, Pointer<Void>)>>('dart_bind_b2Mat33_Solve33_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2Vec3FfiAdapter solve33(B2Vec3FfiAdapter b) =>
      B2Vec3FfiAdapter._(_solve33(_self, b._self));

  static final _solve22 = _symbols
      .lookup<
          NativeFunction<
              Pointer<Void> Function(
                  Pointer<Void>, Pointer<Void>)>>('dart_bind_b2Mat33_Solve22_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter solve22(B2Vec2FfiAdapter b) =>
      B2Vec2FfiAdapter._(_solve22(_self, b._self));

  static final _getInverse22 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Mat33_GetInverse22_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void getInverse22(B2Mat33FfiAdapter M) => _getInverse22(_self, M._self);

  static final _getSymInverse33 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Mat33_GetSymInverse33_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void getSymInverse33(B2Mat33FfiAdapter M) => _getSymInverse33(_self, M._self);

  static final _get_ex = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Mat33_get_ex_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec3FfiAdapter get_ex() => B2Vec3FfiAdapter._(_get_ex(_self));

  static final _set_ex = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Mat33_set_ex_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_ex(B2Vec3FfiAdapter arg0) => _set_ex(_self, arg0._self);

  static final _get_ey = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Mat33_get_ey_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec3FfiAdapter get_ey() => B2Vec3FfiAdapter._(_get_ey(_self));

  static final _set_ey = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Mat33_set_ey_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_ey(B2Vec3FfiAdapter arg0) => _set_ey(_self, arg0._self);

  static final _get_ez = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Mat33_get_ez_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec3FfiAdapter get_ez() => B2Vec3FfiAdapter._(_get_ez(_self));

  static final _set_ez = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Mat33_set_ez_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_ez(B2Vec3FfiAdapter arg0) => _set_ez(_self, arg0._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Mat33___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2MouseJointFfiAdapter
    implements B2MouseJointPlatform, B2JointFfiAdapter {
  final Pointer<Void> _self;
  B2MouseJointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _setTarget = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_SetTarget_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void setTarget(B2Vec2FfiAdapter target) => _setTarget(_self, target._self);

  static final _getTarget = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetTarget_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getTarget() => B2Vec2FfiAdapter._(_getTarget(_self));

  static final _setMaxForce = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MouseJoint_SetMaxForce_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMaxForce(double force) => _setMaxForce(_self, force);

  static final _getMaxForce = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetMaxForce_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMaxForce() => _getMaxForce(_self);

  static final _setStiffness = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MouseJoint_SetStiffness_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setStiffness(double stiffness) => _setStiffness(_self, stiffness);

  static final _getStiffness = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetStiffness_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getStiffness() => _getStiffness(_self);

  static final _setDamping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MouseJoint_SetDamping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setDamping(double damping) => _setDamping(_self, damping);

  static final _getDamping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetDamping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getDamping() => _getDamping(_self);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MouseJoint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MouseJoint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2MouseJointDefFfiAdapter
    implements B2MouseJointDefPlatform, B2JointDefFfiAdapter {
  final Pointer<Void> _self;
  B2MouseJointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2MouseJointDef_b2MouseJointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2MouseJointDefFfiAdapter() : _self = _ctr0();

  static final _get_target = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_get_target_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_target() => B2Vec2FfiAdapter._(_get_target(_self));

  static final _set_target = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_set_target_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_target(B2Vec2FfiAdapter arg0) => _set_target(_self, arg0._self);

  static final _get_maxForce = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_get_maxForce_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_maxForce() => _get_maxForce(_self);

  static final _set_maxForce = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MouseJointDef_set_maxForce_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_maxForce(double arg0) => _set_maxForce(_self, arg0);

  static final _get_stiffness = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_get_stiffness_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_stiffness() => _get_stiffness(_self);

  static final _set_stiffness = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MouseJointDef_set_stiffness_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_stiffness(double arg0) => _set_stiffness(_self, arg0);

  static final _get_damping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_get_damping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_damping() => _get_damping(_self);

  static final _set_damping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MouseJointDef_set_damping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_damping(double arg0) => _set_damping(_self, arg0);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2MouseJointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2MouseJointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2MouseJointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2PolygonShapeFfiAdapter
    implements B2PolygonShapePlatform, B2ShapeFfiAdapter {
  final Pointer<Void> _self;
  B2PolygonShapeFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2PolygonShape_b2PolygonShape_0')
      .asFunction<Pointer<Void> Function()>();

  B2PolygonShapeFfiAdapter() : _self = _ctr0();

  static final _set = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Int32)>>('dart_bind_b2PolygonShape_Set_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, int)>();
  @override
  void set(B2Vec2FfiAdapter vertices, int vertexCount) =>
      _set(_self, vertices._self, vertexCount);

  static final _setAsBox2 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float, Float)>>(
          'dart_bind_b2PolygonShape_SetAsBox_2')
      .asFunction<void Function(Pointer<Void>, double, double)>();
  @override
  void setAsBox2(double hx, double hy) => _setAsBox2(_self, hx, hy);

  static final _setAsBox4 = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Float, Float, Pointer<Void>,
                  Float)>>('dart_bind_b2PolygonShape_SetAsBox_4')
      .asFunction<
          void Function(
              Pointer<Void>, double, double, Pointer<Void>, double)>();
  @override
  void setAsBox4(double hx, double hy, B2Vec2FfiAdapter center, double angle) =>
      _setAsBox4(_self, hx, hy, center._self, angle);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2PolygonShape_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType getType() => _getType(_self).toB2ShapeType();

  static final _getChildCount = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2PolygonShape_GetChildCount_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int getChildCount() => _getChildCount(_self);

  static final _testPoint = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2PolygonShape_TestPoint_2')
      .asFunction<bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  bool testPoint(B2TransformFfiAdapter xf, B2Vec2FfiAdapter p) =>
      _testPoint(_self, xf._self, p._self);

  static final _rayCast = _symbols
      .lookup<
          NativeFunction<
              Bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Pointer<Void>, Int32)>>('dart_bind_b2PolygonShape_RayCast_4')
      .asFunction<
          bool Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
              Pointer<Void>, int)>();
  @override
  bool rayCast(B2RayCastOutputFfiAdapter output, B2RayCastInputFfiAdapter input,
          B2TransformFfiAdapter transform, int childIndex) =>
      _rayCast(_self, output._self, input._self, transform._self, childIndex);

  static final _computeAABB = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Int32)>>('dart_bind_b2PolygonShape_ComputeAABB_3')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>();
  @override
  void computeAABB(
          B2AABBFfiAdapter aabb, B2TransformFfiAdapter xf, int childIndex) =>
      _computeAABB(_self, aabb._self, xf._self, childIndex);

  static final _computeMass = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Float)>>('dart_bind_b2PolygonShape_ComputeMass_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, double)>();
  @override
  void computeMass(B2MassDataFfiAdapter massData, double density) =>
      _computeMass(_self, massData._self, density);

  static final _get_m_centroid = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PolygonShape_get_m_centroid_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_m_centroid() =>
      B2Vec2FfiAdapter._(_get_m_centroid(_self));

  static final _set_m_centroid = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PolygonShape_set_m_centroid_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_m_centroid(B2Vec2FfiAdapter arg0) =>
      _set_m_centroid(_self, arg0._self);

  static final _get_m_vertices = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2PolygonShape_get_m_vertices_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, int)>();
  @override
  B2Vec2FfiAdapter get_m_vertices(int arg0) =>
      B2Vec2FfiAdapter._(_get_m_vertices(_self, arg0));

  static final _set_m_vertices = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Int32,
                  Pointer<Void>)>>('dart_bind_b2PolygonShape_set_m_vertices_2')
      .asFunction<void Function(Pointer<Void>, int, Pointer<Void>)>();
  @override
  void set_m_vertices(int arg0, B2Vec2FfiAdapter arg1) =>
      _set_m_vertices(_self, arg0, arg1._self);

  static final _get_m_normals = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2PolygonShape_get_m_normals_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, int)>();
  @override
  B2Vec2FfiAdapter get_m_normals(int arg0) =>
      B2Vec2FfiAdapter._(_get_m_normals(_self, arg0));

  static final _set_m_normals = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Int32,
                  Pointer<Void>)>>('dart_bind_b2PolygonShape_set_m_normals_2')
      .asFunction<void Function(Pointer<Void>, int, Pointer<Void>)>();
  @override
  void set_m_normals(int arg0, B2Vec2FfiAdapter arg1) =>
      _set_m_normals(_self, arg0, arg1._self);

  static final _get_m_count = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2PolygonShape_get_m_count_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_m_count() => _get_m_count(_self);

  static final _set_m_count = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2PolygonShape_set_m_count_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_m_count(int arg0) => _set_m_count(_self, arg0);

  static final _get_m_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2PolygonShape_get_m_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2ShapeType get_m_type() => _get_m_type(_self).toB2ShapeType();

  static final _set_m_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2PolygonShape_set_m_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_m_type(B2ShapeType arg0) => _set_m_type(_self, arg0.index);

  static final _get_m_radius = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PolygonShape_get_m_radius_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_m_radius() => _get_m_radius(_self);

  static final _set_m_radius = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PolygonShape_set_m_radius_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_m_radius(double arg0) => _set_m_radius(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2PolygonShape___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2PrismaticJointFfiAdapter
    implements B2PrismaticJointPlatform, B2JointFfiAdapter {
  final Pointer<Void> _self;
  B2PrismaticJointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getLocalAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetLocalAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorA() =>
      B2Vec2FfiAdapter._(_getLocalAnchorA(_self));

  static final _getLocalAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetLocalAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorB() =>
      B2Vec2FfiAdapter._(_getLocalAnchorB(_self));

  static final _getLocalAxisA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetLocalAxisA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAxisA() => B2Vec2FfiAdapter._(_getLocalAxisA(_self));

  static final _getReferenceAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetReferenceAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getReferenceAngle() => _getReferenceAngle(_self);

  static final _getJointTranslation = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetJointTranslation_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getJointTranslation() => _getJointTranslation(_self);

  static final _getJointSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetJointSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getJointSpeed() => _getJointSpeed(_self);

  static final _isLimitEnabled = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_IsLimitEnabled_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isLimitEnabled() => _isLimitEnabled(_self);

  static final _enableLimit = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2PrismaticJoint_EnableLimit_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void enableLimit(bool flag) => _enableLimit(_self, flag);

  static final _getLowerLimit = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetLowerLimit_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getLowerLimit() => _getLowerLimit(_self);

  static final _getUpperLimit = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetUpperLimit_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getUpperLimit() => _getUpperLimit(_self);

  static final _setLimits = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float, Float)>>(
          'dart_bind_b2PrismaticJoint_SetLimits_2')
      .asFunction<void Function(Pointer<Void>, double, double)>();
  @override
  void setLimits(double lower, double upper) => _setLimits(_self, lower, upper);

  static final _isMotorEnabled = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_IsMotorEnabled_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isMotorEnabled() => _isMotorEnabled(_self);

  static final _enableMotor = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2PrismaticJoint_EnableMotor_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void enableMotor(bool flag) => _enableMotor(_self, flag);

  static final _setMotorSpeed = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PrismaticJoint_SetMotorSpeed_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMotorSpeed(double speed) => _setMotorSpeed(_self, speed);

  static final _getMotorSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetMotorSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMotorSpeed() => _getMotorSpeed(_self);

  static final _setMaxMotorForce = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PrismaticJoint_SetMaxMotorForce_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMaxMotorForce(double force) => _setMaxMotorForce(_self, force);

  static final _getMaxMotorForce = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetMaxMotorForce_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMaxMotorForce() => _getMaxMotorForce(_self);

  static final _getMotorForce = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PrismaticJoint_GetMotorForce_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getMotorForce(double inv_dt) => _getMotorForce(_self, inv_dt);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PrismaticJoint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PrismaticJoint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2PrismaticJointDefFfiAdapter
    implements B2PrismaticJointDefPlatform, B2JointDefFfiAdapter {
  final Pointer<Void> _self;
  B2PrismaticJointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2PrismaticJointDef_b2PrismaticJointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2PrismaticJointDefFfiAdapter() : _self = _ctr0();

  static final _initialize = _symbols
      .lookup<
          NativeFunction<
              Void Function(
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2PrismaticJointDef_Initialize_4')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
              Pointer<Void>, Pointer<Void>)>();
  @override
  void initialize(B2BodyFfiAdapter bodyA, B2BodyFfiAdapter bodyB,
          B2Vec2FfiAdapter anchor, B2Vec2FfiAdapter axis) =>
      _initialize(_self, bodyA._self, bodyB._self, anchor._self, axis._self);

  static final _get_localAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_localAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorA() =>
      B2Vec2FfiAdapter._(_get_localAnchorA(_self));

  static final _set_localAnchorA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_set_localAnchorA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorA(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorA(_self, arg0._self);

  static final _get_localAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_localAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorB() =>
      B2Vec2FfiAdapter._(_get_localAnchorB(_self));

  static final _set_localAnchorB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_set_localAnchorB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorB(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorB(_self, arg0._self);

  static final _get_localAxisA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_localAxisA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAxisA() =>
      B2Vec2FfiAdapter._(_get_localAxisA(_self));

  static final _set_localAxisA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_set_localAxisA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAxisA(B2Vec2FfiAdapter arg0) =>
      _set_localAxisA(_self, arg0._self);

  static final _get_referenceAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_referenceAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_referenceAngle() => _get_referenceAngle(_self);

  static final _set_referenceAngle = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PrismaticJointDef_set_referenceAngle_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_referenceAngle(double arg0) => _set_referenceAngle(_self, arg0);

  static final _get_enableLimit = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_enableLimit_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_enableLimit() => _get_enableLimit(_self);

  static final _set_enableLimit = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2PrismaticJointDef_set_enableLimit_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_enableLimit(bool arg0) => _set_enableLimit(_self, arg0);

  static final _get_lowerTranslation = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_lowerTranslation_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_lowerTranslation() => _get_lowerTranslation(_self);

  static final _set_lowerTranslation = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PrismaticJointDef_set_lowerTranslation_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_lowerTranslation(double arg0) => _set_lowerTranslation(_self, arg0);

  static final _get_upperTranslation = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_upperTranslation_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_upperTranslation() => _get_upperTranslation(_self);

  static final _set_upperTranslation = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PrismaticJointDef_set_upperTranslation_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_upperTranslation(double arg0) => _set_upperTranslation(_self, arg0);

  static final _get_enableMotor = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_enableMotor_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_enableMotor() => _get_enableMotor(_self);

  static final _set_enableMotor = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2PrismaticJointDef_set_enableMotor_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_enableMotor(bool arg0) => _set_enableMotor(_self, arg0);

  static final _get_maxMotorForce = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_maxMotorForce_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_maxMotorForce() => _get_maxMotorForce(_self);

  static final _set_maxMotorForce = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PrismaticJointDef_set_maxMotorForce_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_maxMotorForce(double arg0) => _set_maxMotorForce(_self, arg0);

  static final _get_motorSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_motorSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_motorSpeed() => _get_motorSpeed(_self);

  static final _set_motorSpeed = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PrismaticJointDef_set_motorSpeed_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_motorSpeed(double arg0) => _set_motorSpeed(_self, arg0);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2PrismaticJointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2PrismaticJointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2PrismaticJointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ProfileFfiAdapter implements B2ProfilePlatform {
  final Pointer<Void> _self;
  B2ProfileFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _get_step = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Profile_get_step_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_step() => _get_step(_self);

  static final _set_step = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Profile_set_step_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_step(double arg0) => _set_step(_self, arg0);

  static final _get_collide = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Profile_get_collide_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_collide() => _get_collide(_self);

  static final _set_collide = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Profile_set_collide_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_collide(double arg0) => _set_collide(_self, arg0);

  static final _get_solve = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Profile_get_solve_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_solve() => _get_solve(_self);

  static final _set_solve = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Profile_set_solve_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_solve(double arg0) => _set_solve(_self, arg0);

  static final _get_solveInit = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Profile_get_solveInit_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_solveInit() => _get_solveInit(_self);

  static final _set_solveInit = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Profile_set_solveInit_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_solveInit(double arg0) => _set_solveInit(_self, arg0);

  static final _get_solveVelocity = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Profile_get_solveVelocity_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_solveVelocity() => _get_solveVelocity(_self);

  static final _set_solveVelocity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Profile_set_solveVelocity_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_solveVelocity(double arg0) => _set_solveVelocity(_self, arg0);

  static final _get_solvePosition = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Profile_get_solvePosition_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_solvePosition() => _get_solvePosition(_self);

  static final _set_solvePosition = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Profile_set_solvePosition_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_solvePosition(double arg0) => _set_solvePosition(_self, arg0);

  static final _get_broadphase = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Profile_get_broadphase_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_broadphase() => _get_broadphase(_self);

  static final _set_broadphase = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Profile_set_broadphase_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_broadphase(double arg0) => _set_broadphase(_self, arg0);

  static final _get_solveTOI = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Profile_get_solveTOI_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_solveTOI() => _get_solveTOI(_self);

  static final _set_solveTOI = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Profile_set_solveTOI_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_solveTOI(double arg0) => _set_solveTOI(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Profile___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2PulleyJointFfiAdapter
    implements B2PulleyJointPlatform, B2JointFfiAdapter {
  final Pointer<Void> _self;
  B2PulleyJointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getGroundAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetGroundAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getGroundAnchorA() =>
      B2Vec2FfiAdapter._(_getGroundAnchorA(_self));

  static final _getGroundAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetGroundAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getGroundAnchorB() =>
      B2Vec2FfiAdapter._(_getGroundAnchorB(_self));

  static final _getLengthA = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetLengthA_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getLengthA() => _getLengthA(_self);

  static final _getLengthB = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetLengthB_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getLengthB() => _getLengthB(_self);

  static final _getRatio = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetRatio_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getRatio() => _getRatio(_self);

  static final _getCurrentLengthA = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetCurrentLengthA_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getCurrentLengthA() => _getCurrentLengthA(_self);

  static final _getCurrentLengthB = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetCurrentLengthB_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getCurrentLengthB() => _getCurrentLengthB(_self);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PulleyJoint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PulleyJoint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2PulleyJointDefFfiAdapter
    implements B2PulleyJointDefPlatform, B2JointDefFfiAdapter {
  final Pointer<Void> _self;
  B2PulleyJointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2PulleyJointDef_b2PulleyJointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2PulleyJointDefFfiAdapter() : _self = _ctr0();

  static final _initialize = _symbols
      .lookup<
          NativeFunction<
              Void Function(
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Float)>>('dart_bind_b2PulleyJointDef_Initialize_7')
      .asFunction<
          void Function(
              Pointer<Void>,
              Pointer<Void>,
              Pointer<Void>,
              Pointer<Void>,
              Pointer<Void>,
              Pointer<Void>,
              Pointer<Void>,
              double)>();
  @override
  void initialize(
          B2BodyFfiAdapter bodyA,
          B2BodyFfiAdapter bodyB,
          B2Vec2FfiAdapter groundAnchorA,
          B2Vec2FfiAdapter groundAnchorB,
          B2Vec2FfiAdapter anchorA,
          B2Vec2FfiAdapter anchorB,
          double ratio) =>
      _initialize(_self, bodyA._self, bodyB._self, groundAnchorA._self,
          groundAnchorB._self, anchorA._self, anchorB._self, ratio);

  static final _get_groundAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_groundAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_groundAnchorA() =>
      B2Vec2FfiAdapter._(_get_groundAnchorA(_self));

  static final _set_groundAnchorA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_set_groundAnchorA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_groundAnchorA(B2Vec2FfiAdapter arg0) =>
      _set_groundAnchorA(_self, arg0._self);

  static final _get_groundAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_groundAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_groundAnchorB() =>
      B2Vec2FfiAdapter._(_get_groundAnchorB(_self));

  static final _set_groundAnchorB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_set_groundAnchorB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_groundAnchorB(B2Vec2FfiAdapter arg0) =>
      _set_groundAnchorB(_self, arg0._self);

  static final _get_localAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_localAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorA() =>
      B2Vec2FfiAdapter._(_get_localAnchorA(_self));

  static final _set_localAnchorA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_set_localAnchorA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorA(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorA(_self, arg0._self);

  static final _get_localAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_localAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorB() =>
      B2Vec2FfiAdapter._(_get_localAnchorB(_self));

  static final _set_localAnchorB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_set_localAnchorB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorB(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorB(_self, arg0._self);

  static final _get_lengthA = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_lengthA_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_lengthA() => _get_lengthA(_self);

  static final _set_lengthA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PulleyJointDef_set_lengthA_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_lengthA(double arg0) => _set_lengthA(_self, arg0);

  static final _get_lengthB = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_lengthB_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_lengthB() => _get_lengthB(_self);

  static final _set_lengthB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PulleyJointDef_set_lengthB_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_lengthB(double arg0) => _set_lengthB(_self, arg0);

  static final _get_ratio = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_ratio_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_ratio() => _get_ratio(_self);

  static final _set_ratio = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2PulleyJointDef_set_ratio_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_ratio(double arg0) => _set_ratio(_self, arg0);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2PulleyJointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2PulleyJointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2PulleyJointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2RayCastInputFfiAdapter implements B2RayCastInputPlatform {
  final Pointer<Void> _self;
  B2RayCastInputFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _get_p1 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RayCastInput_get_p1_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_p1() => B2Vec2FfiAdapter._(_get_p1(_self));

  static final _set_p1 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RayCastInput_set_p1_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_p1(B2Vec2FfiAdapter arg0) => _set_p1(_self, arg0._self);

  static final _get_p2 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RayCastInput_get_p2_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_p2() => B2Vec2FfiAdapter._(_get_p2(_self));

  static final _set_p2 = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RayCastInput_set_p2_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_p2(B2Vec2FfiAdapter arg0) => _set_p2(_self, arg0._self);

  static final _get_maxFraction = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RayCastInput_get_maxFraction_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_maxFraction() => _get_maxFraction(_self);

  static final _set_maxFraction = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RayCastInput_set_maxFraction_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_maxFraction(double arg0) => _set_maxFraction(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2RayCastInput___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2RayCastOutputFfiAdapter implements B2RayCastOutputPlatform {
  final Pointer<Void> _self;
  B2RayCastOutputFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _get_normal = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RayCastOutput_get_normal_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_normal() => B2Vec2FfiAdapter._(_get_normal(_self));

  static final _set_normal = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RayCastOutput_set_normal_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_normal(B2Vec2FfiAdapter arg0) => _set_normal(_self, arg0._self);

  static final _get_fraction = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RayCastOutput_get_fraction_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_fraction() => _get_fraction(_self);

  static final _set_fraction = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RayCastOutput_set_fraction_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_fraction(double arg0) => _set_fraction(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2RayCastOutput___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2RevoluteJointFfiAdapter
    implements B2RevoluteJointPlatform, B2JointFfiAdapter {
  final Pointer<Void> _self;
  B2RevoluteJointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getLocalAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetLocalAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorA() =>
      B2Vec2FfiAdapter._(_getLocalAnchorA(_self));

  static final _getLocalAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetLocalAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorB() =>
      B2Vec2FfiAdapter._(_getLocalAnchorB(_self));

  static final _getReferenceAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetReferenceAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getReferenceAngle() => _getReferenceAngle(_self);

  static final _getJointAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetJointAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getJointAngle() => _getJointAngle(_self);

  static final _getJointSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetJointSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getJointSpeed() => _getJointSpeed(_self);

  static final _isLimitEnabled = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_IsLimitEnabled_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isLimitEnabled() => _isLimitEnabled(_self);

  static final _enableLimit = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2RevoluteJoint_EnableLimit_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void enableLimit(bool flag) => _enableLimit(_self, flag);

  static final _getLowerLimit = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetLowerLimit_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getLowerLimit() => _getLowerLimit(_self);

  static final _getUpperLimit = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetUpperLimit_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getUpperLimit() => _getUpperLimit(_self);

  static final _setLimits = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float, Float)>>(
          'dart_bind_b2RevoluteJoint_SetLimits_2')
      .asFunction<void Function(Pointer<Void>, double, double)>();
  @override
  void setLimits(double lower, double upper) => _setLimits(_self, lower, upper);

  static final _isMotorEnabled = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_IsMotorEnabled_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isMotorEnabled() => _isMotorEnabled(_self);

  static final _enableMotor = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2RevoluteJoint_EnableMotor_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void enableMotor(bool flag) => _enableMotor(_self, flag);

  static final _setMotorSpeed = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RevoluteJoint_SetMotorSpeed_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMotorSpeed(double speed) => _setMotorSpeed(_self, speed);

  static final _getMotorSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetMotorSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMotorSpeed() => _getMotorSpeed(_self);

  static final _setMaxMotorTorque = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RevoluteJoint_SetMaxMotorTorque_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMaxMotorTorque(double torque) => _setMaxMotorTorque(_self, torque);

  static final _getMaxMotorTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetMaxMotorTorque_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMaxMotorTorque() => _getMaxMotorTorque(_self);

  static final _getMotorTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RevoluteJoint_GetMotorTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getMotorTorque(double inv_dt) => _getMotorTorque(_self, inv_dt);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RevoluteJoint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RevoluteJoint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2RevoluteJointDefFfiAdapter
    implements B2RevoluteJointDefPlatform, B2JointDefFfiAdapter {
  final Pointer<Void> _self;
  B2RevoluteJointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2RevoluteJointDef_b2RevoluteJointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2RevoluteJointDefFfiAdapter() : _self = _ctr0();

  static final _initialize = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2RevoluteJointDef_Initialize_3')
      .asFunction<
          void Function(
              Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  void initialize(B2BodyFfiAdapter bodyA, B2BodyFfiAdapter bodyB,
          B2Vec2FfiAdapter anchor) =>
      _initialize(_self, bodyA._self, bodyB._self, anchor._self);

  static final _get_localAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_localAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorA() =>
      B2Vec2FfiAdapter._(_get_localAnchorA(_self));

  static final _set_localAnchorA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_set_localAnchorA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorA(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorA(_self, arg0._self);

  static final _get_localAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_localAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorB() =>
      B2Vec2FfiAdapter._(_get_localAnchorB(_self));

  static final _set_localAnchorB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_set_localAnchorB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorB(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorB(_self, arg0._self);

  static final _get_referenceAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_referenceAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_referenceAngle() => _get_referenceAngle(_self);

  static final _set_referenceAngle = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RevoluteJointDef_set_referenceAngle_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_referenceAngle(double arg0) => _set_referenceAngle(_self, arg0);

  static final _get_enableLimit = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_enableLimit_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_enableLimit() => _get_enableLimit(_self);

  static final _set_enableLimit = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2RevoluteJointDef_set_enableLimit_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_enableLimit(bool arg0) => _set_enableLimit(_self, arg0);

  static final _get_lowerAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_lowerAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_lowerAngle() => _get_lowerAngle(_self);

  static final _set_lowerAngle = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RevoluteJointDef_set_lowerAngle_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_lowerAngle(double arg0) => _set_lowerAngle(_self, arg0);

  static final _get_upperAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_upperAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_upperAngle() => _get_upperAngle(_self);

  static final _set_upperAngle = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RevoluteJointDef_set_upperAngle_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_upperAngle(double arg0) => _set_upperAngle(_self, arg0);

  static final _get_enableMotor = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_enableMotor_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_enableMotor() => _get_enableMotor(_self);

  static final _set_enableMotor = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2RevoluteJointDef_set_enableMotor_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_enableMotor(bool arg0) => _set_enableMotor(_self, arg0);

  static final _get_motorSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_motorSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_motorSpeed() => _get_motorSpeed(_self);

  static final _set_motorSpeed = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RevoluteJointDef_set_motorSpeed_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_motorSpeed(double arg0) => _set_motorSpeed(_self, arg0);

  static final _get_maxMotorTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_maxMotorTorque_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_maxMotorTorque() => _get_maxMotorTorque(_self);

  static final _set_maxMotorTorque = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RevoluteJointDef_set_maxMotorTorque_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_maxMotorTorque(double arg0) => _set_maxMotorTorque(_self, arg0);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2RevoluteJointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2RevoluteJointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2RevoluteJointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2RotFfiAdapter implements B2RotPlatform {
  final Pointer<Void> _self;
  B2RotFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2Rot_b2Rot_0')
      .asFunction<Pointer<Void> Function()>();

  B2RotFfiAdapter() : _self = _ctr0();

  static final _ctr1 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Float)>>(
          'dart_bind_b2Rot_b2Rot_1')
      .asFunction<Pointer<Void> Function(double)>();

  B2RotFfiAdapter.from1(double angle) : _self = _ctr1(angle);

  static final _set = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Rot_Set_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set(double angle) => _set(_self, angle);

  static final _setIdentity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Rot_SetIdentity_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void setIdentity() => _setIdentity(_self);

  static final _getAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Rot_GetAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getAngle() => _getAngle(_self);

  static final _getXAxis = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Rot_GetXAxis_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getXAxis() => B2Vec2FfiAdapter._(_getXAxis(_self));

  static final _getYAxis = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2Rot_GetYAxis_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getYAxis() => B2Vec2FfiAdapter._(_getYAxis(_self));

  static final _get_s = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Rot_get_s_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_s() => _get_s(_self);

  static final _set_s = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Rot_set_s_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_s(double arg0) => _set_s(_self, arg0);

  static final _get_c = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2Rot_get_c_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_c() => _get_c(_self);

  static final _set_c = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2Rot_set_c_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_c(double arg0) => _set_c(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Rot___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2WheelJointFfiAdapter
    implements B2WheelJointPlatform, B2JointFfiAdapter {
  final Pointer<Void> _self;
  B2WheelJointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _getLocalAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetLocalAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorA() =>
      B2Vec2FfiAdapter._(_getLocalAnchorA(_self));

  static final _getLocalAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetLocalAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAnchorB() =>
      B2Vec2FfiAdapter._(_getLocalAnchorB(_self));

  static final _getLocalAxisA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetLocalAxisA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLocalAxisA() => B2Vec2FfiAdapter._(_getLocalAxisA(_self));

  static final _getJointTranslation = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetJointTranslation_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getJointTranslation() => _getJointTranslation(_self);

  static final _getJointLinearSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetJointLinearSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getJointLinearSpeed() => _getJointLinearSpeed(_self);

  static final _getJointAngle = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetJointAngle_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getJointAngle() => _getJointAngle(_self);

  static final _getJointAngularSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetJointAngularSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getJointAngularSpeed() => _getJointAngularSpeed(_self);

  static final _isLimitEnabled = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_IsLimitEnabled_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isLimitEnabled() => _isLimitEnabled(_self);

  static final _enableLimit = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2WheelJoint_EnableLimit_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void enableLimit(bool flag) => _enableLimit(_self, flag);

  static final _getLowerLimit = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetLowerLimit_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getLowerLimit() => _getLowerLimit(_self);

  static final _getUpperLimit = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetUpperLimit_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getUpperLimit() => _getUpperLimit(_self);

  static final _setLimits = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float, Float)>>(
          'dart_bind_b2WheelJoint_SetLimits_2')
      .asFunction<void Function(Pointer<Void>, double, double)>();
  @override
  void setLimits(double lower, double upper) => _setLimits(_self, lower, upper);

  static final _isMotorEnabled = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_IsMotorEnabled_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool isMotorEnabled() => _isMotorEnabled(_self);

  static final _enableMotor = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2WheelJoint_EnableMotor_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void enableMotor(bool flag) => _enableMotor(_self, flag);

  static final _setMotorSpeed = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJoint_SetMotorSpeed_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMotorSpeed(double speed) => _setMotorSpeed(_self, speed);

  static final _getMotorSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetMotorSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMotorSpeed() => _getMotorSpeed(_self);

  static final _setMaxMotorTorque = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJoint_SetMaxMotorTorque_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMaxMotorTorque(double torque) => _setMaxMotorTorque(_self, torque);

  static final _getMaxMotorTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetMaxMotorTorque_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMaxMotorTorque() => _getMaxMotorTorque(_self);

  static final _getMotorTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJoint_GetMotorTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getMotorTorque(double inv_dt) => _getMotorTorque(_self, inv_dt);

  static final _setStiffness = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJoint_SetStiffness_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setStiffness(double stiffness) => _setStiffness(_self, stiffness);

  static final _getStiffness = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetStiffness_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getStiffness() => _getStiffness(_self);

  static final _setDamping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJoint_SetDamping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setDamping(double damping) => _setDamping(_self, damping);

  static final _getDamping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetDamping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getDamping() => _getDamping(_self);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJoint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJoint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2WheelJointDefFfiAdapter
    implements B2WheelJointDefPlatform, B2JointDefFfiAdapter {
  final Pointer<Void> _self;
  B2WheelJointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2WheelJointDef_b2WheelJointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2WheelJointDefFfiAdapter() : _self = _ctr0();

  static final _initialize = _symbols
      .lookup<
          NativeFunction<
              Void Function(
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2WheelJointDef_Initialize_4')
      .asFunction<
          void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>,
              Pointer<Void>, Pointer<Void>)>();
  @override
  void initialize(B2BodyFfiAdapter bodyA, B2BodyFfiAdapter bodyB,
          B2Vec2FfiAdapter anchor, B2Vec2FfiAdapter axis) =>
      _initialize(_self, bodyA._self, bodyB._self, anchor._self, axis._self);

  static final _get_localAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_localAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorA() =>
      B2Vec2FfiAdapter._(_get_localAnchorA(_self));

  static final _set_localAnchorA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_set_localAnchorA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorA(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorA(_self, arg0._self);

  static final _get_localAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_localAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAnchorB() =>
      B2Vec2FfiAdapter._(_get_localAnchorB(_self));

  static final _set_localAnchorB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_set_localAnchorB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAnchorB(B2Vec2FfiAdapter arg0) =>
      _set_localAnchorB(_self, arg0._self);

  static final _get_localAxisA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_localAxisA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_localAxisA() =>
      B2Vec2FfiAdapter._(_get_localAxisA(_self));

  static final _set_localAxisA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_set_localAxisA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_localAxisA(B2Vec2FfiAdapter arg0) =>
      _set_localAxisA(_self, arg0._self);

  static final _get_enableLimit = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_enableLimit_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_enableLimit() => _get_enableLimit(_self);

  static final _set_enableLimit = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2WheelJointDef_set_enableLimit_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_enableLimit(bool arg0) => _set_enableLimit(_self, arg0);

  static final _get_lowerTranslation = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_lowerTranslation_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_lowerTranslation() => _get_lowerTranslation(_self);

  static final _set_lowerTranslation = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJointDef_set_lowerTranslation_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_lowerTranslation(double arg0) => _set_lowerTranslation(_self, arg0);

  static final _get_upperTranslation = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_upperTranslation_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_upperTranslation() => _get_upperTranslation(_self);

  static final _set_upperTranslation = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJointDef_set_upperTranslation_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_upperTranslation(double arg0) => _set_upperTranslation(_self, arg0);

  static final _get_enableMotor = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_enableMotor_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_enableMotor() => _get_enableMotor(_self);

  static final _set_enableMotor = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2WheelJointDef_set_enableMotor_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_enableMotor(bool arg0) => _set_enableMotor(_self, arg0);

  static final _get_maxMotorTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_maxMotorTorque_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_maxMotorTorque() => _get_maxMotorTorque(_self);

  static final _set_maxMotorTorque = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJointDef_set_maxMotorTorque_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_maxMotorTorque(double arg0) => _set_maxMotorTorque(_self, arg0);

  static final _get_motorSpeed = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_motorSpeed_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_motorSpeed() => _get_motorSpeed(_self);

  static final _set_motorSpeed = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJointDef_set_motorSpeed_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_motorSpeed(double arg0) => _set_motorSpeed(_self, arg0);

  static final _get_stiffness = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_stiffness_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_stiffness() => _get_stiffness(_self);

  static final _set_stiffness = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJointDef_set_stiffness_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_stiffness(double arg0) => _set_stiffness(_self, arg0);

  static final _get_damping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_damping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_damping() => _get_damping(_self);

  static final _set_damping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2WheelJointDef_set_damping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_damping(double arg0) => _set_damping(_self, arg0);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2WheelJointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2WheelJointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2WheelJointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2MotorJointFfiAdapter
    implements B2MotorJointPlatform, B2JointFfiAdapter {
  final Pointer<Void> _self;
  B2MotorJointFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _setLinearOffset = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_SetLinearOffset_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void setLinearOffset(B2Vec2FfiAdapter linearOffset) =>
      _setLinearOffset(_self, linearOffset._self);

  static final _getLinearOffset = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetLinearOffset_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getLinearOffset() =>
      B2Vec2FfiAdapter._(_getLinearOffset(_self));

  static final _setAngularOffset = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MotorJoint_SetAngularOffset_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setAngularOffset(double angularOffset) =>
      _setAngularOffset(_self, angularOffset);

  static final _getAngularOffset = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetAngularOffset_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getAngularOffset() => _getAngularOffset(_self);

  static final _setMaxForce = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MotorJoint_SetMaxForce_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMaxForce(double force) => _setMaxForce(_self, force);

  static final _getMaxForce = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetMaxForce_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMaxForce() => _getMaxForce(_self);

  static final _setMaxTorque = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MotorJoint_SetMaxTorque_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setMaxTorque(double torque) => _setMaxTorque(_self, torque);

  static final _getMaxTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetMaxTorque_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getMaxTorque() => _getMaxTorque(_self);

  static final _setCorrectionFactor = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MotorJoint_SetCorrectionFactor_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void setCorrectionFactor(double factor) =>
      _setCorrectionFactor(_self, factor);

  static final _getCorrectionFactor = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetCorrectionFactor_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double getCorrectionFactor() => _getCorrectionFactor(_self);

  static final _dump = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_Dump_0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dump() => _dump(_self);

  static final _getType = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetType_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType getType() => _getType(_self).toB2JointType();

  static final _getBodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetBodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyA() => B2BodyFfiAdapter._(_getBodyA(_self));

  static final _getBodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetBodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter getBodyB() => B2BodyFfiAdapter._(_getBodyB(_self));

  static final _getAnchorA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetAnchorA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorA() => B2Vec2FfiAdapter._(_getAnchorA(_self));

  static final _getAnchorB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetAnchorB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter getAnchorB() => B2Vec2FfiAdapter._(_getAnchorB(_self));

  static final _getReactionForce = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MotorJoint_GetReactionForce_1')
      .asFunction<Pointer<Void> Function(Pointer<Void>, double)>();
  @override
  B2Vec2FfiAdapter getReactionForce(double inv_dt) =>
      B2Vec2FfiAdapter._(_getReactionForce(_self, inv_dt));

  static final _getReactionTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MotorJoint_GetReactionTorque_1')
      .asFunction<double Function(Pointer<Void>, double)>();
  @override
  double getReactionTorque(double inv_dt) => _getReactionTorque(_self, inv_dt);

  static final _getNext = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetNext_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointFfiAdapter getNext() => B2JointFfiAdapter._(_getNext(_self));

  static final _getUserData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetUserData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter getUserData() =>
      B2JointUserDataFfiAdapter._(_getUserData(_self));

  static final _getCollideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint_GetCollideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool getCollideConnected() => _getCollideConnected(_self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJoint___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2MotorJointDefFfiAdapter
    implements B2MotorJointDefPlatform, B2JointDefFfiAdapter {
  final Pointer<Void> _self;
  B2MotorJointDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2MotorJointDef_b2MotorJointDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2MotorJointDefFfiAdapter() : _self = _ctr0();

  static final _initialize = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Pointer<Void>,
                  Pointer<Void>)>>('dart_bind_b2MotorJointDef_Initialize_2')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>();
  @override
  void initialize(B2BodyFfiAdapter bodyA, B2BodyFfiAdapter bodyB) =>
      _initialize(_self, bodyA._self, bodyB._self);

  static final _get_linearOffset = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_get_linearOffset_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_linearOffset() =>
      B2Vec2FfiAdapter._(_get_linearOffset(_self));

  static final _set_linearOffset = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_set_linearOffset_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_linearOffset(B2Vec2FfiAdapter arg0) =>
      _set_linearOffset(_self, arg0._self);

  static final _get_angularOffset = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_get_angularOffset_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_angularOffset() => _get_angularOffset(_self);

  static final _set_angularOffset = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MotorJointDef_set_angularOffset_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_angularOffset(double arg0) => _set_angularOffset(_self, arg0);

  static final _get_maxForce = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_get_maxForce_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_maxForce() => _get_maxForce(_self);

  static final _set_maxForce = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MotorJointDef_set_maxForce_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_maxForce(double arg0) => _set_maxForce(_self, arg0);

  static final _get_maxTorque = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_get_maxTorque_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_maxTorque() => _get_maxTorque(_self);

  static final _set_maxTorque = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MotorJointDef_set_maxTorque_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_maxTorque(double arg0) => _set_maxTorque(_self, arg0);

  static final _get_correctionFactor = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_get_correctionFactor_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_correctionFactor() => _get_correctionFactor(_self);

  static final _set_correctionFactor = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2MotorJointDef_set_correctionFactor_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_correctionFactor(double arg0) => _set_correctionFactor(_self, arg0);

  static final _get_type = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_get_type_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2JointType get_type() => _get_type(_self).toB2JointType();

  static final _set_type = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2MotorJointDef_set_type_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_type(B2JointType arg0) => _set_type(_self, arg0.index);

  static final _get_userData = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_get_userData_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2JointUserDataFfiAdapter get_userData() =>
      B2JointUserDataFfiAdapter._(_get_userData(_self));

  static final _set_userData = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_set_userData_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_userData(B2JointUserDataFfiAdapter arg0) =>
      _set_userData(_self, arg0._self);

  static final _get_bodyA = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_get_bodyA_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyA() => B2BodyFfiAdapter._(_get_bodyA(_self));

  static final _set_bodyA = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_set_bodyA_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyA(B2BodyFfiAdapter arg0) => _set_bodyA(_self, arg0._self);

  static final _get_bodyB = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_get_bodyB_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2BodyFfiAdapter get_bodyB() => B2BodyFfiAdapter._(_get_bodyB(_self));

  static final _set_bodyB = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_set_bodyB_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_bodyB(B2BodyFfiAdapter arg0) => _set_bodyB(_self, arg0._self);

  static final _get_collideConnected = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef_get_collideConnected_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_collideConnected() => _get_collideConnected(_self);

  static final _set_collideConnected = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2MotorJointDef_set_collideConnected_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_collideConnected(bool arg0) => _set_collideConnected(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2MotorJointDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2RopeTuningFfiAdapter implements B2RopeTuningPlatform {
  final Pointer<Void> _self;
  B2RopeTuningFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2RopeTuning_b2RopeTuning_0')
      .asFunction<Pointer<Void> Function()>();

  B2RopeTuningFfiAdapter() : _self = _ctr0();

  static final _get_stretchingModel = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_stretchingModel_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2StretchingModel get_stretchingModel() =>
      _get_stretchingModel(_self).toB2StretchingModel();

  static final _set_stretchingModel = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2RopeTuning_set_stretchingModel_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_stretchingModel(B2StretchingModel arg0) =>
      _set_stretchingModel(_self, arg0.index);

  static final _get_bendingModel = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_bendingModel_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  B2BendingModel get_bendingModel() =>
      _get_bendingModel(_self).toB2BendingModel();

  static final _set_bendingModel = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2RopeTuning_set_bendingModel_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_bendingModel(B2BendingModel arg0) =>
      _set_bendingModel(_self, arg0.index);

  static final _get_damping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_damping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_damping() => _get_damping(_self);

  static final _set_damping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RopeTuning_set_damping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_damping(double arg0) => _set_damping(_self, arg0);

  static final _get_stretchStiffness = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_stretchStiffness_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_stretchStiffness() => _get_stretchStiffness(_self);

  static final _set_stretchStiffness = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RopeTuning_set_stretchStiffness_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_stretchStiffness(double arg0) => _set_stretchStiffness(_self, arg0);

  static final _get_stretchHertz = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_stretchHertz_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_stretchHertz() => _get_stretchHertz(_self);

  static final _set_stretchHertz = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RopeTuning_set_stretchHertz_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_stretchHertz(double arg0) => _set_stretchHertz(_self, arg0);

  static final _get_stretchDamping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_stretchDamping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_stretchDamping() => _get_stretchDamping(_self);

  static final _set_stretchDamping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RopeTuning_set_stretchDamping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_stretchDamping(double arg0) => _set_stretchDamping(_self, arg0);

  static final _get_bendStiffness = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_bendStiffness_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_bendStiffness() => _get_bendStiffness(_self);

  static final _set_bendStiffness = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RopeTuning_set_bendStiffness_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_bendStiffness(double arg0) => _set_bendStiffness(_self, arg0);

  static final _get_bendHertz = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_bendHertz_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_bendHertz() => _get_bendHertz(_self);

  static final _set_bendHertz = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RopeTuning_set_bendHertz_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_bendHertz(double arg0) => _set_bendHertz(_self, arg0);

  static final _get_bendDamping = _symbols
      .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_bendDamping_0')
      .asFunction<double Function(Pointer<Void>)>();
  @override
  double get_bendDamping() => _get_bendDamping(_self);

  static final _set_bendDamping = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>(
          'dart_bind_b2RopeTuning_set_bendDamping_1')
      .asFunction<void Function(Pointer<Void>, double)>();
  @override
  void set_bendDamping(double arg0) => _set_bendDamping(_self, arg0);

  static final _get_isometric = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_isometric_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_isometric() => _get_isometric(_self);

  static final _set_isometric = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2RopeTuning_set_isometric_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_isometric(bool arg0) => _set_isometric(_self, arg0);

  static final _get_fixedEffectiveMass = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_fixedEffectiveMass_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_fixedEffectiveMass() => _get_fixedEffectiveMass(_self);

  static final _set_fixedEffectiveMass = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2RopeTuning_set_fixedEffectiveMass_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_fixedEffectiveMass(bool arg0) =>
      _set_fixedEffectiveMass(_self, arg0);

  static final _get_warmStart = _symbols
      .lookup<NativeFunction<Bool Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning_get_warmStart_0')
      .asFunction<bool Function(Pointer<Void>)>();
  @override
  bool get_warmStart() => _get_warmStart(_self);

  static final _set_warmStart = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Bool)>>(
          'dart_bind_b2RopeTuning_set_warmStart_1')
      .asFunction<void Function(Pointer<Void>, bool)>();
  @override
  void set_warmStart(bool arg0) => _set_warmStart(_self, arg0);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2RopeTuning___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2RopeDefFfiAdapter implements B2RopeDefPlatform {
  final Pointer<Void> _self;
  B2RopeDefFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2RopeDef_b2RopeDef_0')
      .asFunction<Pointer<Void> Function()>();

  B2RopeDefFfiAdapter() : _self = _ctr0();

  static final _get_position = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RopeDef_get_position_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_position() => B2Vec2FfiAdapter._(_get_position(_self));

  static final _set_position = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RopeDef_set_position_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_position(B2Vec2FfiAdapter arg0) => _set_position(_self, arg0._self);

  static final _get_vertices = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RopeDef_get_vertices_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_vertices() => B2Vec2FfiAdapter._(_get_vertices(_self));

  static final _set_vertices = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RopeDef_set_vertices_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_vertices(B2Vec2FfiAdapter arg0) => _set_vertices(_self, arg0._self);

  static final _get_count = _symbols
      .lookup<NativeFunction<Int32 Function(Pointer<Void>)>>(
          'dart_bind_b2RopeDef_get_count_0')
      .asFunction<int Function(Pointer<Void>)>();
  @override
  int get_count() => _get_count(_self);

  static final _set_count = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Int32)>>(
          'dart_bind_b2RopeDef_set_count_1')
      .asFunction<void Function(Pointer<Void>, int)>();
  @override
  void set_count(int arg0) => _set_count(_self, arg0);

  static final _get_gravity = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RopeDef_get_gravity_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_gravity() => B2Vec2FfiAdapter._(_get_gravity(_self));

  static final _set_gravity = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RopeDef_set_gravity_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_gravity(B2Vec2FfiAdapter arg0) => _set_gravity(_self, arg0._self);

  static final _get_tuning = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2RopeDef_get_tuning_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2RopeTuningFfiAdapter get_tuning() =>
      B2RopeTuningFfiAdapter._(_get_tuning(_self));

  static final _set_tuning = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2RopeDef_set_tuning_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_tuning(B2RopeTuningFfiAdapter arg0) =>
      _set_tuning(_self, arg0._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2RopeDef___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2RopeFfiAdapter implements B2RopePlatform {
  final Pointer<Void> _self;
  B2RopeFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2Rope_b2Rope_0')
      .asFunction<Pointer<Void> Function()>();

  B2RopeFfiAdapter() : _self = _ctr0();

  static final _create = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Rope_Create_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void create(B2RopeDefFfiAdapter def) => _create(_self, def._self);

  static final _setTuning = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Rope_SetTuning_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void setTuning(B2RopeTuningFfiAdapter tuning) =>
      _setTuning(_self, tuning._self);

  static final _step = _symbols
      .lookup<
          NativeFunction<
              Void Function(Pointer<Void>, Float, Int32,
                  Pointer<Void>)>>('dart_bind_b2Rope_Step_3')
      .asFunction<void Function(Pointer<Void>, double, int, Pointer<Void>)>();
  @override
  void step(double timeStep, int iterations, B2Vec2FfiAdapter position) =>
      _step(_self, timeStep, iterations, position._self);

  static final _reset = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2Rope_Reset_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void reset(B2Vec2FfiAdapter position) => _reset(_self, position._self);
/*
	static final _draw = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2Rope_Draw_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
	@override
	void draw(B2DrawFfiAdapter draw) => _draw(_self, draw._self);
*/

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2Rope___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}

class B2ClipVertexFfiAdapter implements B2ClipVertexPlatform {
  final Pointer<Void> _self;
  B2ClipVertexFfiAdapter._(Pointer<Void> self) : _self = self;

  static final _ctr0 = _symbols
      .lookup<NativeFunction<Pointer<Void> Function()>>(
          'dart_bind_b2ClipVertex_b2ClipVertex_0')
      .asFunction<Pointer<Void> Function()>();

  B2ClipVertexFfiAdapter() : _self = _ctr0();

  static final _get_v = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ClipVertex_get_v_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2Vec2FfiAdapter get_v() => B2Vec2FfiAdapter._(_get_v(_self));

  static final _set_v = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ClipVertex_set_v_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_v(B2Vec2FfiAdapter arg0) => _set_v(_self, arg0._self);

  static final _get_id = _symbols
      .lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>(
          'dart_bind_b2ClipVertex_get_id_0')
      .asFunction<Pointer<Void> Function(Pointer<Void>)>();
  @override
  B2ContactIDFfiAdapter get_id() => B2ContactIDFfiAdapter._(_get_id(_self));

  static final _set_id = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>(
          'dart_bind_b2ClipVertex_set_id_1')
      .asFunction<void Function(Pointer<Void>, Pointer<Void>)>();
  @override
  void set_id(B2ContactIDFfiAdapter arg0) => _set_id(_self, arg0._self);

  static final ___destroy__ = _symbols
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
          'dart_bind_b2ClipVertex___destroy___0')
      .asFunction<void Function(Pointer<Void>)>();
  @override
  void dispose() => ___destroy__(_self);
}
