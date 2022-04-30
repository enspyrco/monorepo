//import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'b2_adapters_ffi.dart';
import 'b2_delegates.dart';
import 'flutter_box2d_platform_interface.dart';

/// The macos implementation of the FlutterBox2d plugin.
class FlutterBox2DMacos extends FlutterBox2DPlatform {
  // Called by code generated at build-time to setup the appropriate platform implementation.
  static void registerWith() {
    FlutterBox2DPlatform.instance = FlutterBox2DMacos();
  }

  FlutterBox2DMacos();

	B2JointDefPlatform b2JointDef_0() => B2JointDefFfiAdapter();

	JSContactListenerPlatform JSContactListener_0() => JSContactListenerFfiAdapter();

	B2WorldPlatform b2World_1(covariant B2Vec2FfiAdapter gravity) => B2WorldFfiAdapter.from1(gravity);

	B2FixtureDefPlatform b2FixtureDef_0() => B2FixtureDefFfiAdapter();

	B2TransformPlatform b2Transform_0() => B2TransformFfiAdapter();

	B2TransformPlatform b2Transform_2(covariant B2Vec2FfiAdapter position, covariant B2RotFfiAdapter rotation) => B2TransformFfiAdapter.from2(position, rotation);

	JSRayCastCallbackPlatform JSRayCastCallback_0() => JSRayCastCallbackFfiAdapter();

	JSQueryCallbackPlatform JSQueryCallback_0() => JSQueryCallbackFfiAdapter();

	B2MassDataPlatform b2MassData_0() => B2MassDataFfiAdapter();

	B2Vec2Platform b2Vec2_0() => B2Vec2FfiAdapter();

	B2Vec2Platform b2Vec2_2(double x, double y) => B2Vec2FfiAdapter.from2(x, y);

	B2Vec3Platform b2Vec3_0() => B2Vec3FfiAdapter();

	B2Vec3Platform b2Vec3_3(double x, double y, double z) => B2Vec3FfiAdapter.from3(x, y, z);

	B2BodyDefPlatform b2BodyDef_0() => B2BodyDefFfiAdapter();

	B2FilterPlatform b2Filter_0() => B2FilterFfiAdapter();

	B2AABBPlatform b2AABB_0() => B2AABBFfiAdapter();

	B2CircleShapePlatform b2CircleShape_0() => B2CircleShapeFfiAdapter();

	B2EdgeShapePlatform b2EdgeShape_0() => B2EdgeShapeFfiAdapter();

	B2WeldJointDefPlatform b2WeldJointDef_0() => B2WeldJointDefFfiAdapter();

	B2ChainShapePlatform b2ChainShape_0() => B2ChainShapeFfiAdapter();

	B2ColorPlatform b2Color_0() => B2ColorFfiAdapter();

	B2ColorPlatform b2Color_3(double r, double g, double b) => B2ColorFfiAdapter.from3(r, g, b);

	B2ContactEdgePlatform b2ContactEdge_0() => B2ContactEdgeFfiAdapter();

	JSContactFilterPlatform JSContactFilter_0() => JSContactFilterFfiAdapter();

	JSDestructionListenerPlatform JSDestructionListener_0() => JSDestructionListenerFfiAdapter();

	B2DistanceJointDefPlatform b2DistanceJointDef_0() => B2DistanceJointDefFfiAdapter();

	JSDrawPlatform JSDraw_0() => JSDrawFfiAdapter();

	B2FrictionJointDefPlatform b2FrictionJointDef_0() => B2FrictionJointDefFfiAdapter();

	B2GearJointDefPlatform b2GearJointDef_0() => B2GearJointDefFfiAdapter();

	B2JointEdgePlatform b2JointEdge_0() => B2JointEdgeFfiAdapter();

	B2ManifoldPlatform b2Manifold_0() => B2ManifoldFfiAdapter();

	B2WorldManifoldPlatform b2WorldManifold_0() => B2WorldManifoldFfiAdapter();

	B2ManifoldPointPlatform b2ManifoldPoint_0() => B2ManifoldPointFfiAdapter();

	B2Mat22Platform b2Mat22_0() => B2Mat22FfiAdapter();

	B2Mat22Platform b2Mat22_2(covariant B2Vec2FfiAdapter a11, covariant B2Vec2FfiAdapter a12) => B2Mat22FfiAdapter.from2(a11, a12);

	B2Mat22Platform b2Mat22_4(double a11, double a12, double a21, double a22) => B2Mat22FfiAdapter.from4(a11, a12, a21, a22);

	B2Mat33Platform b2Mat33_0() => B2Mat33FfiAdapter();

	B2Mat33Platform b2Mat33_3(covariant B2Vec3FfiAdapter c1, covariant B2Vec3FfiAdapter c2, covariant B2Vec3FfiAdapter c3) => B2Mat33FfiAdapter.from3(c1, c2, c3);

	B2MouseJointDefPlatform b2MouseJointDef_0() => B2MouseJointDefFfiAdapter();

	B2PolygonShapePlatform b2PolygonShape_0() => B2PolygonShapeFfiAdapter();

	B2PrismaticJointDefPlatform b2PrismaticJointDef_0() => B2PrismaticJointDefFfiAdapter();

	B2PulleyJointDefPlatform b2PulleyJointDef_0() => B2PulleyJointDefFfiAdapter();

	B2RevoluteJointDefPlatform b2RevoluteJointDef_0() => B2RevoluteJointDefFfiAdapter();

	B2RotPlatform b2Rot_0() => B2RotFfiAdapter();

	B2RotPlatform b2Rot_1(double angle) => B2RotFfiAdapter.from1(angle);

	B2WheelJointDefPlatform b2WheelJointDef_0() => B2WheelJointDefFfiAdapter();

	B2MotorJointDefPlatform b2MotorJointDef_0() => B2MotorJointDefFfiAdapter();

	B2RopeTuningPlatform b2RopeTuning_0() => B2RopeTuningFfiAdapter();

	B2RopeDefPlatform b2RopeDef_0() => B2RopeDefFfiAdapter();

	B2RopePlatform b2Rope_0() => B2RopeFfiAdapter();

	B2ClipVertexPlatform b2ClipVertex_0() => B2ClipVertexFfiAdapter();

}
