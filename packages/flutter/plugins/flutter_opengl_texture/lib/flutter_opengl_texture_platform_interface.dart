import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_opengl_texture_method_channel.dart';

abstract class FlutterOpenglTexturePlatform extends PlatformInterface {
  /// Constructs a FlutterOpenglTexturePlatform.
  FlutterOpenglTexturePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterOpenglTexturePlatform _instance = MethodChannelFlutterOpenglTexture();

  /// The default instance of [FlutterOpenglTexturePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterOpenglTexture].
  static FlutterOpenglTexturePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterOpenglTexturePlatform] when
  /// they register themselves.
  static set instance(FlutterOpenglTexturePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
