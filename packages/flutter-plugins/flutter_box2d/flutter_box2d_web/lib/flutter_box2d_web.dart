import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'package:flutter_box2d_web/src/box2d_js_impl.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the FlutterBox2d plugin.
class FlutterBox2DWeb extends FlutterBox2DPlatform {
  // Called by code generated at build-time to get the appropriate implementation
  static void registerWith(Registrar registrar) {
    FlutterBox2DPlatform.instance = FlutterBox2DWeb();
  }

  @override
  num get b2DynamicBody => b2_dynamicBody;

  @override
  B2Vec2Delegate b2Vec2Delegate(double x, double y) => B2Vec2JSImpl(x, y);

  @override
  B2WorldDelegate b2WorldDelegate(double x, double y) =>
      B2WorldJSImpl(B2Vec2JSImpl(x, y));

  @override
  B2BodyDefDelegate b2BodyDefDelegate() => B2BodyDefJSImpl();

  @override
  B2BodyDelegate b2BodyDelegate() => B2BodyJSImpl();

  @override
  B2FixtureDelegate b2FixtureDelegate() => B2FixtureJSImpl();

  @override
  B2PolygonShapeDelegate b2PolygonShapeDelegate() => B2PolygonShapeJSImpl();

  @override
  B2ShapeDelegate b2ShapeDelegate() => B2ShapeJSImpl();
}
