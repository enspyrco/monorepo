@JS()
library box2d;

import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'package:js/js.dart';

@JS()
external num b2_dynamicBody;

@JS('b2World')
class B2WorldJSImpl implements B2WorldDelegate {
  external B2WorldJSImpl(B2Vec2JSImpl gravity);
  @override
  external B2BodyJSImpl CreateBody(B2BodyDefJSImpl def);
  @override
  external void Step(
      num timeStep, num velocityIterations, num positionIterations);
}

@JS('b2Vec2')
class B2Vec2JSImpl implements B2Vec2Delegate {
  external B2Vec2JSImpl(num x, num y);
  @override
  external double x;
  @override
  external double y;
}

@JS('b2Body')
class B2BodyJSImpl implements B2BodyDelegate {
  external B2BodyJSImpl();
  @override
  external B2FixtureJSImpl CreateFixture(B2ShapeJSImpl shape, num density);
  @override
  external void SetTransform(B2Vec2JSImpl position, num angle);
  @override
  external void SetLinearVelocity(B2Vec2JSImpl v);
  @override
  external void SetAwake(bool flag);
  @override
  external void SetEnabled(bool flag);
  @override
  external B2Vec2JSImpl GetPosition();
  @override
  external B2Vec2JSImpl GetLinearVelocity();
}

@JS('b2Shape')
class B2ShapeJSImpl implements B2ShapeDelegate {
  external B2ShapeJSImpl();
}

@JS('b2Fixture')
class B2FixtureJSImpl implements B2FixtureDelegate {
  external B2FixtureJSImpl();
}

@JS('b2PolygonShape')
class B2PolygonShapeJSImpl implements B2PolygonShapeDelegate {
  external B2PolygonShapeJSImpl();
  @override
  external void SetAsBox(num hx, num hy);
}

@JS('b2BodyDef')
class B2BodyDefJSImpl implements B2BodyDefDelegate {
  external B2BodyDefJSImpl();
  @override
  external void set_type(num type);
  @override
  external void set_position(B2Vec2JSImpl position);
}
