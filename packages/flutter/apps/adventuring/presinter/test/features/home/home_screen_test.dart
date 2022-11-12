import 'package:astro_auth/astro_auth.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presinter/app/home/home_screen.dart';
import 'package:presinter/app/home/role_selector.dart';
import 'package:presinter/app/home/sessions_view.dart';
import 'package:presinter/app/state/app_state.dart';

void main() {
  testWidgets('HomeScreen should layout expected widgets', (tester) async {
    final testState = AppState.initial;

    final harness = WidgetTestHarness(
      initialState: testState,
      innerWidget: const HomeScreen(),
    );

    await tester.pumpWidget(harness.widget);

    final roleSelectorFinder = find.byType(RoleSelector);
    final sessionsViewFinder = find.byType(SessionsView);
    final accountButtonFinder = find.byType(AvatarMenuButton<AppState>);

    expect(roleSelectorFinder, findsOneWidget);
    expect(sessionsViewFinder, findsOneWidget);
    expect(accountButtonFinder, findsOneWidget);
  });
}
