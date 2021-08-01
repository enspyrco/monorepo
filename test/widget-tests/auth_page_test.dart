import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/src/auth/widgets/auth/auth_page.dart';
import 'package:redfire/src/auth/widgets/auth/auth_page_buttons/google_sign_in_button.dart';

import '../test-doubles/app_state/app_state.dart';

void main() {
  group('AuthPage', () {
    testWidgets('displays sign in button', (WidgetTester tester) async {
      // create a basic store with middleware, services and reducers
      final fakedOutAuthService = AuthService(
          FakeFirebaseAuth1(), FakeGoogleSignIn(), FakeAppleSignIn());
      final fakedOutStore = FakedOutStore(authService: fakedOutAuthService);

      final authPageFinder = find.byType(GoogleSignInButton);

      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: fakedOutStore,
          child: MaterialApp(home: AuthPage()),
        ),
      );

      // check that the Text with the expected String is in the widget tree
      expect(authPageFinder, findsOneWidget);
    });

    testWidgets('dispatches SigninWithGoogle on tap',
        (WidgetTester tester) async {
      final signInButtonFinder = find.byType(GoogleSignInButton);

      final fakedOutAuthService = AuthService(
          FakeFirebaseAuth1(), FakeGoogleSignInCancels(), FakeAppleSignIn());
      final fakedOutStore = FakedOutStore(authService: fakedOutAuthService);

      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: fakedOutStore,
          child: MaterialApp(home: AuthPage()),
        ),
      );

      await tester.tap(signInButtonFinder);

      // the fake google sign in we created returns null, as when the
      // user cancels, so the steps should have been reset to 0
      expect(fakedOutStore.state.authStep, 0);
    });

    testWidgets('dispatches SigninWithApple on tap',
        (WidgetTester tester) async {
      final signInButtonFinder = find.byType(AppleSignInButton);

      final fakedOutAuthService = AuthService(FakeFirebaseAuth1(),
          FakeGoogleSignInCancels(), FakeAppleSignInCancels());
      final fakedOutStore = FakedOutStore(authService: fakedOutAuthService);

      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: fakedOutStore,
          child: MaterialApp(home: AuthPage()),
        ),
      );

      await tester.tap(signInButtonFinder);

      // the fake apple sign in we created has cancelled status so the steps
      // should have been reset to 0
      expect(fakedOutStore.state.authStep, 0);
    });
  });
}
