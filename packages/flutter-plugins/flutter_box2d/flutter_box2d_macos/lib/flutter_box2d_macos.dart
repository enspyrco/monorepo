import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

import 'src/b2_ffi_delegates.dart';

/// A macos implementation of the FlutterBox2d plugin.
class FlutterBox2DMacos extends FlutterBox2DPlatform {
  // The parent app will generate code at build-time, which the plugin will call
  // at run time, to get the appropriate implementation of FlutterBox2DPlatform
  static void registerWith() {
    FlutterBox2DPlatform.instance = FlutterBox2DMacos();
  }

  FlutterBox2DMacos();

  @override
  num get b2DynamicBody => b2BodyType.b2_dynamicBody;

  @override
  B2BodyDefDelegate b2BodyDef() => B2BodyDefFfi();

  @override
  B2PolygonShapeDelegate b2PolygonShape() => B2PolygonShapeFfi();

  @override
  B2Vec2Delegate b2Vec2(double x, double y) => B2Vec2Ffi(x, y);

  @override
  B2WorldDelegate b2World(B2Vec2Ffi vec) => B2WorldFfi(vec);
}
