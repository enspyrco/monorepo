import 'package:flutter_box2d/flutter_box2d.dart';
import 'package:flutter_box2d_example/extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterBox2D', () {
    setUp(() {});

    group('Box2D objects have expected state on creation', () {
      testWidgets('b2Vec2 constructor works with different numbers of args',
          (WidgetTester _) async {
        var gravity = B2Vec2.from2(0, 10);
        expect(gravity.x, 0);
        expect(gravity.y, 10);
      });

      testWidgets('SquareEntity sets state from parameters',
          (WidgetTester _) async {
        var gravityVector = B2Vec2.from2(0, 10);
        var world = B2World.from1(gravityVector);

        expect(world.getGravity().x, 0);
        expect(world.getGravity().y, 10);

        var box = world.createBoxEntity(1, 1);
        expect(box.body.getPosition().x, B2Vec2.from2(1, 1).x);
        expect(box.body.getPosition().y, B2Vec2.from2(1, 1).y);
      });

      // testWidgets('b2World step moves objects under gravity',
      //     (WidgetTester _) async {
      //   var gravity = B2Vec2.from2(0, 10);
      //   var world = B2World.from1(gravity);
      //   world.createBody();
      //   expect(gravity.x, 0);
      //   expect(gravity.y, 10);
      // });
    });
  });
}
