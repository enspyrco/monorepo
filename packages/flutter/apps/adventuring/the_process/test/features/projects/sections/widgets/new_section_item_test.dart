import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/projects/widgets/project-detail/new_section_item.dart';
import 'package:the_process/sections/actions/create_section_action.dart';
import 'package:the_process/sections/actions/update_new_section_v_m_action.dart';

void main() {
  testWidgets('NewSectionItem dispatches UpdateNewSectionVM on text entry',
      (WidgetTester tester) async {
    // Setup the harness and check it is in the initial state.
    final harness = WidgetTestHarness.withFakeStore(
        initialState: AppState.init(), widgetUnderTest: const NewSectionItem());
    expect(harness.state.sections.newName, '');

    // Build the widget tree.
    await tester.pumpWidget(harness.widget);

    final textField = find.byType(TextField);
    final button = find.byType(FloatingActionButton);

    expect(textField, findsOneWidget);
    expect(button, findsOneWidget);

    await tester.enterText(textField, 'a');

    expect(harness.receivedActions,
        contains(const UpdateNewSectionVMAction(name: 'a')));
  });

  testWidgets('NewSectionItem dispatches CreateSection on submit',
      (WidgetTester tester) async {
    // setup the harness and check it is in the initial state
    final harness = WidgetTestHarness.withFakeStore(
        initialState: AppState.init(), widgetUnderTest: const NewSectionItem());
    expect(harness.state.sections.newName, '');

    // Build the widget tree.
    await tester.pumpWidget(harness.widget);

    final textField = find.byType(TextField);
    final button = find.byType(FloatingActionButton);

    expect(textField, findsOneWidget);
    expect(button, findsOneWidget);

    await tester.tap(button);

    expect(harness.receivedActions, contains(const CreateSectionAction()));
  });
}
