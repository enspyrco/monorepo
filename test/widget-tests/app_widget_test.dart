import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/types.dart';

void main() {
  group('AppWidget widget', () {
    testWidgets('observes auth state on load and navigates',
        (WidgetTester tester) async {
      final fakeFirebaseAuth = FakeFirebaseAuthOpen();
      final audioEventsController = StreamController<ReduxAction>();

      // create a basic store with middleware that uses the AuthService to
      // observe auth state and a reducer that saves the emitted auth state
      final store = FakedOutStore(
          authService: AuthService(
              fakeFirebaseAuth, FakeGoogleSignIn(), FakeAppleSignIn()),
          audioPlayerService: FakeAudioPlayerService(audioEventsController));

      fakeFirebaseAuth.add(null);

      /// Build a test harness that updates the app state so the [InitialPage]
      /// builds the [HomePage].
      final harness = AppWidgetHarness(store: store);

      // build our app and trigger a frame
      await tester.pumpWidget(harness.widget);

      // Create the Finders.
      final authPageFinder = find.text('Sign in with Google');
      final mainPageFinder = find.text('More');

      // Use the `findsOneWidget` matcher to verify that a Text widget with the
      // expected String appears exactly once in the widget tree, indicating the
      // AuthPage widget is present, so the expected navigation has occured
      expect(authPageFinder, findsOneWidget);
      expect(mainPageFinder, findsNothing);

      // add a FirebaseUser
      fakeFirebaseAuth.add(FakeFirebaseUser());

      await tester.pump();

      // Check that the Main Page is now shown
      expect(mainPageFinder, findsOneWidget);
      expect(authPageFinder, findsNothing);

      //
    });
  });
}
