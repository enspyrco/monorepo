import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/sections/create_section_action.dart';
import 'package:the_process/actions/sections/update_new_section_v_m_action.dart';
import 'package:the_process/widgets/home/project-overview/sections-view/new_section_item.dart';

import '../../../test-utils/widget_test_harness.dart';

void main() {
  testWidgets('NewSectionItem dispatches UpdateNewSectionVM on text entry',
      (WidgetTester tester) async {
    // Setup the harness and check it is in the initial state.
    final harness = WidgetTestHarness(widgetUnderTest: NewSectionItem());
    expect(harness.state.sections.newSection.name, '');

    // Build the widget tree.
    await tester.pumpWidget(harness.widget);

    final textField = find.byType(TextField);
    final button = find.byType(FloatingActionButton);

    expect(textField, findsOneWidget);
    expect(button, findsOneWidget);

    await tester.enterText(textField, 'a');

    expect(
        harness.receivedActions, contains(UpdateNewSectionVMAction(name: 'a')));
  });

  testWidgets('NewSectionItem dispatches CreateSection on submit',
      (WidgetTester tester) async {
    // setup the harness and check it is in the initial state
    final harness = WidgetTestHarness(widgetUnderTest: NewSectionItem());
    expect(harness.state.sections.newSection.name, '');

    // Build the widget tree.
    await tester.pumpWidget(harness.widget);

    final textField = find.byType(TextField);
    final button = find.byType(FloatingActionButton);

    expect(textField, findsOneWidget);
    expect(button, findsOneWidget);

    await tester.tap(button);

    expect(harness.receivedActions, contains(CreateSectionAction()));
  });
}
