import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/widgets/home/project-overview/organisation-selection-view/orgnanisation_selection_view.dart';
import 'package:the_process/widgets/home/project-overview/project-selection-view/project_selection_view.dart';
import 'package:the_process/widgets/home/project-overview/project_overview.dart';
import 'package:the_process/widgets/home/project-overview/sections-view/sections_view.dart';
import 'package:the_process/widgets/home/project-overview/user-info-view/user_info_view.dart';

import '../../test-utils/widget_test_harness.dart';

void main() {
  group('ProjectOverview', () {
    testWidgets('lays out expected views', (WidgetTester tester) async {
      final harness = WidgetTestHarness(widgetUnderTest: ProjectOverview());

      // Build the widget tree.
      await tester.pumpWidget(harness.widget);

      await tester.pump();

      // check we got past app initialization
      expect(find.byType(ProjectSelectionView), findsOneWidget);
      expect(find.byType(OrganisationSelectionView), findsOneWidget);
      expect(find.byType(SectionsView), findsOneWidget);
      expect(find.byType(UserInfoView), findsOneWidget);
    });
  });
}
