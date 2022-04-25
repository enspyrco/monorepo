//import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'b2_adapters_js.dart';
import 'b2_delegates.dart';
import 'flutter_box2d_platform_interface.dart';

/// The web implementation of the FlutterBox2d plugin.
class FlutterBox2DWeb extends FlutterBox2DPlatform {
  // Called by code generated at build-time to setup the appropriate platform implementation.
  static void registerWith(Registrar registrar) {
    FlutterBox2DPlatform.instance = FlutterBox2DWeb();
  }

	B2Vec2Platform b2Vec2_0() => B2Vec2JSAdapter();

	B2Vec2Platform b2Vec2_2(double x, double y) => B2Vec2JSAdapter.from2(x, y);

}
