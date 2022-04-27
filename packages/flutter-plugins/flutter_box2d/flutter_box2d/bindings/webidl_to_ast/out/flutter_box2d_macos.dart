//import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'b2_adapters_c.dart';
import 'b2_delegates.dart';
import 'flutter_box2d_platform_interface.dart';

/// The macos implementation of the FlutterBox2d plugin.
class FlutterBox2DMacos extends FlutterBox2DPlatform {
  // Called by code generated at build-time to setup the appropriate platform implementation.
  static void registerWith() {
    FlutterBox2DPlatform.instance = FlutterBox2DMacos();
  }

  FlutterBox2DMacos();

	B2WorldPlatform b2World_1(covariant B2Vec2FfiAdapter gravity) => B2WorldFfiAdapter.from1(gravity);

	B2Vec2Platform b2Vec2_0() => B2Vec2FfiAdapter();

	B2Vec2Platform b2Vec2_2(double x, double y) => B2Vec2FfiAdapter.from2(x, y);

}
