import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

/// All classes are in the one file so they can access each other's private
/// members (specifically the _delegates)
///
/// Could use `part_of` but this is apparently discouraged now (although afaict
/// it's effectively the same as putting everything in one file)

abstract class B2DynamicBody {}

class B2Fixture {
  B2Fixture() : _delegate = FlutterBox2DPlatform.instance.b2FixtureDelegate();

  B2Fixture._(B2FixtureDelegate delegate) : _delegate = delegate;

  final B2FixtureDelegate _delegate;
}

class B2BodyDef {
  B2BodyDef() : _delegate = FlutterBox2DPlatform.instance.b2BodyDefDelegate();

  final B2BodyDefDelegate _delegate;

  void setType(Type type) {
    if (type == B2DynamicBody) {
      _delegate.set_type(FlutterBox2DPlatform.instance.b2DynamicBody);
    }
  }

  // num type
  void setPosition(B2Vec2 position) =>
      _delegate.set_position(position._delegate);
}

class B2Body {
  B2Body() : _delegate = FlutterBox2DPlatform.instance.b2BodyDelegate();
  B2Body._(B2BodyDelegate delegate) : _delegate = delegate;

  final B2BodyDelegate _delegate;

  B2Fixture createFixture(B2Shape shape, num density) =>
      B2Fixture._(_delegate.CreateFixture(shape._delegate, density));
  void setTransform(B2Vec2 position, num angle) =>
      _delegate.SetTransform(position._delegate, angle);
  void setLinearVelocity(B2Vec2 v) => _delegate.SetLinearVelocity(v._delegate);
  void setAwake(bool flag) => _delegate.SetAwake(flag);
  void setEnabled(bool flag) => _delegate.SetEnabled(flag);
  B2Vec2 getPosition() => B2Vec2._(_delegate.GetPosition());
  B2Vec2 getLinearVelocity() => B2Vec2._(_delegate.GetLinearVelocity());
}

class B2PolygonShape extends B2Shape {
  B2PolygonShape()
      : _delegate = FlutterBox2DPlatform.instance.b2PolygonShapeDelegate();

  @override
  final B2PolygonShapeDelegate _delegate;

  void setAsBox(double hx, double hy) => _delegate.SetAsBox(hx, hy);
}

abstract class B2Shape {
  B2ShapeDelegate get _delegate;
}

class B2Vec2 {
  B2Vec2(double x, double y)
      : _delegate = FlutterBox2DPlatform.instance.b2Vec2Delegate(x, y);

  B2Vec2._(B2Vec2Delegate delegate) : _delegate = delegate;

  final B2Vec2Delegate _delegate;

  double get x => _delegate.x;
  double get y => _delegate.y;
}

class B2World {
  B2World(B2Vec2 gravity)
      : _delegate =
            FlutterBox2DPlatform.instance.b2WorldDelegate(gravity.x, gravity.y);

  final B2WorldDelegate _delegate;

  B2Body createBody(B2BodyDef def) =>
      B2Body._(_delegate.CreateBody(def._delegate));
  void step(num timeStep, num velocityIterations, num positionIterations) =>
      _delegate.Step(timeStep, velocityIterations, positionIterations);
}
