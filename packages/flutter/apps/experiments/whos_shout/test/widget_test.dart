import 'package:flutter_test/flutter_test.dart';
import 'package:whos_shout/app/home/home_screen.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const HomeScreen());

    // ...
  });
}
