import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/src/app-init/widgets/initializing_error_page.dart';
import 'package:redfire/src/app-init/widgets/initializing_indicator.dart';
import 'package:redfire/src/auth/widgets/auth_page_buttons/apple_sign_in_button.dart';
import 'package:redfire/src/auth/widgets/auth_page_buttons/google_sign_in_button.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';
import 'package:redfire_test/redfire_test.dart';

import '../../test-doubles/app_state/app_state.dart';

void main() {
  group('AppWidget', () {
    testWidgets('shows AuthPage if not authenticated',
        (WidgetTester tester) async {
      // Create the default app widget test harness, with a FakeStore provided
      // to the AppWidget
      final harness = AppWidgetHarness<AppState>.withFakeStore(
          initialState: AppState.init());

      // Build the widget tree and let the intro animation settle.
      await tester.pumpWidget(harness.widget);
      await tester.pumpAndSettle();

      // check we got past app initialization to the auth page.
      expect(find.byType(InitializingIndicator), findsNothing);
      expect(find.byType(InitializingErrorPage), findsNothing);
      expect(find.byType(GoogleSignInButton), findsOneWidget);
    });

    testWidgets('shows MainPage if authenticated', (WidgetTester tester) async {
      // Create an AppState representing an authenticated state.
      final authenticatedState = AppState.init().copyWith.auth(
          userData: AuthUserDataExample.minimal,
          step: AuthenticationEnum.waitingForInput);

      // Create app widget test harness, with a fake store & authenticated state
      final harness = AppWidgetHarness<AppState>.withFakeStore(
          initialState: authenticatedState);

      // Build the widget tree and let the intro animation settle.
      await tester.pumpWidget(harness.widget);
      await tester.pumpAndSettle();

      // check we got past app initialization & auth page to the main page.
      expect(find.byType(InitializingIndicator), findsNothing);
      expect(find.byType(InitializingErrorPage), findsNothing);
      expect(find.byType(GoogleSignInButton), findsNothing);
      expect(find.byType(EmptyMainPage), findsOneWidget);
    });

    // This is a test with a real store & real services (wrapping faked
    // plugins).
    testWidgets('(with real services) shows MainPage after authentication',
        (WidgetTester tester) async {
      // Create real services with mocked plugins for the service locator.
      final services = ServicesHarnessForAuth();
      final harness = AppWidgetHarness<AppState>.withMockedPlugins(
          AppState.init(), services);

      // Build the widget tree.
      await tester.pumpWidget(harness.widget);

      await tester.pump();

      // Check we got past initialization and are waiting for input for auth.
      expect(find.byType(InitializingIndicator), findsNothing);
      expect(find.byType(InitializingErrorPage), findsNothing);
      expect(find.byType(WaitingIndicator), findsNothing);
      expect(find.byType(AppleSignInButton), findsOneWidget);

      // Simulate an auth state change with an authenticated user being emitted.
      services.emitStubbedUser();

      await tester.pump();

      expect(find.byType(EmptyMainPage), findsOneWidget);
    });
  });
}
