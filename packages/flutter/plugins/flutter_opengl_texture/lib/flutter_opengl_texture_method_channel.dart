import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_opengl_texture_platform_interface.dart';

/// An implementation of [FlutterOpenglTexturePlatform] that uses method channels.
class MethodChannelFlutterOpenglTexture extends FlutterOpenglTexturePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_opengl_texture');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
