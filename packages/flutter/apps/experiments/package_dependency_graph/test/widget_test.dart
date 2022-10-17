import 'package:flutter_test/flutter_test.dart';
import 'package:package_dependency_graph/astro_base.dart';

void main() {
  testWidgets('... smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AstroBase());

    expect(find.text('1'), findsOneWidget);
  });
}
