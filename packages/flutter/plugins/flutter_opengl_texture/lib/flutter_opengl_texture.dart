import 'package:flutter/services.dart';

import 'flutter_opengl_texture_platform_interface.dart';

class FlutterOpenglTexture {
  static const MethodChannel _channel = MethodChannel('opengl_texture');

  int? textureId;

  Future<int?> initialize(double width, double height) async {
    textureId = await _channel.invokeMethod('create', {
      'width': width,
      'height': height,
    });
    return textureId;
  }

  Future<void> dispose() =>
      _channel.invokeMethod('dispose', {'textureId': textureId});

  bool get isInitialized => textureId != null;

  Future<String?> getPlatformVersion() {
    return FlutterOpenglTexturePlatform.instance.getPlatformVersion();
  }
}
