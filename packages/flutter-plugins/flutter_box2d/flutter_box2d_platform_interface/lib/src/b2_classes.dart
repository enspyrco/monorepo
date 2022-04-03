import '../flutter_box2d_platform_interface.dart';

/// All classes are in the one file so they can access each other's private
/// members (specifically the _delegates)
///
/// Could use `part_of` but this is apparently discouraged now (although afaict
/// it's effectively the same as putting everything in one file)
/// - EDIT: did some more research and it's more appropriate to say "avoiding
/// putting everything into a single library makes your code easier to reason
/// about" which clearly isn't the same as "don't ever use it"
/// - This is almost certainly a reasonable use case

abstract class B2DynamicBody {}

class B2Fixture {
  B2Fixture._(B2FixtureDelegate delegate) : _delegate = delegate;

  final B2FixtureDelegate _delegate;
}

class B2BodyDef {
  B2BodyDef() : _delegate = FlutterBox2DPlatform.instance.b2BodyDef();

  final B2BodyDefDelegate _delegate;

  void setType(int arg) => _delegate.setType(arg);
  void setPosition(B2Vec2 position) =>
      _delegate.setPosition(position._delegate);
}

class B2Body {
  B2Body._(B2BodyDelegate delegate) : _delegate = delegate;

  final B2BodyDelegate _delegate;

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

class B2PolygonShape implements B2Shape {
  B2PolygonShape() : _delegate = FlutterBox2DPlatform.instance.b2PolygonShape();

  @override
  final B2PolygonShapeDelegate _delegate;

  void setAsBox(double hx, double hy) => _delegate.setAsBox(hx, hy);
  int getType() => _delegate.getType();
}

abstract class B2Shape {
  B2ShapeDelegate get _delegate;
}

class B2Vec2 {
  B2Vec2(double x, double y)
      : _delegate = FlutterBox2DPlatform.instance.b2Vec2(x, y);

  B2Vec2._(B2Vec2Delegate delegate) : _delegate = delegate;

  final B2Vec2Delegate _delegate;

  double get x => _delegate.x.toDouble();
  double get y => _delegate.y.toDouble();
  double get length => _delegate.length as double;
}

class B2World {
  B2World(B2Vec2 gravity)
      : _delegate = FlutterBox2DPlatform.instance.b2World(gravity._delegate);

  late final B2WorldDelegate _delegate;

  B2Body createBody(B2BodyDef def) =>
      B2Body._(_delegate.createBody(def._delegate));
  void step(double timeStep, int velocityIterations, int positionIterations) =>
      _delegate.step(timeStep, velocityIterations, positionIterations);
}
