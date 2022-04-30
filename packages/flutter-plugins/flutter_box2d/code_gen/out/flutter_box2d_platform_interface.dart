import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'b2_delegates.dart';

/// The interface that implementations of flutter_box2d must implement.
///
/// Platform implementations should extend this class rather than implement it as `flutter_box2d`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [FlutterBox2DPlatform] methods.
///
/// For more details see: https://pub.dev/packages/plugin_platform_interface
abstract class FlutterBox2DPlatform extends PlatformInterface {
  /// Constructs a FlutterBox2DPlatform.
  FlutterBox2DPlatform() : super(token: _token);

  static final Object _token = Object();
  static late FlutterBox2DPlatform _instance;

  static FlutterBox2DPlatform get instance => _instance;

  /// Platform-specific plugins set this with their own platform-specific
  /// class that extends [FlutterBox2DPlatform] when they register themselves.
  static set instance(FlutterBox2DPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

	B2JointDefPlatform b2JointDef_0() {
		throw UnimplementedError('b2JointDef_0() has not been implemented.');
	}

	JSContactListenerPlatform JSContactListener_0() {
		throw UnimplementedError('JSContactListener_0() has not been implemented.');
	}

	B2WorldPlatform b2World_1(B2Vec2Platform gravity) {
		throw UnimplementedError('b2World_1(B2Vec2Platform gravity) has not been implemented.');
	}

	B2FixtureDefPlatform b2FixtureDef_0() {
		throw UnimplementedError('b2FixtureDef_0() has not been implemented.');
	}

	B2TransformPlatform b2Transform_0() {
		throw UnimplementedError('b2Transform_0() has not been implemented.');
	}

	B2TransformPlatform b2Transform_2(B2Vec2Platform position, B2RotPlatform rotation) {
		throw UnimplementedError('b2Transform_2(B2Vec2Platform position, B2RotPlatform rotation) has not been implemented.');
	}

	JSRayCastCallbackPlatform JSRayCastCallback_0() {
		throw UnimplementedError('JSRayCastCallback_0() has not been implemented.');
	}

	JSQueryCallbackPlatform JSQueryCallback_0() {
		throw UnimplementedError('JSQueryCallback_0() has not been implemented.');
	}

	B2MassDataPlatform b2MassData_0() {
		throw UnimplementedError('b2MassData_0() has not been implemented.');
	}

	B2Vec2Platform b2Vec2_0() {
		throw UnimplementedError('b2Vec2_0() has not been implemented.');
	}

	B2Vec2Platform b2Vec2_2(double x, double y) {
		throw UnimplementedError('b2Vec2_2(double x, double y) has not been implemented.');
	}

	B2Vec3Platform b2Vec3_0() {
		throw UnimplementedError('b2Vec3_0() has not been implemented.');
	}

	B2Vec3Platform b2Vec3_3(double x, double y, double z) {
		throw UnimplementedError('b2Vec3_3(double x, double y, double z) has not been implemented.');
	}

	B2BodyDefPlatform b2BodyDef_0() {
		throw UnimplementedError('b2BodyDef_0() has not been implemented.');
	}

	B2FilterPlatform b2Filter_0() {
		throw UnimplementedError('b2Filter_0() has not been implemented.');
	}

	B2AABBPlatform b2AABB_0() {
		throw UnimplementedError('b2AABB_0() has not been implemented.');
	}

	B2CircleShapePlatform b2CircleShape_0() {
		throw UnimplementedError('b2CircleShape_0() has not been implemented.');
	}

	B2EdgeShapePlatform b2EdgeShape_0() {
		throw UnimplementedError('b2EdgeShape_0() has not been implemented.');
	}

	B2WeldJointDefPlatform b2WeldJointDef_0() {
		throw UnimplementedError('b2WeldJointDef_0() has not been implemented.');
	}

	B2ChainShapePlatform b2ChainShape_0() {
		throw UnimplementedError('b2ChainShape_0() has not been implemented.');
	}

	B2ColorPlatform b2Color_0() {
		throw UnimplementedError('b2Color_0() has not been implemented.');
	}

	B2ColorPlatform b2Color_3(double r, double g, double b) {
		throw UnimplementedError('b2Color_3(double r, double g, double b) has not been implemented.');
	}

	B2ContactEdgePlatform b2ContactEdge_0() {
		throw UnimplementedError('b2ContactEdge_0() has not been implemented.');
	}

	JSContactFilterPlatform JSContactFilter_0() {
		throw UnimplementedError('JSContactFilter_0() has not been implemented.');
	}

	JSDestructionListenerPlatform JSDestructionListener_0() {
		throw UnimplementedError('JSDestructionListener_0() has not been implemented.');
	}

	B2DistanceJointDefPlatform b2DistanceJointDef_0() {
		throw UnimplementedError('b2DistanceJointDef_0() has not been implemented.');
	}

	JSDrawPlatform JSDraw_0() {
		throw UnimplementedError('JSDraw_0() has not been implemented.');
	}

	B2FrictionJointDefPlatform b2FrictionJointDef_0() {
		throw UnimplementedError('b2FrictionJointDef_0() has not been implemented.');
	}

	B2GearJointDefPlatform b2GearJointDef_0() {
		throw UnimplementedError('b2GearJointDef_0() has not been implemented.');
	}

	B2JointEdgePlatform b2JointEdge_0() {
		throw UnimplementedError('b2JointEdge_0() has not been implemented.');
	}

	B2ManifoldPlatform b2Manifold_0() {
		throw UnimplementedError('b2Manifold_0() has not been implemented.');
	}

	B2WorldManifoldPlatform b2WorldManifold_0() {
		throw UnimplementedError('b2WorldManifold_0() has not been implemented.');
	}

	B2ManifoldPointPlatform b2ManifoldPoint_0() {
		throw UnimplementedError('b2ManifoldPoint_0() has not been implemented.');
	}

	B2Mat22Platform b2Mat22_0() {
		throw UnimplementedError('b2Mat22_0() has not been implemented.');
	}

	B2Mat22Platform b2Mat22_2(B2Vec2Platform a11, B2Vec2Platform a12) {
		throw UnimplementedError('b2Mat22_2(B2Vec2Platform a11, B2Vec2Platform a12) has not been implemented.');
	}

	B2Mat22Platform b2Mat22_4(double a11, double a12, double a21, double a22) {
		throw UnimplementedError('b2Mat22_4(double a11, double a12, double a21, double a22) has not been implemented.');
	}

	B2Mat33Platform b2Mat33_0() {
		throw UnimplementedError('b2Mat33_0() has not been implemented.');
	}

	B2Mat33Platform b2Mat33_3(B2Vec3Platform c1, B2Vec3Platform c2, B2Vec3Platform c3) {
		throw UnimplementedError('b2Mat33_3(B2Vec3Platform c1, B2Vec3Platform c2, B2Vec3Platform c3) has not been implemented.');
	}

	B2MouseJointDefPlatform b2MouseJointDef_0() {
		throw UnimplementedError('b2MouseJointDef_0() has not been implemented.');
	}

	B2PolygonShapePlatform b2PolygonShape_0() {
		throw UnimplementedError('b2PolygonShape_0() has not been implemented.');
	}

	B2PrismaticJointDefPlatform b2PrismaticJointDef_0() {
		throw UnimplementedError('b2PrismaticJointDef_0() has not been implemented.');
	}

	B2PulleyJointDefPlatform b2PulleyJointDef_0() {
		throw UnimplementedError('b2PulleyJointDef_0() has not been implemented.');
	}

	B2RevoluteJointDefPlatform b2RevoluteJointDef_0() {
		throw UnimplementedError('b2RevoluteJointDef_0() has not been implemented.');
	}

	B2RotPlatform b2Rot_0() {
		throw UnimplementedError('b2Rot_0() has not been implemented.');
	}

	B2RotPlatform b2Rot_1(double angle) {
		throw UnimplementedError('b2Rot_1(double angle) has not been implemented.');
	}

	B2WheelJointDefPlatform b2WheelJointDef_0() {
		throw UnimplementedError('b2WheelJointDef_0() has not been implemented.');
	}

	B2MotorJointDefPlatform b2MotorJointDef_0() {
		throw UnimplementedError('b2MotorJointDef_0() has not been implemented.');
	}

	B2RopeTuningPlatform b2RopeTuning_0() {
		throw UnimplementedError('b2RopeTuning_0() has not been implemented.');
	}

	B2RopeDefPlatform b2RopeDef_0() {
		throw UnimplementedError('b2RopeDef_0() has not been implemented.');
	}

	B2RopePlatform b2Rope_0() {
		throw UnimplementedError('b2Rope_0() has not been implemented.');
	}

	B2ClipVertexPlatform b2ClipVertex_0() {
		throw UnimplementedError('b2ClipVertex_0() has not been implemented.');
	}

}
