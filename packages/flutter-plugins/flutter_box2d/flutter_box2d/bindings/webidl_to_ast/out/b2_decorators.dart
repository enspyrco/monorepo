import 'flutter_box2d_platform_interface.dart';
import 'b2_delegates.dart';

class B2Shape {

}

class B2JointDef {

	final B2JointDefPlatform _delegate;

	B2JointDef() : _delegate = FlutterBox2DPlatform.instance.b2JointDef_0();

}

class B2Joint {

}

class VoidPtr {

}

class B2Contact {

}

class B2ContactListener {

}

class JSContactListener {

	final JSContactListenerPlatform _delegate;

	JSContactListener() : _delegate = FlutterBox2DPlatform.instance.JSContactListener_0();

}

class B2World {

	final B2WorldPlatform _delegate;

	B2World.from1(B2Vec2Platform gravity) : _delegate = FlutterBox2DPlatform.instance.b2World_1(gravity);

}

class B2FixtureUserData {

}

class B2FixtureDef {

	final B2FixtureDefPlatform _delegate;

	B2FixtureDef() : _delegate = FlutterBox2DPlatform.instance.b2FixtureDef_0();

}

class B2Fixture {

}

class B2Transform {

	final B2TransformPlatform _delegate;

	B2Transform() : _delegate = FlutterBox2DPlatform.instance.b2Transform_0();

	B2Transform.from2(B2Vec2Platform position, B2RotPlatform rotation) : _delegate = FlutterBox2DPlatform.instance.b2Transform_2(position, rotation);

}

class B2RayCastCallback {

}

class JSRayCastCallback {

	final JSRayCastCallbackPlatform _delegate;

	JSRayCastCallback() : _delegate = FlutterBox2DPlatform.instance.JSRayCastCallback_0();

}

class B2QueryCallback {

}

class JSQueryCallback {

	final JSQueryCallbackPlatform _delegate;

	JSQueryCallback() : _delegate = FlutterBox2DPlatform.instance.JSQueryCallback_0();

}

class B2MassData {

	final B2MassDataPlatform _delegate;

	B2MassData() : _delegate = FlutterBox2DPlatform.instance.b2MassData_0();

}

class B2Vec2 {

	final B2Vec2Platform _delegate;

	B2Vec2() : _delegate = FlutterBox2DPlatform.instance.b2Vec2_0();

	B2Vec2.from2(double x, double y) : _delegate = FlutterBox2DPlatform.instance.b2Vec2_2(x, y);

}

class B2Vec3 {

	final B2Vec3Platform _delegate;

	B2Vec3() : _delegate = FlutterBox2DPlatform.instance.b2Vec3_0();

	B2Vec3.from3(double x, double y, double z) : _delegate = FlutterBox2DPlatform.instance.b2Vec3_3(x, y, z);

}

class B2BodyUserData {

}

class B2Body {

}

class B2BodyDef {

	final B2BodyDefPlatform _delegate;

	B2BodyDef() : _delegate = FlutterBox2DPlatform.instance.b2BodyDef_0();

}

class B2Filter {

	final B2FilterPlatform _delegate;

	B2Filter() : _delegate = FlutterBox2DPlatform.instance.b2Filter_0();

}

class B2AABB {

	final B2AABBPlatform _delegate;

	B2AABB() : _delegate = FlutterBox2DPlatform.instance.b2AABB_0();

}

class B2CircleShape {

	final B2CircleShapePlatform _delegate;

	B2CircleShape() : _delegate = FlutterBox2DPlatform.instance.b2CircleShape_0();

}

class B2EdgeShape {

	final B2EdgeShapePlatform _delegate;

	B2EdgeShape() : _delegate = FlutterBox2DPlatform.instance.b2EdgeShape_0();

}

class B2JointUserData {

}

class B2WeldJoint {

}

class B2WeldJointDef {

	final B2WeldJointDefPlatform _delegate;

	B2WeldJointDef() : _delegate = FlutterBox2DPlatform.instance.b2WeldJointDef_0();

}

class B2ChainShape {

	final B2ChainShapePlatform _delegate;

	B2ChainShape() : _delegate = FlutterBox2DPlatform.instance.b2ChainShape_0();

}

class B2Color {

	final B2ColorPlatform _delegate;

	B2Color() : _delegate = FlutterBox2DPlatform.instance.b2Color_0();

	B2Color.from3(double r, double g, double b) : _delegate = FlutterBox2DPlatform.instance.b2Color_3(r, g, b);

}

class B2ContactEdge {

	final B2ContactEdgePlatform _delegate;

	B2ContactEdge() : _delegate = FlutterBox2DPlatform.instance.b2ContactEdge_0();

}

class B2ContactFeature {

}

class B2ContactFilter {

}

class JSContactFilter {

	final JSContactFilterPlatform _delegate;

	JSContactFilter() : _delegate = FlutterBox2DPlatform.instance.JSContactFilter_0();

}

class B2ContactID {

}

class B2ContactImpulse {

}

class B2DestructionListener {

}

class B2DestructionListenerWrapper {

}

class JSDestructionListener {

	final JSDestructionListenerPlatform _delegate;

	JSDestructionListener() : _delegate = FlutterBox2DPlatform.instance.JSDestructionListener_0();

}

class B2DistanceJoint {

}

class B2DistanceJointDef {

	final B2DistanceJointDefPlatform _delegate;

	B2DistanceJointDef() : _delegate = FlutterBox2DPlatform.instance.b2DistanceJointDef_0();

}

class B2Draw {

}

class JSDraw {

	final JSDrawPlatform _delegate;

	JSDraw() : _delegate = FlutterBox2DPlatform.instance.JSDraw_0();

}

class B2FrictionJoint {

}

class B2FrictionJointDef {

	final B2FrictionJointDefPlatform _delegate;

	B2FrictionJointDef() : _delegate = FlutterBox2DPlatform.instance.b2FrictionJointDef_0();

}

class B2GearJoint {

}

class B2GearJointDef {

	final B2GearJointDefPlatform _delegate;

	B2GearJointDef() : _delegate = FlutterBox2DPlatform.instance.b2GearJointDef_0();

}

class B2JointEdge {

	final B2JointEdgePlatform _delegate;

	B2JointEdge() : _delegate = FlutterBox2DPlatform.instance.b2JointEdge_0();

}

class B2Manifold {

	final B2ManifoldPlatform _delegate;

	B2Manifold() : _delegate = FlutterBox2DPlatform.instance.b2Manifold_0();

}

class B2WorldManifold {

	final B2WorldManifoldPlatform _delegate;

	B2WorldManifold() : _delegate = FlutterBox2DPlatform.instance.b2WorldManifold_0();

}

class B2ManifoldPoint {

	final B2ManifoldPointPlatform _delegate;

	B2ManifoldPoint() : _delegate = FlutterBox2DPlatform.instance.b2ManifoldPoint_0();

}

class B2Mat22 {

	final B2Mat22Platform _delegate;

	B2Mat22() : _delegate = FlutterBox2DPlatform.instance.b2Mat22_0();

	B2Mat22.from2(B2Vec2Platform a11, B2Vec2Platform a12) : _delegate = FlutterBox2DPlatform.instance.b2Mat22_2(a11, a12);

	B2Mat22.from4(double a11, double a12, double a21, double a22) : _delegate = FlutterBox2DPlatform.instance.b2Mat22_4(a11, a12, a21, a22);

}

class B2Mat33 {

	final B2Mat33Platform _delegate;

	B2Mat33() : _delegate = FlutterBox2DPlatform.instance.b2Mat33_0();

	B2Mat33.from3(B2Vec3Platform c1, B2Vec3Platform c2, B2Vec3Platform c3) : _delegate = FlutterBox2DPlatform.instance.b2Mat33_3(c1, c2, c3);

}

class B2MouseJoint {

}

class B2MouseJointDef {

	final B2MouseJointDefPlatform _delegate;

	B2MouseJointDef() : _delegate = FlutterBox2DPlatform.instance.b2MouseJointDef_0();

}

class B2PolygonShape {

	final B2PolygonShapePlatform _delegate;

	B2PolygonShape() : _delegate = FlutterBox2DPlatform.instance.b2PolygonShape_0();

}

class B2PrismaticJoint {

}

class B2PrismaticJointDef {

	final B2PrismaticJointDefPlatform _delegate;

	B2PrismaticJointDef() : _delegate = FlutterBox2DPlatform.instance.b2PrismaticJointDef_0();

}

class B2Profile {

}

class B2PulleyJoint {

}

class B2PulleyJointDef {

	final B2PulleyJointDefPlatform _delegate;

	B2PulleyJointDef() : _delegate = FlutterBox2DPlatform.instance.b2PulleyJointDef_0();

}

class B2RayCastInput {

}

class B2RayCastOutput {

}

class B2RevoluteJoint {

}

class B2RevoluteJointDef {

	final B2RevoluteJointDefPlatform _delegate;

	B2RevoluteJointDef() : _delegate = FlutterBox2DPlatform.instance.b2RevoluteJointDef_0();

}

class B2Rot {

	final B2RotPlatform _delegate;

	B2Rot() : _delegate = FlutterBox2DPlatform.instance.b2Rot_0();

	B2Rot.from1(double angle) : _delegate = FlutterBox2DPlatform.instance.b2Rot_1(angle);

}

class B2WheelJoint {

}

class B2WheelJointDef {

	final B2WheelJointDefPlatform _delegate;

	B2WheelJointDef() : _delegate = FlutterBox2DPlatform.instance.b2WheelJointDef_0();

}

class B2MotorJoint {

}

class B2MotorJointDef {

	final B2MotorJointDefPlatform _delegate;

	B2MotorJointDef() : _delegate = FlutterBox2DPlatform.instance.b2MotorJointDef_0();

}

class B2RopeTuning {

	final B2RopeTuningPlatform _delegate;

	B2RopeTuning() : _delegate = FlutterBox2DPlatform.instance.b2RopeTuning_0();

}

class B2RopeDef {

	final B2RopeDefPlatform _delegate;

	B2RopeDef() : _delegate = FlutterBox2DPlatform.instance.b2RopeDef_0();

}

class B2Rope {

	final B2RopePlatform _delegate;

	B2Rope() : _delegate = FlutterBox2DPlatform.instance.b2Rope_0();

}

class B2ClipVertex {

	final B2ClipVertexPlatform _delegate;

	B2ClipVertex() : _delegate = FlutterBox2DPlatform.instance.b2ClipVertex_0();

}

