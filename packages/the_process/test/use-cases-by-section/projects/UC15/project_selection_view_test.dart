import 'package:flutter_test/flutter_test.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:the_process/main.dart';
import 'package:the_process/widgets/home/project-overview/project-selection-view/create_project_button.dart';
import 'package:the_process/widgets/home/project-overview/project-selection-view/project_selection_dropdown.dart';
import 'package:the_process/widgets/home/project-overview/project-selection-view/project_selection_view.dart';
import 'package:the_process/widgets/home/project-overview/shared_widgets/selection_label.dart';

void main() {
  group('OrganisationSelectionView', () {
    testWidgets('lays out expected views', (WidgetTester tester) async {
      final harness = WidgetTestHarness.withFakeStore(
          initialState: AppState.init(),
          widgetUnderTest: const ProjectSelectionView());

      // Build the widget tree.
      await tester.pumpWidget(harness.widget);

      await tester.pump();

      // check the expected views have been laid out
      expect(find.byType(SelectionLabel), findsOneWidget);
      expect(find.byType(ProjectSelectionDropdown), findsOneWidget);
      expect(find.byType(CreateProjectButton), findsOneWidget);
    });
  });
}
