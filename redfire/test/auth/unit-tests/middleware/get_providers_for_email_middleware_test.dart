import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/src/auth/actions/email/get_providers_for_email_action.dart';
import 'package:redfire/src/auth/actions/email/set_email_action.dart';
import 'package:redfire/src/auth/middleware/get_providers_for_email_middleware.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('GetProvidersForEmailMiddleware', () {
    test('dispatches SetEmailAction & handles errors', () {
      const testEmail = 'hi';
      final serviceMock = MockAuthService();
      when(serviceMock.retrieveProvidersFor(testEmail)).thenThrow('error');

      RedFireLocator.provide(authService: serviceMock);

      final fakeStore = FakeStore(ExampleAppState.init());
      final action = GetProvidersForEmailAction(testEmail);

      GetProvidersForEmailMiddleware()
          .call(fakeStore, action, (dynamic _) => null);

      // SetEmailAction should be dispatched first then AddProblemAction when the
      // middleware accesses the service and an exception is thrown.
      expect(fakeStore.dispatched, hasLength(2));
      expect(fakeStore.dispatched.first, isA<SetEmailAction>());
      expect(fakeStore.dispatched.last, isA<AddProblemAction>());
      expect((fakeStore.dispatched.last as AddProblemAction).info.message,
          equals('error'));
    });

    test('clears email & displays problem on invalid email', () async {
      const testEmail = 'email';
      final serviceMock = MockAuthService();
      when(serviceMock.retrieveProvidersFor(testEmail))
          .thenThrow(FirebaseAuthException(code: 'invalid-email'));

      RedFireLocator.provide(authService: serviceMock);

      final fakeStore = FakeStore(ExampleAppState.init());
      final action = GetProvidersForEmailAction(testEmail);

      GetProvidersForEmailMiddleware()
          .call(fakeStore, action, (dynamic _) => null);

      expect(
          Stream.fromIterable(fakeStore.dispatched),
          emitsInOrder(<dynamic>[
            SetEmailAction(testEmail),
            SetEmailAction(null),
            isA<AddProblemAction>().having((action) => action.info.message,
                'message', startsWith('[firebase_auth/invalid-email]')),
            emitsDone
          ]));
    });
  });
}
