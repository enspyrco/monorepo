import 'package:flutter_box2d_web/flutter_box2d_web.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterBox2DPlugin', () {
    late FlutterBox2DWeb plugin;

    setUp(() {
      plugin = FlutterBox2DWeb();
    });

    group('Box2D objects have expected state on creation', () {
      testWidgets('b2Vec2 constructor works with different numbers of args',
          (WidgetTester _) async {
        var gravity = plugin.b2Vec2_2(0, 10);
        expect(gravity.get_x(), 0);
        expect(gravity.get_y(), 10);
      });
    });
  });
}
