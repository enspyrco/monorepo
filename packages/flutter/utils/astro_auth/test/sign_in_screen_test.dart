import 'package:astro_auth/astro_auth.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:astro_types/auth_types.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'test-doubles/astro_auth_app_state.dart';

void main() {
  group('SignInScreen', () {
    testWidgets('lays out platform appropriate sign in buttons',
        (tester) async {
      // Setup an app state where checking is done and there was no signed in user found.
      final state = ExampleAppState.initial.copyWith(
          auth: AstroAuth.initialState().copyWith(
              user: DefaultUserState(signedIn: SignedInState.notSignedIn)));

      // Setup a harness with the initial state.
      final harness = WidgetTestHarness<AstroAuthAppState>(
        initialState: state,
        innerWidget: const SignInScreen<AstroAuthAppState>(),
      );

      await tester.pumpWidget(harness.widget);

      expect(find.byType(SignInWithAppleButton), findsOneWidget);
    });
  });
}
