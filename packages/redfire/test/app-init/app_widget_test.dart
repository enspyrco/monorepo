import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  group('AppWidget', () {
    testWidgets('shows AuthPage if not authenticated',
        (WidgetTester tester) async {
      // Create the default app widget test harness, with a FakeStore provided
      // to the AppWidget
      final harness = AppWidgetHarness<ExampleAppState>.withFakeStore(
          initialState: ExampleAppState.init());

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
      final authenticatedState = ExampleAppState.init().copyWith.auth(
          userData: AuthUserDataExample.minimal,
          step: AuthStepEnum.waitingForInput);

      // Create app widget test harness, with a fake store & authenticated state
      final harness = AppWidgetHarness<ExampleAppState>.withFakeStore(
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
    testWidgets(
      '(with real services) shows MainPage after authentication',
      (WidgetTester tester) async {
        // Create real services with mocked plugins for the service locator.
        final services = ServicesHarnessForAuth();
        final harness = AppWidgetHarness<ExampleAppState>.withMockedPlugins(
            ExampleAppState.init(), services);

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
      },
      skip:
          true, // TODO: determine why the stream from ServicesHarnessForAuth is already listened to
    );

    group('RedFire Init', () {
      testWidgets('completes initialization and displays relevant prompts',
          (WidgetTester tester) async {
        // // Create the Finders.
        // final initializingIndicatorFinder = find.byType(InitializingIndicator);

        // // Create a test harness that wraps the App widget.
        // final harness = CompletableAppHarnessWithFakeStore();

        // // Build the widget tree.
        // await tester.pumpWidget(harness.widget);

        // expect(initializingIndicatorFinder, findsOneWidget);

        // // Verify the expected text is shown, indicating waiting for Firebase init
        // expect(find.text('Firing up the machine...'), findsOneWidget);

        // harness.completeFirebase();

        // await tester.pump();

        // // Verify the expected text is shown, indicating waiting for redux init
        // expect(find.text('Plumbing the streams...'), findsOneWidget);

        // harness.completeRedux();

        // await tester.pump();

        // expect(initializingIndicatorFinder, findsNothing);
      });
    });
  });
}
