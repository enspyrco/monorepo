import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/src/auth/actions/email/get_providers_for_email_action.dart';
import 'package:redfire/src/auth/services/auth_service.dart';
import 'package:redfire/src/auth/widgets/auth_page.dart';
import 'package:redfire/src/auth/widgets/auth_page_buttons/google_sign_in_button.dart';
import 'package:redfire/src/auth/widgets/auth_page_text_fields/email_text_field.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  group('AuthPage', () {
    testWidgets('displays sign in button', (WidgetTester tester) async {
      // create a basic store with middleware, services and reducers
      final stubbedAuthService = AuthService(
          firebase: MockFirebaseAuth(),
          google: MockGoogleSignIn(),
          apple: MockSignInWithAppleWrapper());

      RedFireLocator.provide(authService: stubbedAuthService);

      final fakeStore = FakeStore(ExampleAppState.init());

      final authPageFinder = find.byType(GoogleSignInButton);

      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<ExampleAppState>(
          store: fakeStore,
          child: const MaterialApp(home: AuthPage<ExampleAppState>()),
        ),
      );

      // check that the Text with the expected String is in the widget tree
      expect(authPageFinder, findsOneWidget);
    });

    testWidgets(
        'dispatches GetProvidersForEmailAction on EmailTextField submit',
        (WidgetTester tester) async {
      RedFireLocator.provide(
          authService: AuthService(firebase: MockFirebaseAuth()));

      final fakeStore = FakeStore(ExampleAppState.init());

      final textFieldFinder =
          find.byType((<T>() => T)<EmailTextField<ExampleAppState>>());

      await tester.pumpWidget(
        StoreProvider<ExampleAppState>(
          store: fakeStore,
          child: const MaterialApp(home: AuthPage<ExampleAppState>()),
        ),
      );

      await tester.enterText(textFieldFinder, 'hi');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(fakeStore.dispatched, contains(GetProvidersForEmailAction('hi')));
    });

    testWidgets('dispatches SigninWithGoogle on tap',
        (WidgetTester tester) async {
      // final signInButtonFinder = find.byType(GoogleSignInButton);

      // final fakedOutAuthService = AuthService(
      //     FakeFirebaseAuth1(), FakeGoogleSignInCancels(), FakeAppleSignIn());
      // final fakedOutStore = FakedOutStore(authService: fakedOutAuthService);

      // // build our app and trigger a frame
      // await tester.pumpWidget(
      //   // create a StoreProvider to wrap widget
      //   StoreProvider<ExampleAppState>(
      //     store: fakedOutStore,
      //     child: MaterialApp(home: AuthPage()),
      //   ),
      // );

      // await tester.tap(signInButtonFinder);

      // // the fake google sign in we created returns null, as when the
      // // user cancels, so the steps should have been reset to 0
      // expect(fakedOutStore.state.authStep, 0);
    });

    testWidgets('dispatches SigninWithApple on tap',
        (WidgetTester tester) async {
      //   final signInButtonFinder = find.byType(AppleSignInButton);

      //   final fakedOutAuthService = AuthService(FakeFirebaseAuth1(),
      //       FakeGoogleSignInCancels(), FakeAppleSignInCancels());
      //   final fakedOutStore = FakedOutStore(authService: fakedOutAuthService);

      //   // build our app and trigger a frame
      //   await tester.pumpWidget(
      //     // create a StoreProvider to wrap widget
      //     StoreProvider<ExampleAppState>(
      //       store: fakedOutStore,
      //       child: MaterialApp(home: AuthPage()),
      //     ),
      //   );

      //   await tester.tap(signInButtonFinder);

      //   // the fake apple sign in we created has cancelled status so the steps
      //   // should have been reset to 0
      //   expect(fakedOutStore.state.authStep, 0);
    });
  });
}
