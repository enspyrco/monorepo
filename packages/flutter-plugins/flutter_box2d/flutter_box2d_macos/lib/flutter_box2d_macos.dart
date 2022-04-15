import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

import 'src/b2_ffi_delegates.dart';

/// A macos implementation of the FlutterBox2d plugin.
class FlutterBox2DMacos extends FlutterBox2DPlatform {
  // The app using our plugin will generate code at build-time, which the tool/engine
  // calls at run time (eg. flutter_box2d/.dart_tool/flutter_build/generated_main.dart),
  // to get the appropriate implementation of FlutterBox2DPlatform. Eg, if the
  // parent app is macos app, the generated code will call this function.
  //
  // The generated code is marked @pragma('vm:entry-point'), so presumably non-Dart, maybe the engine?
  static void registerWith() {
    FlutterBox2DPlatform.instance = FlutterBox2DMacos();
  }

  FlutterBox2DMacos();

  @override
  num get b2DynamicBody => b2BodyType.b2_dynamicBody;

  @override
  B2BodyDefPlatform b2BodyDef() => B2BodyDefFfi();

  @override
  B2PolygonShapePlatform b2PolygonShape() => B2PolygonShapeFfi();

  @override
  B2Vec2Platform b2Vec2(double x, double y) => B2Vec2Ffi(x, y);

  @override
  B2WorldPlatform b2World(B2Vec2Ffi vec) => B2WorldFfi(vec);
}
