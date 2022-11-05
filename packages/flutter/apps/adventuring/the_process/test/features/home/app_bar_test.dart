import 'package:astro_auth/astro_auth.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';
import 'package:the_process/home/home_screen.dart';
import 'package:the_process/home/logo_icon.dart';
import 'package:the_process/home/notifications-button/notifications_button.dart';

void main() {
  group('AppBar', () {
    testWidgets('builds LogoIcon, NotificationsButton, AvatarMenuButton',
        ((tester) async {
      final harness = WidgetTestHarness(
        initialState: AppState.initial,
        innerWidget: const BasicAppBar(),
      );
      await tester.pumpWidget(harness.widget);

      expect(find.byType(LogoIcon), findsOneWidget);
      expect(find.byType(NotificationsButton), findsOneWidget);
      expect(find.byType(AvatarMenuButton<AppState>), findsOneWidget);
    }));
  });
}
