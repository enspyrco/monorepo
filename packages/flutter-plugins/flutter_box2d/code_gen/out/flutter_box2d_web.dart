import 'package:flutter_box2d_platform_interface/b2_delegates.dart';
import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'b2_adapters_web.dart';

/// The web implementation of the FlutterBox2d plugin.
class FlutterBox2DWeb extends FlutterBox2DPlatform {
  // Called by code generated at build-time to setup the appropriate platform implementation.
  static void registerWith(Registrar registrar) {
    FlutterBox2DPlatform.instance = FlutterBox2DWeb();
  }

	B2JointDefPlatform b2JointDef_0() => B2JointDefJSAdapter();

	JSContactListenerPlatform JSContactListener_0() => JSContactListenerJSAdapter();

	B2WorldPlatform b2World_1(covariant B2Vec2JSAdapter gravity) => B2WorldJSAdapter.from1(gravity);

	B2FixtureDefPlatform b2FixtureDef_0() => B2FixtureDefJSAdapter();

	B2TransformPlatform b2Transform_0() => B2TransformJSAdapter();

	B2TransformPlatform b2Transform_2(covariant B2Vec2JSAdapter position, covariant B2RotJSAdapter rotation) => B2TransformJSAdapter.from2(position, rotation);

	JSRayCastCallbackPlatform JSRayCastCallback_0() => JSRayCastCallbackJSAdapter();

	JSQueryCallbackPlatform JSQueryCallback_0() => JSQueryCallbackJSAdapter();

	B2MassDataPlatform b2MassData_0() => B2MassDataJSAdapter();

	B2Vec2Platform b2Vec2_0() => B2Vec2JSAdapter();

	B2Vec2Platform b2Vec2_2(double x, double y) => B2Vec2JSAdapter.from2(x, y);

	B2Vec3Platform b2Vec3_0() => B2Vec3JSAdapter();

	B2Vec3Platform b2Vec3_3(double x, double y, double z) => B2Vec3JSAdapter.from3(x, y, z);

	B2BodyDefPlatform b2BodyDef_0() => B2BodyDefJSAdapter();

	B2FilterPlatform b2Filter_0() => B2FilterJSAdapter();

	B2AABBPlatform b2AABB_0() => B2AABBJSAdapter();

	B2CircleShapePlatform b2CircleShape_0() => B2CircleShapeJSAdapter();

	B2EdgeShapePlatform b2EdgeShape_0() => B2EdgeShapeJSAdapter();

	B2WeldJointDefPlatform b2WeldJointDef_0() => B2WeldJointDefJSAdapter();

	B2ChainShapePlatform b2ChainShape_0() => B2ChainShapeJSAdapter();

	B2ColorPlatform b2Color_0() => B2ColorJSAdapter();

	B2ColorPlatform b2Color_3(double r, double g, double b) => B2ColorJSAdapter.from3(r, g, b);

	B2ContactEdgePlatform b2ContactEdge_0() => B2ContactEdgeJSAdapter();

	JSContactFilterPlatform JSContactFilter_0() => JSContactFilterJSAdapter();

	JSDestructionListenerPlatform JSDestructionListener_0() => JSDestructionListenerJSAdapter();

	B2DistanceJointDefPlatform b2DistanceJointDef_0() => B2DistanceJointDefJSAdapter();

	JSDrawPlatform JSDraw_0() => JSDrawJSAdapter();

	B2FrictionJointDefPlatform b2FrictionJointDef_0() => B2FrictionJointDefJSAdapter();

	B2GearJointDefPlatform b2GearJointDef_0() => B2GearJointDefJSAdapter();

	B2JointEdgePlatform b2JointEdge_0() => B2JointEdgeJSAdapter();

	B2ManifoldPlatform b2Manifold_0() => B2ManifoldJSAdapter();

	B2WorldManifoldPlatform b2WorldManifold_0() => B2WorldManifoldJSAdapter();

	B2ManifoldPointPlatform b2ManifoldPoint_0() => B2ManifoldPointJSAdapter();

	B2Mat22Platform b2Mat22_0() => B2Mat22JSAdapter();

	B2Mat22Platform b2Mat22_2(covariant B2Vec2JSAdapter a11, covariant B2Vec2JSAdapter a12) => B2Mat22JSAdapter.from2(a11, a12);

	B2Mat22Platform b2Mat22_4(double a11, double a12, double a21, double a22) => B2Mat22JSAdapter.from4(a11, a12, a21, a22);

	B2Mat33Platform b2Mat33_0() => B2Mat33JSAdapter();

	B2Mat33Platform b2Mat33_3(covariant B2Vec3JSAdapter c1, covariant B2Vec3JSAdapter c2, covariant B2Vec3JSAdapter c3) => B2Mat33JSAdapter.from3(c1, c2, c3);

	B2MouseJointDefPlatform b2MouseJointDef_0() => B2MouseJointDefJSAdapter();

	B2PolygonShapePlatform b2PolygonShape_0() => B2PolygonShapeJSAdapter();

	B2PrismaticJointDefPlatform b2PrismaticJointDef_0() => B2PrismaticJointDefJSAdapter();

	B2PulleyJointDefPlatform b2PulleyJointDef_0() => B2PulleyJointDefJSAdapter();

	B2RevoluteJointDefPlatform b2RevoluteJointDef_0() => B2RevoluteJointDefJSAdapter();

	B2RotPlatform b2Rot_0() => B2RotJSAdapter();

	B2RotPlatform b2Rot_1(double angle) => B2RotJSAdapter.from1(angle);

	B2WheelJointDefPlatform b2WheelJointDef_0() => B2WheelJointDefJSAdapter();

	B2MotorJointDefPlatform b2MotorJointDef_0() => B2MotorJointDefJSAdapter();

	B2RopeTuningPlatform b2RopeTuning_0() => B2RopeTuningJSAdapter();

	B2RopeDefPlatform b2RopeDef_0() => B2RopeDefJSAdapter();

	B2RopePlatform b2Rope_0() => B2RopeJSAdapter();

	B2ClipVertexPlatform b2ClipVertex_0() => B2ClipVertexJSAdapter();

}
