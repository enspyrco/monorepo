import 'package:flutter_box2d_platform_interface/b2_delegates.dart';
import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

import 'b2_adapters_ffi.dart';

/// The macos implementation of the FlutterBox2d plugin.
class FlutterBox2DIOS extends FlutterBox2DPlatform {
  // Called by code generated at build-time to setup the appropriate platform implementation.
  static void registerWith() {
    FlutterBox2DPlatform.instance = FlutterBox2DIOS();
  }

  FlutterBox2DIOS();

  @override
  B2JointDefPlatform b2JointDef_0() => B2JointDefFfiAdapter();

  @override
  JSContactListenerPlatform JSContactListener_0() =>
      JSContactListenerFfiAdapter();

  @override
  B2WorldPlatform b2World_1(covariant B2Vec2FfiAdapter gravity) =>
      B2WorldFfiAdapter.from1(gravity);

  @override
  B2FixtureDefPlatform b2FixtureDef_0() => B2FixtureDefFfiAdapter();

  @override
  B2TransformPlatform b2Transform_0() => B2TransformFfiAdapter();

  @override
  B2TransformPlatform b2Transform_2(covariant B2Vec2FfiAdapter position,
          covariant B2RotFfiAdapter rotation) =>
      B2TransformFfiAdapter.from2(position, rotation);

  @override
  JSRayCastCallbackPlatform JSRayCastCallback_0() =>
      JSRayCastCallbackFfiAdapter();

  @override
  JSQueryCallbackPlatform JSQueryCallback_0() => JSQueryCallbackFfiAdapter();

  @override
  B2MassDataPlatform b2MassData_0() => B2MassDataFfiAdapter();

  @override
  B2Vec2Platform b2Vec2_0() => B2Vec2FfiAdapter();

  @override
  B2Vec2Platform b2Vec2_2(double x, double y) => B2Vec2FfiAdapter.from2(x, y);

  @override
  B2Vec3Platform b2Vec3_0() => B2Vec3FfiAdapter();

  @override
  B2Vec3Platform b2Vec3_3(double x, double y, double z) =>
      B2Vec3FfiAdapter.from3(x, y, z);

  @override
  B2BodyDefPlatform b2BodyDef_0() => B2BodyDefFfiAdapter();

  @override
  B2FilterPlatform b2Filter_0() => B2FilterFfiAdapter();

  @override
  B2AABBPlatform b2AABB_0() => B2AABBFfiAdapter();

  @override
  B2CircleShapePlatform b2CircleShape_0() => B2CircleShapeFfiAdapter();

  @override
  B2EdgeShapePlatform b2EdgeShape_0() => B2EdgeShapeFfiAdapter();

  @override
  B2WeldJointDefPlatform b2WeldJointDef_0() => B2WeldJointDefFfiAdapter();

  @override
  B2ChainShapePlatform b2ChainShape_0() => B2ChainShapeFfiAdapter();

  @override
  B2ColorPlatform b2Color_0() => B2ColorFfiAdapter();

  @override
  B2ColorPlatform b2Color_3(double r, double g, double b) =>
      B2ColorFfiAdapter.from3(r, g, b);

  @override
  B2ContactEdgePlatform b2ContactEdge_0() => B2ContactEdgeFfiAdapter();

  @override
  JSContactFilterPlatform JSContactFilter_0() => JSContactFilterFfiAdapter();

  @override
  JSDestructionListenerPlatform JSDestructionListener_0() =>
      JSDestructionListenerFfiAdapter();

  @override
  B2DistanceJointDefPlatform b2DistanceJointDef_0() =>
      B2DistanceJointDefFfiAdapter();

  @override
  JSDrawPlatform JSDraw_0() => JSDrawFfiAdapter();

  @override
  B2FrictionJointDefPlatform b2FrictionJointDef_0() =>
      B2FrictionJointDefFfiAdapter();

  @override
  B2GearJointDefPlatform b2GearJointDef_0() => B2GearJointDefFfiAdapter();

  @override
  B2JointEdgePlatform b2JointEdge_0() => B2JointEdgeFfiAdapter();

  @override
  B2ManifoldPlatform b2Manifold_0() => B2ManifoldFfiAdapter();

  @override
  B2WorldManifoldPlatform b2WorldManifold_0() => B2WorldManifoldFfiAdapter();

  @override
  B2ManifoldPointPlatform b2ManifoldPoint_0() => B2ManifoldPointFfiAdapter();

  @override
  B2Mat22Platform b2Mat22_0() => B2Mat22FfiAdapter();

  @override
  B2Mat22Platform b2Mat22_2(
          covariant B2Vec2FfiAdapter a11, covariant B2Vec2FfiAdapter a12) =>
      B2Mat22FfiAdapter.from2(a11, a12);

  @override
  B2Mat22Platform b2Mat22_4(double a11, double a12, double a21, double a22) =>
      B2Mat22FfiAdapter.from4(a11, a12, a21, a22);

  @override
  B2Mat33Platform b2Mat33_0() => B2Mat33FfiAdapter();

  @override
  B2Mat33Platform b2Mat33_3(covariant B2Vec3FfiAdapter c1,
          covariant B2Vec3FfiAdapter c2, covariant B2Vec3FfiAdapter c3) =>
      B2Mat33FfiAdapter.from3(c1, c2, c3);

  @override
  B2MouseJointDefPlatform b2MouseJointDef_0() => B2MouseJointDefFfiAdapter();

  @override
  B2PolygonShapePlatform b2PolygonShape_0() => B2PolygonShapeFfiAdapter();

  @override
  B2PrismaticJointDefPlatform b2PrismaticJointDef_0() =>
      B2PrismaticJointDefFfiAdapter();

  @override
  B2PulleyJointDefPlatform b2PulleyJointDef_0() => B2PulleyJointDefFfiAdapter();

  @override
  B2RevoluteJointDefPlatform b2RevoluteJointDef_0() =>
      B2RevoluteJointDefFfiAdapter();

  @override
  B2RotPlatform b2Rot_0() => B2RotFfiAdapter();

  @override
  B2RotPlatform b2Rot_1(double angle) => B2RotFfiAdapter.from1(angle);

  @override
  B2WheelJointDefPlatform b2WheelJointDef_0() => B2WheelJointDefFfiAdapter();

  @override
  B2MotorJointDefPlatform b2MotorJointDef_0() => B2MotorJointDefFfiAdapter();

  @override
  B2RopeTuningPlatform b2RopeTuning_0() => B2RopeTuningFfiAdapter();

  @override
  B2RopeDefPlatform b2RopeDef_0() => B2RopeDefFfiAdapter();

  @override
  B2RopePlatform b2Rope_0() => B2RopeFfiAdapter();

  @override
  B2ClipVertexPlatform b2ClipVertex_0() => B2ClipVertexFfiAdapter();
}
