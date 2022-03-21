abstract class B2BodyDefDelegate {
  B2BodyDefDelegate();

  void set_type(num type);
  void set_position(covariant B2Vec2Delegate position);
}

abstract class B2BodyDelegate {
  B2BodyDelegate();

  B2FixtureDelegate CreateFixture(covariant B2ShapeDelegate shape, num density);
  void SetTransform(covariant B2Vec2Delegate position, num angle);
  void SetLinearVelocity(covariant B2Vec2Delegate v);
  void SetAwake(bool flag);
  void SetEnabled(bool flag);
  B2Vec2Delegate GetPosition();
  B2Vec2Delegate GetLinearVelocity();
}

abstract class B2FixtureDelegate {
  B2FixtureDelegate();
}

abstract class B2PolygonShapeDelegate extends B2ShapeDelegate {
  void SetAsBox(num hx, num hy);
}

abstract class B2ShapeDelegate {
  B2ShapeDelegate();
}

abstract class B2Vec2Delegate {
  B2Vec2Delegate(double x, double y);
  double x = 0;
  double y = 0;
}

abstract class B2WorldDelegate {
  B2WorldDelegate(double x, double y);

  B2BodyDelegate CreateBody(covariant B2BodyDefDelegate def);
  void Step(num timeStep, num velocityIterations, num positionIterations);
}
