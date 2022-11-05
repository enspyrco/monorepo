import 'package:astro/astro.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';
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
      final harness = WidgetTestHarness(
        initialState: AppState.initial,
        innerWidget: const SectionsView(),
      );
      expect(harness.state.sections.creatingNewSection, false);
      expect(harness.state.sections.list, <SectionModel>[]);

      // Build the widget tree.
      await widgetTester.pumpWidget(harness.widget);

      final newSectionItem = find.byType(NewSectionItem);
      final waitingIndicator = find.byType(ProgressIndicatorWithMessage);

      expect(newSectionItem, findsOneWidget);
      expect(waitingIndicator, findsNothing);
    }, skip: true); // While we sort our Sections and how they will work

    testWidgets(
        'should show waiting indicator given creatingNewSection is true',
        (widgetTester) async {
      var initialAppState = AppState.initial;
      var appState = initialAppState.copyWith(
          sections:
              initialAppState.sections.copyWith(creatingNewSection: true));

      // Setup the harness and check it is in the initial state.
      final harness = WidgetTestHarness(
        initialState: appState,
        innerWidget: const SectionsView(),
      );
      expect(harness.state.sections.creatingNewSection, true);
      expect(harness.state.sections.list, <SectionModel>[]);

      // Build the widget tree.
      await widgetTester.pumpWidget(harness.widget);

      final newSectionItem = find.byType(NewSectionItem);
      final waitingIndicator = find.byType(ProgressIndicatorWithMessage);

      expect(newSectionItem, findsNothing);
      expect(waitingIndicator, findsOneWidget);
    }, skip: true); // While we sort our Sections and how they will work
  });
}
