import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

/// A macos implementation of the FlutterBox2d plugin.
class FlutterBox2DMacos extends FlutterBox2DPlatform {
  static void registerWith() {
    FlutterBox2DPlatform.instance = FlutterBox2DMacos();
  }

  @override
  num get b2DynamicBody => throw UnimplementedError(); // b2_dynamicBody';

  @override
  B2Vec2Delegate b2Vec2Delegate(double x, double y) =>
      throw UnimplementedError(); // B2Vec2JSImpl(x, y);

  @override
  B2WorldDelegate b2WorldDelegate(double x, double y) =>
      throw UnimplementedError(); // B2WorldJSImpl(B2Vec2JSImpl(x, y));

  @override
  B2BodyDefDelegate b2BodyDefDelegate() =>
      throw UnimplementedError(); // B2BodyDefJSImpl();

  @override
  B2BodyDelegate b2BodyDelegate() =>
      throw UnimplementedError(); // B2BodyJSImpl();

  @override
  B2FixtureDelegate b2FixtureDelegate() =>
      throw UnimplementedError(); // B2FixtureJSImpl();

  @override
  B2PolygonShapeDelegate b2PolygonShapeDelegate() =>
      throw UnimplementedError(); // B2PolygonShapeJSImpl();

  @override
  B2ShapeDelegate b2ShapeDelegate() =>
      throw UnimplementedError(); // B2ShapeJSImpl();
}
