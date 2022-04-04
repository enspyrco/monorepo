@JS()
library box2d;

import 'package:js/js.dart';

@JS('b2Body')
class B2BodyJSImpl {
  external B2BodyJSImpl();
  external B2FixtureJSImpl CreateFixture(B2ShapeJSImpl shape, num density);
  external void SetTransform(B2Vec2JSImpl position, num angle);
  external void SetLinearVelocity(B2Vec2JSImpl v);
  external void SetAwake(bool flag);
  external void SetEnabled(bool flag);
  external B2Vec2JSImpl GetPosition();
  external B2Vec2JSImpl GetLinearVelocity();
}

@JS('b2BodyDef')
class B2BodyDefJSImpl {
  external B2BodyDefJSImpl();
  external void set_type(num type);
  external void set_position(B2Vec2JSImpl position);
}

@JS('b2Fixture')
class B2FixtureJSImpl {
  external B2FixtureJSImpl();
}

@JS('b2PolygonShape')
class B2PolygonShapeJSImpl extends B2ShapeJSImpl {
  external B2PolygonShapeJSImpl();
  external void SetAsBox(num hx, num hy);
  external num GetType();
}

@JS('b2Shape')
class B2ShapeJSImpl {
  external B2ShapeJSImpl();
}

@JS('b2Vec2')
class B2Vec2JSImpl {
  external B2Vec2JSImpl(num x, num y);
  external num Length();
  external num get_x();
  external num get_y();
}

@JS('b2World')
class B2WorldJSImpl {
  external B2WorldJSImpl(B2Vec2JSImpl gravity);
  external B2BodyJSImpl CreateBody(B2BodyDefJSImpl def);
  external void Step(
      num timeStep, num velocityIterations, num positionIterations);
}
