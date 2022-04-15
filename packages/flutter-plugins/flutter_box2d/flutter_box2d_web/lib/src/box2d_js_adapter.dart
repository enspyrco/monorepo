import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'package:flutter_box2d_web/src/box2d_js_impl.dart';

class B2BodyJSAdapter implements B2BodyPlatform {
  // B2BodyJSAdapter() : _impl = B2BodyJSImpl();
  B2BodyJSAdapter(B2BodyJSImpl impl) : _impl = impl;

  final B2BodyJSImpl _impl;

  @override
  B2FixtureJSAdapter createFixture2(B2ShapeJSAdapter shape, double density) =>
      B2FixtureJSAdapter(_impl.CreateFixture(shape._impl, density));

  @override
  B2Vec2JSAdapter getLinearVelocity() =>
      B2Vec2JSAdapter(_impl.GetLinearVelocity());

  @override
  B2Vec2JSAdapter getPosition() => B2Vec2JSAdapter(_impl.GetPosition());

  @override
  void setAwake(bool flag) => _impl.SetAwake(flag);

  @override
  void setEnabled(bool flag) => _impl.SetEnabled(flag);

  @override
  void setLinearVelocity(covariant B2Vec2JSAdapter v) =>
      _impl.SetLinearVelocity(v._impl);

  @override
  void setTransform(covariant B2Vec2JSAdapter position, double angle) =>
      _impl.SetTransform(position._impl, angle);
}

class B2BodyDefJSAdapter implements B2BodyDefPlatform {
  B2BodyDefJSAdapter() : _impl = B2BodyDefJSImpl();

  final B2BodyDefJSImpl _impl;

  @override
  void setPosition(B2Vec2JSAdapter position) =>
      _impl.set_position(position._impl);

  @override
  void setType(int type) => _impl.set_type(type);
}

class B2FixtureJSAdapter implements B2FixturePlatform {
  B2FixtureJSAdapter(B2FixtureJSImpl impl) : _impl = impl;

  final B2FixtureJSImpl _impl;
}

class B2PolygonShapeJSAdapter
    implements B2PolygonShapePlatform, B2ShapeJSAdapter {
  B2PolygonShapeJSAdapter() : _impl = B2PolygonShapeJSImpl();

  @override
  final B2PolygonShapeJSImpl _impl;

  @override
  int getType() => _impl.GetType().toInt();

  @override
  void setAsBox(double hx, double hy) => _impl.SetAsBox(hx, hy);
}

abstract class B2ShapeJSAdapter implements B2ShapePlatform {
  B2ShapeJSImpl get _impl;
}

class B2Vec2JSAdapter implements B2Vec2Platform {
  B2Vec2JSAdapter(B2Vec2JSImpl impl) : _impl = impl;
  B2Vec2JSAdapter.from(double x, double y) : _impl = B2Vec2JSImpl(x, y);

  final B2Vec2JSImpl _impl;

  @override
  double get length => _impl.Length().toDouble();

  @override
  double get x => _impl.get_x().toDouble();

  @override
  double get y => _impl.get_y().toDouble();
}

class B2WorldJSAdapter implements B2WorldPlatform {
  B2WorldJSAdapter(B2Vec2JSAdapter vec) : _impl = B2WorldJSImpl(vec._impl);

  final B2WorldJSImpl _impl;

  @override
  B2BodyJSAdapter createBody(B2BodyDefJSAdapter def) =>
      B2BodyJSAdapter(_impl.CreateBody(def._impl));

  @override
  void step(double timeStep, int velocityIterations, int positionIterations) =>
      _impl.Step(timeStep, velocityIterations, positionIterations);
}
