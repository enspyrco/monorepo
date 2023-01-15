#import "FlutterOpenglTexturePlugin.h"
#import "OpenGLRender.h"
#import "SampleRenderWorker.h"
#if __has_include(<flutter_opengl_texture/flutter_opengl_texture-Swift.h>)
#import <flutter_opengl_texture/flutter_opengl_texture-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_opengl_texture-Swift.h"
#endif

@interface FlutterOpenglTexturePlugin()
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, OpenGLRender *> *renders;
@property (nonatomic, strong) NSObject<FlutterTextureRegistry> *textures;
@end

@implementation FlutterOpenglTexturePlugin

- (instancetype)initWithTextures:(NSObject<FlutterTextureRegistry> *)textures {
    self = [super init];
    if (self) {
        _renders = [[NSMutableDictionary alloc] init];
        _textures = textures;
    }
    return self;
}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"opengl_texture"
                                     binaryMessenger:[registrar messenger]];
    FlutterOpenglTexturePlugin* instance = [[FlutterOpenglTexturePlugin alloc] initWithTextures:[registrar textures]];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"create" isEqualToString:call.method]) {
        CGFloat width = [call.arguments[@"width"] floatValue];
        CGFloat height = [call.arguments[@"height"] floatValue];
        
        NSInteger __block textureId;
        id<FlutterTextureRegistry> __weak registry = self.textures;
        
        OpenGLRender *render = [[OpenGLRender alloc] initWithSize:CGSizeMake(width, height)
                                                           worker:[[SampleRenderWorker alloc] init]
                                                       onNewFrame:^{
                                                           [registry textureFrameAvailable:textureId];
                                                       }];
        
        textureId = [self.textures registerTexture:render];
        self.renders[@(textureId)] = render;
        result(@(textureId));
    } else if ([@"dispose" isEqualToString:call.method]) {
        NSNumber *textureId = call.arguments[@"textureId"];
        OpenGLRender *render = self.renders[textureId];
        [render dispose];
        [self.renders removeObjectForKey:textureId];
        result(nil);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
