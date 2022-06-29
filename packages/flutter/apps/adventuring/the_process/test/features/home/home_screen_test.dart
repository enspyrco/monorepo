import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/widgets.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/home/home_screen.dart';
import 'package:the_process/home/logo_icon.dart';
import 'package:the_process/home/notifications-button/notifications_button.dart';
import 'package:the_process/organisations/widgets/organisation_selector.dart';
import 'package:the_process/projects/widgets/grid-view/projects_grid.dart';

void main() {
  group('Home Screen', () {
    testWidgets(
        'lays out LogoIcon, OrganisationSelector, ProjectsGrid, NotificationsButton & AccountAvatar',
        ((tester) async {
      final harness = WidgetTestHarness.withFakeStore(
          initialState: AppState.init(), widgetUnderTest: const HomeScreen());
      await tester.pumpWidget(harness.widget);

      expect(find.byType(LogoIcon), findsOneWidget);
      expect(find.byType(OrganisationSelector), findsOneWidget);
      expect(find.byType(ProjectsGrid), findsOneWidget);
      expect(find.byType(NotificationsButton), findsOneWidget);
      expect(find.byType(AvatarMenuButton), findsOneWidget);
    }));
  });
}
