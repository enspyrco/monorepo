import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_opengl_texture/flutter_opengl_texture.dart';
import 'package:flutter_opengl_texture/flutter_opengl_texture_platform_interface.dart';
import 'package:flutter_opengl_texture/flutter_opengl_texture_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterOpenglTexturePlatform
    with MockPlatformInterfaceMixin
    implements FlutterOpenglTexturePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterOpenglTexturePlatform initialPlatform = FlutterOpenglTexturePlatform.instance;

  test('$MethodChannelFlutterOpenglTexture is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterOpenglTexture>());
  });

  test('getPlatformVersion', () async {
    FlutterOpenglTexture flutterOpenglTexturePlugin = FlutterOpenglTexture();
    MockFlutterOpenglTexturePlatform fakePlatform = MockFlutterOpenglTexturePlatform();
    FlutterOpenglTexturePlatform.instance = fakePlatform;

    expect(await flutterOpenglTexturePlugin.getPlatformVersion(), '42');
  });
}
