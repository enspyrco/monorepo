import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

abstract class B2BodyDefDelegate {
  B2BodyDefDelegate();

  void setType(int type);
  void setPosition(covariant B2Vec2Delegate position);
}

abstract class B2BodyDelegate {
  B2BodyDelegate();

  B2FixtureDelegate createFixture2(
      covariant B2ShapeDelegate shape, double density);
  void setTransform(covariant B2Vec2Delegate position, double angle);
  void setLinearVelocity(covariant B2Vec2Delegate v);
  void setAwake(bool flag);
  void setEnabled(bool flag);
  B2Vec2Delegate getPosition();
  B2Vec2Delegate getLinearVelocity();
}

abstract class B2FixtureDelegate {
  B2FixtureDelegate();
}

abstract class B2PolygonShapeDelegate
    implements B2PolygonShape, B2ShapeDelegate {
  void setAsBox(double hx, double hy);
  int getType();
}

abstract class B2ShapeDelegate {
  B2ShapeDelegate();
}

abstract class B2Vec2Delegate {
  B2Vec2Delegate(this.x, this.y);
  final num x;
  final num y;
  num get length;
}

abstract class B2WorldDelegate {
  B2WorldDelegate(double x, double y);

  B2BodyDelegate createBody(covariant B2BodyDefDelegate def);

  void step(double timeStep, int velocityIterations, int positionIterations);
}
