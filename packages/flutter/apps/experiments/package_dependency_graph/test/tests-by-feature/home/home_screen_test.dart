import 'package:astro_locator/astro_locator.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_dependency_graph/app/home/home_screen.dart';
import 'package:package_dependency_graph/app/home/services/file_selector_service.dart';
import 'package:package_dependency_graph/app/state/app_state.dart';

import '../../test-doubles/fake_file_selector_service.dart';

void main() {
  testWidgets(
      'Selecting a valid pubspec results in state.dependencies being set.',
      (tester) async {
    var harness = WidgetTestHarness<AppState>(
      initialState: AppState.initial,
      innerWidget: const HomeScreen(),
    );

    // Configure the Locator so it will provide a FakeFileSelectorService when asked
    // for a FileSelectorService, automatically selecting a preset file and
    // skipping the user input step.
    Locator.add<FileSelectorService>(FakeFileSelectorService());

    await tester.pumpWidget(harness.widget);

    expect(harness.state.dependencies, isEmpty);

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(harness.state.dependencies, isNotEmpty);
  });
}
