import 'package:flutter_test/flutter_test.dart';
import 'package:presinter/app/app_state.dart';
import 'package:presinter/home/home_screen.dart';
import 'package:presinter/home/role_selector.dart';
import 'package:presinter/home/sessions_view.dart';
import 'package:redfire/widgets.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  testWidgets('HomeScreen should layout expected widgets', (tester) async {
    final testState = AppState.init();

    final harness = WidgetTestHarness.withFakeStore(
      initialState: testState,
      widgetUnderTest: const HomeScreen(),
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
