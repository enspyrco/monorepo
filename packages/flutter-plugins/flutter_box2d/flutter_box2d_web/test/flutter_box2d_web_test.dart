import 'package:flutter_box2d_web/flutter_box2d_web.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('...', () {
    var factory = FlutterBox2DWeb();
    var gravity = factory.b2Vec2(0, 10);
    var world = factory.b2World(gravity);
    expect(world, isNotNull);
  });
}
