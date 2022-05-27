
import 'dart:async';

import 'package:flutter/services.dart';

class Flireator {
  static const MethodChannel _channel = MethodChannel('flireator');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
