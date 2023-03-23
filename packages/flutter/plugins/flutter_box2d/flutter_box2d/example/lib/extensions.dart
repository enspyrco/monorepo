import 'package:flutter/material.dart';
import 'package:flutter_box2d/flutter_box2d.dart';

extension B2Vec2Extensions on B2Vec2 {
  Offset toOffSet() => Offset(x, y);
}

extension B2WorldExtensions on B2World {
  BoxEntity createBoxEntity(double width, double height,
      {bodyType = B2BodyType.dynamicBody,
      gravityScale = 1.0,
      double x = 10.0,
      double y = 0.0,
      color = Colors.blue}) {
    var zero = B2Vec2.from2(0, 0);

    final shape = B2PolygonShape()..setAsBox2(width, height);

    var bd = B2BodyDef()
      ..type = bodyType
      ..position = B2Vec2.from2(x, y)
      ..gravityScale = gravityScale;

    final body = createBody(bd)
      ..setTransform(B2Vec2.from2(x, y), 0)
      ..setLinearVelocity(zero)
      ..setAwake(true)
      ..setEnabled(true);

    // var fixtureDef = B2FixtureDef();
    // fixtureDef.shape = shape;
    // fixtureDef.density = 1.0;
    // final fixture = body.createFixture1(fixtureDef);
    final fixture = body.createFixture2(shape, 1);

    return BoxEntity(body, shape, color, width * 100, height * 100);
  }

  CircleEntity createCircleEntity(double radius,
      {bodyType = B2BodyType.dynamicBody,
      gravityScale = 1.0,
      double x = 0,
      double y = 0,
      color = Colors.red}) {
    var zero = B2Vec2.from2(0, 0);

    var shape = B2CircleShape()
      ..m_p = B2Vec2.from2(2.0, 3.0)
      ..m_radius = 0.5;

    var bd = B2BodyDef()
      ..type = bodyType
      ..position = B2Vec2.from2(x, y)
      ..gravityScale = gravityScale;

    final body = createBody(bd)
      ..setTransform(B2Vec2.from2(x, y), 0)
      ..setLinearVelocity(zero)
      ..setAwake(true)
      ..setEnabled(true);

    final fixture = body.createFixture2(shape, 1);

    return CircleEntity(body, shape, color, radius * 100);
  }
}

class CircleEntity {
  CircleEntity(B2Body body, B2CircleShape shape, Color color, double radius)
      : _body = body,
        _shape = shape,
        _radius = radius {
    _paint = Paint()..color = color;
  }

  late final Paint _paint;
  final B2Body _body;
  final B2CircleShape _shape;
  final double _radius;

  B2Body get body => _body;
  B2CircleShape get shape => _shape;

  void paintOn(Canvas canvas) {
    canvas.drawCircle(body.getPosition().toOffSet(), _radius, _paint);
  }

  /// Return a String with the position & velocity of the circle
  @override
  String toString() {
    final v = _body.getLinearVelocity();
    final p = _body.getPosition();
    return "Circle's velocity is: ${v.x}, ${v.y}\nCircle's position is: ${p.x}, ${p.y}";
  }
}

class BoxEntity {
  BoxEntity(B2Body body, B2PolygonShape shape, Color color, double width,
      double height)
      : _body = body,
        _shape = shape,
        _width = width,
        _height = height {
    _paint = Paint()..color = color;
  }

  late final Paint _paint;
  final B2Body _body;
  final B2PolygonShape _shape;
  final double _width;
  final double _height;

  B2Body get body => _body;
  B2PolygonShape get shape => _shape;

  void paintOn(Canvas canvas) {
    canvas.drawRect(
        Rect.fromCenter(
            center: _body.getPosition().toOffSet(),
            width: _width,
            height: _height),
        _paint);
  }

  /// Return a String with the position & velocity of the square
  @override
  String toString() {
    final v = _body.getLinearVelocity();
    final p = _body.getPosition();
    return "Box's velocity is: ${v.x}, ${v.y}\nBox's position is: ${p.x}, ${p.y}";
  }
}
