import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_opengl_texture/flutter_opengl_texture_method_channel.dart';

void main() {
  MethodChannelFlutterOpenglTexture platform = MethodChannelFlutterOpenglTexture();
  const MethodChannel channel = MethodChannel('flutter_opengl_texture');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
