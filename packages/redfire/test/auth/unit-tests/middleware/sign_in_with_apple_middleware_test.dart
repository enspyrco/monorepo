import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/src/auth/middleware/sign_in_with_apple_middleware.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('SignInWithAppleMiddleware', () {
    test('SignInWithApple catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = MockAuthService();
      RedFireLocator.provide(authService: authServiceMock);
      final middleware = SignInWithAppleMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(ExampleAppState.init());
      const action = SignInWithAppleAction();

      // Create the error to catch.
      when(authServiceMock.getAppleCredential()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last is AddProblemAction, true);
    });

    test('should ', () async {
      final mockStore = MockStore<RedFireState>();

      // Create then invoke the middleware under test.
      final middleware = SignInWithAppleMiddleware();
      await middleware(
          mockStore, const SignInWithAppleAction(), (dynamic _) => null);
      expect(true, false);
    }, skip: true); // haven't finished the test

    /// If the user cancels sign in, the service will... and the middleware
    /// should ...
    test('appleSignInStream resets auth steps on cancel', () {
      final _ = AuthService(
          firebase: FirebaseAuthExample.signedInMock,
          apple: SignInWithAppleWrapperExample.cancellingMock);

      // expect(
      //     service.appleSignInStream,
      //     emitsInOrder(<dynamic>[
      //       SetAuthStepAction(AuthenticationEnum.contactingApple),
      //       SetAuthStepAction(AuthenticationEnum.waitingForInput),
      //     ]));
    });

    test('dispatches expected actions at each stage', () {
      final _ = AuthService(
          firebase: FirebaseAuthExample.signedInMock,
          apple: SignInWithAppleWrapperExample.cancellingMock);

      // TODO: Convert below service test to a middleware test
      // The code below is from an old setup - what used to be in the
      // service (and emitted by the service's appleSignInStream) is now part of the
      // the middleware. Also we now use a different apple sign in plugin.

      // /// The service will emit [StoreAuthStep] with [AuthStep.signingInWithApple]
      // /// then another [StoreAuthStep], with [AuthStep.signingInWithFirebase].
      // /// The apple signin object then throws, the service catches the exception
      // /// and (in order to reset the UI) emits [StoreAuthStep] with
      // /// [AuthStep.waitingForInput]. Finally the service emits [AddProblem]
      // /// with a problem that has info about the exception.
      // ///
      // /// We use a [TypeMatcher] as it's difficult to create the expected
      // /// [Problem] due to the [Problem.trace] member
      // expect(
      //     service.appleSignInStream,
      //     emitsInOrder(<dynamic>[
      //       SetAuthStepAction(AuthenticationEnum.contactingApple),
      //       SetAuthStepAction(AuthenticationEnum.signingInWithFirebase),
      //       SetAuthStepAction(AuthenticationEnum.waitingForInput),
      //       const TypeMatcher<AddProblemAction>()
      //         ..having((p) => p.info.message, 'message',
      //             equals('Exception: AppleSignIn.signIn')),
      //     ]));
    });

    // test that errors are handled by being passed to the store
    test('dispatches StoreProblemAction when AuthService throws', () async {
      final _ = AuthService(
          firebase: FirebaseAuthExample.signedInMock,
          apple: SignInWithAppleWrapperExample.throwingFake);

      // TODO: Convert below service test to a middleware test
      // The code below is from an old setup - what used to be in the
      // service (and emitted by the service's appleSignInStream) is now part of the
      // the middleware. Also we now use a different apple sign in plugin.

      // // the service will emit step 1 indicating apple signin is occuring
      // // the apple signin throws and the service catches the exception then
      // // emits an action to reset the auth step then emits a problem with info
      // // about the exception
      // expect(
      //     service.appleSignInStream,
      //     emitsInOrder(<dynamic>[
      //       const TypeMatcher<SetAuthStepAction>()
      //         ..having((a) => a.step, 'step', 1),
      //       const TypeMatcher<SetAuthStepAction>()
      //         ..having((a) => a.step, 'step', 0),
      //       const TypeMatcher<AddProblemAction>()
      //         ..having((p) => p.info.message, 'message',
      //             equals('Exception: AppleSignIn.signIn')),
      //       emitsDone,
      //     ]));
    });
  });
}
