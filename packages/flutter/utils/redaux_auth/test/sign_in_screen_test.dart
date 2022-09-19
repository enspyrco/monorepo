import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redaux_auth/redaux_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

void main() {
  group('SignInScreen', () {
    testWidgets('lays out platform appropriate sign in buttons',
        (tester) async {
      await tester.pumpWidget(
          const SignInScreen(SignedInState.checking, TargetPlatform.macOS));

      final titleFinder = find.byType(SignInWithAppleButton);

      expect(titleFinder, findsOneWidget);
    });
  });
}
