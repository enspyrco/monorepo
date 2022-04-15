import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'src/box2d_js_adapter.dart';

/// A web implementation of the FlutterBox2d plugin.
class FlutterBox2DWeb extends FlutterBox2DPlatform {
  // Called by code generated at build-time to get the appropriate implementation
  static void registerWith(Registrar registrar) {
    FlutterBox2DPlatform.instance = FlutterBox2DWeb();
  }

  @override
  B2BodyDefPlatform b2BodyDef() => B2BodyDefJSAdapter();

  @override
  B2PolygonShapePlatform b2PolygonShape() => B2PolygonShapeJSAdapter();

  @override
  B2Vec2Platform b2Vec2(double x, double y) => B2Vec2JSAdapter.from(x, y);

  @override
  B2WorldPlatform b2World(B2Vec2JSAdapter vec) => B2WorldJSAdapter(vec);
}
