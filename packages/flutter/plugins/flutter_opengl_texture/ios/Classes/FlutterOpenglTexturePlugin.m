#import "FlutterOpenglTexturePlugin.h"
#if __has_include(<flutter_opengl_texture/flutter_opengl_texture-Swift.h>)
#import <flutter_opengl_texture/flutter_opengl_texture-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_opengl_texture-Swift.h"
#endif

@implementation FlutterOpenglTexturePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterOpenglTexturePlugin registerWithRegistrar:registrar];
}
@end
