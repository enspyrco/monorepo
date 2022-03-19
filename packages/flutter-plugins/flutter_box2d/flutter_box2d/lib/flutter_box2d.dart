import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

class FlutterBox2d {
  static const MethodChannel _channel = MethodChannel('flutter_box2d');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<bool> launch(String urlString) async {
    final bool? result = await FlutterBox2DPlatform.instance.launch(urlString);
    // ...
    return result!;
  }
}
