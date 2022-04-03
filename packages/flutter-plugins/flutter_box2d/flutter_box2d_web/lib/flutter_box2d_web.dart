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
  B2Vec2Delegate b2Vec2(double x, double y) => B2Vec2JSImpl(x, y);

  @override
  B2WorldDelegate b2World(B2Vec2Delegate vec) =>
      B2WorldJSImpl(B2Vec2JSImpl(vec.x, vec.y));

  @override
  B2BodyDefDelegate b2BodyDef() => B2BodyDefJSImpl();

  @override
  B2PolygonShapeDelegate b2PolygonShape() => B2PolygonShapeJSImpl();

  @override
  B2ShapeDelegate b2Shape() => B2ShapeJSImpl();
}
