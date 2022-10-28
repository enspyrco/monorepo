import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';
import 'package:the_process/home/home_screen.dart';
import 'package:the_process/organisations/widgets/organisation_selector.dart';
import 'package:the_process/projects/widgets/grid-view/projects_grid.dart';

void main() {
  group('Home Screen', () {
    testWidgets('builds the expected children', ((tester) async {
      final harness = WidgetTestHarness.withFakeStore(
          initialState: AppState.initial, widgetUnderTest: const HomeScreen());
      await tester.pumpWidget(harness.widget);

      expect(find.byType(BasicAppBar), findsOneWidget);
      expect(find.byType(OrganisationSelector), findsOneWidget);
      expect(find.byType(ProjectsGrid), findsOneWidget);
    }));
  });
}
