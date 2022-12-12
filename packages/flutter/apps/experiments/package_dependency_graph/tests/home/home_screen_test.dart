import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_dependency_graph/app/home/home_screen.dart';
import 'package:package_dependency_graph/app/state/app_state.dart';

void main() {
  testWidgets('...', (tester) async {
    var harness = WidgetTestHarness<AppState>(
      initialState: AppState.initial,
      innerWidget: const HomeScreen(),
    );

    await tester.pumpWidget(harness.widget);

    expect(harness.state.dependencies, isEmpty);

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(harness.state.dependencies, isNotEmpty);
  });
}
