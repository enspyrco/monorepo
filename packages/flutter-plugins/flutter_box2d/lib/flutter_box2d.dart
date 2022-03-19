
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterBox2d {
  static const MethodChannel _channel = MethodChannel('flutter_box2d');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
