import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';
import 'package:the_process/home/home_screen.dart';
import 'package:the_process/home/logo_icon.dart';
import 'package:the_process/home/notifications-button/notifications_button.dart';

void main() {
  group('AppBar', () {
    testWidgets('builds the expected children', ((tester) async {
      final harness = WidgetTestHarness.withFakeStore(
          initialState: AppState.initial, widgetUnderTest: const BasicAppBar());
      await tester.pumpWidget(harness.widget);

      expect(find.byType(LogoIcon), findsOneWidget);
      expect(find.byType(NotificationsButton), findsOneWidget);
      // expect(find.byType(AvatarMenuButton<AppState>), findsOneWidget);
    }));
  });
}
