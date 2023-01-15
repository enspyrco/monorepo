
import 'flutter_opengl_texture_platform_interface.dart';

class FlutterOpenglTexture {
  Future<String?> getPlatformVersion() {
    return FlutterOpenglTexturePlatform.instance.getPlatformVersion();
  }
}
