import 'package:flutter/material.dart';
import 'package:flutter_box2d/flutter_box2d.dart';

import 'extensions.dart';

class SquareObject {
  SquareObject(B2World world, {int sideLengthMetres = 1})
      : _sideLengthMetres = sideLengthMetres,
        _sideLengthPixels = sideLengthMetres * 100 {
    _paint = Paint()..color = Colors.red;

    _shape.setAsBox2(_sideLengthMetres / 2, _sideLengthMetres / 2);

    var zero = B2Vec2.from2(0, 0);

    var bd = B2BodyDef();
    bd.type = B2BodyType.dynamicBody;
    bd.position = zero;

    _body = world.createBody(bd);
    _body.createFixture2(_shape, 1);
    _body.setTransform(zero, 0);
    _body.setLinearVelocity(zero);
    _body.setAwake(true);
    _body.setEnabled(true);
  }

  late final Paint _paint;
  late final B2Body _body;
  final int _sideLengthMetres;
  final double _sideLengthPixels;
  final _shape = B2PolygonShape();

  B2Body get body => _body;
  B2PolygonShape get shape => _shape;

  void paintOn(Canvas canvas) {
    canvas.drawRect(
        Rect.fromCenter(
            center: _body.getPosition().toOffSet(),
            width: _sideLengthPixels,
            height: _sideLengthPixels),
        _paint);
  }

  /// Prints out the vertical position of our falling square
  void whereIsOurSquare() {
    final v = _body.getLinearVelocity();
    print("Square's velocity is: ${v.x}, ${v.y}");
    final p = _body.getPosition();
    print("Square's position is: ${p.x}, ${p.y}");
  }
}
