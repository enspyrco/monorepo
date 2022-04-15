import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class B2BodyDefPlatform extends PlatformInterface {
  B2BodyDefPlatform() : super(token: _token);

  static final Object _token = Object();
  static late B2BodyDefPlatform instance;

  void setType(int type);
  void setPosition(covariant B2Vec2Platform position);
}

abstract class B2BodyPlatform extends PlatformInterface {
  B2BodyPlatform() : super(token: _token);

  static final Object _token = Object();
  static late B2BodyPlatform instance;

  B2FixturePlatform createFixture2(
      covariant B2ShapePlatform shape, double density);
  void setTransform(covariant B2Vec2Platform position, double angle);
  void setLinearVelocity(covariant B2Vec2Platform v);
  void setAwake(bool flag);
  void setEnabled(bool flag);
  B2Vec2Platform getPosition();
  B2Vec2Platform getLinearVelocity();
}

abstract class B2FixturePlatform extends PlatformInterface {
  B2FixturePlatform() : super(token: _token);

  static late B2PolygonShapePlatform instance;
  static final Object _token = Object();
}

abstract class B2PolygonShapePlatform extends PlatformInterface
    implements B2ShapePlatform {
  B2PolygonShapePlatform() : super(token: _token);

  static late B2PolygonShapePlatform instance;
  static final Object _token = Object();

  void setAsBox(double hx, double hy);
  int getType();
}

abstract class B2ShapePlatform extends PlatformInterface {
  B2ShapePlatform() : super(token: _token);

  static final Object _token = Object();
  static B2ShapePlatform? _instance;
}

abstract class B2Vec2Platform extends PlatformInterface {
  B2Vec2Platform(this.x, this.y) : super(token: _token);

  static final Object _token = Object();
  static B2Vec2Platform? _instance;

  final double x;
  final double y;
  double get length;
}

abstract class B2WorldPlatform extends PlatformInterface {
  B2WorldPlatform(double x, double y) : super(token: _token);

  static final Object _token = Object();
  static B2WorldPlatform? _instance;

  B2BodyPlatform createBody(covariant B2BodyDefPlatform def);

  void step(double timeStep, int velocityIterations, int positionIterations);
}
