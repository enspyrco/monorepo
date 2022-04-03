import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_box2d_platform_interface.dart';

export 'src/b2_classes.dart';
export 'src/b2_constants.dart';
export 'src/b2_delegates.dart';

/// The interface that implementations of flutter_box2d must implement.
///
/// Platform implementations should extend this class rather than implement it as `flutter_box2d`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [FlutterBox2DPlatform] methods.
///
/// For more details see: https://pub.dev/packages/plugin_platform_interface
abstract class FlutterBox2DPlatform extends PlatformInterface {
  /// Constructs a FlutterBox2DPlatform.
  FlutterBox2DPlatform() : super(token: _token);

  static final Object _token = Object();
  static FlutterBox2DPlatform _instance = FlutterBox2DDefault();

  static FlutterBox2DPlatform get instance => _instance;

  /// Platform-specific plugins set this with their own platform-specific
  /// class that extends [FlutterBox2DPlatform] when they register themselves.
  static set instance(FlutterBox2DPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  B2BodyDefDelegate b2BodyDef() {
    throw UnimplementedError('b2BodyDef() has not been implemented.');
  }

  B2PolygonShapeDelegate b2PolygonShape() {
    throw UnimplementedError('b2PolygonShape() has not been implemented.');
  }

  B2ShapeDelegate b2Shape() {
    throw UnimplementedError('b2Shape() has not been implemented.');
  }

  B2Vec2Delegate b2Vec2(double x, double y) {
    throw UnimplementedError(
        'b2Vec2(double x, double y) has not been implemented.');
  }

  B2WorldDelegate b2World(covariant B2Vec2Delegate vec) {
    throw UnimplementedError(
        'b2World(double x, double y) has not been implemented.');
  }
}

class FlutterBox2DDefault extends FlutterBox2DPlatform {}
