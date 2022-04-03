@JS()
library box2d;

import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'package:js/js.dart';

@JS('b2Body')
class B2BodyJSImpl implements B2BodyDelegate {
  external B2BodyJSImpl();
  @JS('CreateFixture')
  @override
  external B2FixtureJSImpl createFixture2(B2ShapeJSImpl shape, num density);
  @JS('SetTransform')
  @override
  external void setTransform(B2Vec2JSImpl position, num angle);
  @JS('SetLinearVelocity')
  @override
  external void setLinearVelocity(B2Vec2JSImpl v);
  @JS('SetAwake')
  @override
  external void setAwake(bool flag);
  @JS('SetEnabled')
  @override
  external void setEnabled(bool flag);
  @JS('GetPosition')
  @override
  external B2Vec2JSImpl getPosition();
  @JS('GetLinearVelocity')
  @override
  external B2Vec2JSImpl getLinearVelocity();
}

@JS('b2BodyDef')
class B2BodyDefJSImpl implements B2BodyDefDelegate {
  external B2BodyDefJSImpl();

  @JS('set_type')
  @override
  external void setType(num type);

  @JS('set_position')
  @override
  external void setPosition(B2Vec2JSImpl position);
}

@JS('b2Fixture')
class B2FixtureJSImpl implements B2FixtureDelegate {
  external B2FixtureJSImpl();
}

@JS('b2PolygonShape')
class B2PolygonShapeJSImpl implements B2PolygonShapeDelegate {
  external B2PolygonShapeJSImpl();

  @JS('SetAsBox')
  @override
  external void setAsBox(double hx, double hy);

  @JS('GetType')
  @override
  external int getType();
}

@JS('b2Shape')
class B2ShapeJSImpl implements B2ShapeDelegate {
  external B2ShapeJSImpl();
}

@JS('b2Vec2')
class B2Vec2JSImpl implements B2Vec2Delegate {
  external B2Vec2JSImpl(num x, num y);
  @override
  external num length;
  @override
  external num x;
  @override
  external num y;
}

@JS('b2World')
class B2WorldJSImpl implements B2WorldDelegate {
  external B2WorldJSImpl(B2Vec2JSImpl gravity);
  @JS('CreateBody')
  @override
  external B2BodyJSImpl createBody(B2BodyDefJSImpl def);
  @JS('Step')
  @override
  external void step(
      num timeStep, num velocityIterations, num positionIterations);
}
