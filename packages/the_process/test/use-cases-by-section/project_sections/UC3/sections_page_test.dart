import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/widgets.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:the_process/main.dart';
import 'package:the_process/projects/models/section_model.dart';
import 'package:the_process/projects/widgets/project-detail/new_section_item.dart';
import 'package:the_process/projects/widgets/project-detail/sections_view.dart';

// TODO: test the outgoing part
// eg.
//  - SectionsPage updates on creatingNewSection change
void main() {
  group('SectionsPage', () {
    testWidgets('should show normal UI given initial app state',
        (widgetTester) async {
      // Setup the harness and check it is in the initial state.
      final harness = WidgetTestHarness.withFakeStore(
          initialState: AppState.init(), widgetUnderTest: const SectionsView());
      expect(harness.state.sections.creatingNewSection, false);
      expect(harness.state.sections.list, BuiltList<SectionModel>());

      // Build the widget tree.
      await widgetTester.pumpWidget(harness.widget);

      final newSectionItem = find.byType(NewSectionItem);
      final waitingIndicator = find.byType(WaitingIndicator);

      expect(newSectionItem, findsOneWidget);
      expect(waitingIndicator, findsNothing);
    });

    testWidgets(
        'should show waiting indicator given creatingNewSection is true',
        (widgetTester) async {
      final appState =
          AppState.init().copyWith.sections(creatingNewSection: true);

      // Setup the harness and check it is in the initial state.
      final harness = WidgetTestHarness.withFakeStore(
          initialState: appState, widgetUnderTest: const SectionsView());
      expect(harness.state.sections.creatingNewSection, true);
      expect(harness.state.sections.list, BuiltList<SectionModel>());

      // Build the widget tree.
      await widgetTester.pumpWidget(harness.widget);

      final newSectionItem = find.byType(NewSectionItem);
      final waitingIndicator = find.byType(WaitingIndicator);

      expect(newSectionItem, findsNothing);
      expect(waitingIndicator, findsOneWidget);
    });
  });
}
