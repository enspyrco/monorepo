import Flutter
import UIKit

public class SwiftFlutterOpenglTexturePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_opengl_texture", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterOpenglTexturePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
