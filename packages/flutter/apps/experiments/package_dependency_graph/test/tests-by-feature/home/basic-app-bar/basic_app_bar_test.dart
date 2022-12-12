import 'package:flutter_test/flutter_test.dart';
import 'package:package_dependency_graph/app/home/app_bar/basic_app_bar.dart';

void main() {
  testWidgets('tapping Select Packages ...', (tester) async {
    await tester.pumpWidget(const BasicAppBar(
      packages: {},
    ));
  }, skip: true); // TODO: complete the tests
}
