import '../flutter_box2d_platform_interface.dart';

class B2Body {
  B2Body._(B2BodyPlatform delegate) : _delegate = delegate;

  final B2BodyPlatform _delegate;

  B2Fixture createFixture(B2Shape shape, double density) =>
      B2Fixture._(_delegate.createFixture2(shape._delegate, density));
  void setTransform(B2Vec2 position, double angle) =>
      _delegate.setTransform(position._delegate, angle);
  void setLinearVelocity(B2Vec2 v) => _delegate.setLinearVelocity(v._delegate);
  void setAwake(bool flag) => _delegate.setAwake(flag);
  void setEnabled(bool flag) => _delegate.setEnabled(flag);
  B2Vec2 getPosition() => B2Vec2._(_delegate.getPosition());
  B2Vec2 getLinearVelocity() => B2Vec2._(_delegate.getLinearVelocity());
}

class B2BodyDef {
  B2BodyDef() : _delegate = FlutterBox2DPlatform.instance.b2BodyDef();

  final B2BodyDefPlatform _delegate;

  void setType(int arg) => _delegate.setType(arg);
  void setPosition(B2Vec2 position) =>
      _delegate.setPosition(position._delegate);
}

class B2Fixture {
  B2Fixture._(B2FixturePlatform delegate) : _delegate = delegate;

  final B2FixturePlatform _delegate;
}

class B2PolygonShape implements B2Shape {
  B2PolygonShape() : _delegate = FlutterBox2DPlatform.instance.b2PolygonShape();

  @override
  final B2PolygonShapePlatform _delegate;

  void setAsBox(double hx, double hy) => _delegate.setAsBox(hx, hy);
  int getType() => _delegate.getType();
}

abstract class B2Shape {
  B2ShapePlatform get _delegate;
}

class B2Vec2 {
  B2Vec2(double x, double y)
      : _delegate = FlutterBox2DPlatform.instance.b2Vec2(x, y);

  B2Vec2._(B2Vec2Platform delegate) : _delegate = delegate;

  final B2Vec2Platform _delegate;

  double get x => _delegate.x;
  double get y => _delegate.y;
  double get length => _delegate.length;
}

class B2World {
  B2World(B2Vec2 gravity)
      : _delegate = FlutterBox2DPlatform.instance.b2World(gravity._delegate);

  late final B2WorldPlatform _delegate;

  B2Body createBody(B2BodyDef def) =>
      B2Body._(_delegate.createBody(def._delegate));
  void step(double timeStep, int velocityIterations, int positionIterations) =>
      _delegate.step(timeStep, velocityIterations, positionIterations);
}
