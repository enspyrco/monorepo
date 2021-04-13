import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/widgets/home/project-overview/organisation-selection-view/create_organisation_button.dart';
import 'package:the_process/widgets/home/project-overview/organisation-selection-view/organisation_selection_dropdown.dart';
import 'package:the_process/widgets/home/project-overview/organisation-selection-view/organisation_selection_view.dart';
import 'package:the_process/widgets/home/project-overview/shared_widgets/selection_label.dart';

import '../../test-utils/widget_test_harness.dart';

void main() {
  group('OrganisationSelectionView', () {
    testWidgets('lays out expected views', (WidgetTester tester) async {
      final harness =
          WidgetTestHarness(widgetUnderTest: OrganisationSelectionView());

      // Build the widget tree.
      await tester.pumpWidget(harness.widget);

      await tester.pump();

      // check the expected views have been laid out
      expect(find.byType(SelectionLabel), findsOneWidget);
      expect(find.byType(OrganisationSelectionDropdown), findsOneWidget);
      expect(find.byType(CreateOrganisationButton), findsOneWidget);
    });
  });
}
