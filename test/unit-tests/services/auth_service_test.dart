import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/src/auth/enums/authentication_enum.dart';
import 'package:redfire/src/auth/services/auth_service.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('AuthService', () {
    test('should map FirebaseAuth.authStateChanges to SetAuthUserDataActions',
        () {
      // Create the auth service with a stubbed FirebaseAuth plugin.
      final mockFirebaseAuth = MockFirebaseAuth();
      final controller = StreamController<User>();
      when(mockFirebaseAuth.authStateChanges())
          .thenAnswer((_) => controller.stream);
      final authService = AuthService(firebase: mockFirebaseAuth);

      // Create a stubbed User object that will be emitted for the test.
      final stubbedUser = Stubbed.firebaseUser();

      // Check that the streamOfStoreAuthState returned by the auth service
      // eventually emits a SetAuthUserDataAction with expected state.
      authService.streamOfStoreAuthState.listen(expectAsync1((action) {
        expect(action is SetAuthUserDataAction, true);
        action = action as SetAuthUserDataAction;
        expect(action.authUserData!.uid, stubbedUser.uid);
        expect(action.authUserData!.displayName, stubbedUser.displayName);
        expect(action.authUserData!.photoURL, stubbedUser.photoURL);
        expect(action.authUserData!.email, stubbedUser.email);
        expect(action.authUserData!.phoneNumber, stubbedUser.phoneNumber);
        // TODO: User.metadata - doesn't seem to be included in AuthUserData
        expect(action.authUserData!.isAnonymous, stubbedUser.isAnonymous);
        expect(action.authUserData!.emailVerified, stubbedUser.emailVerified);
        // TODO: compare User.providerData with AuthUserData.providers
        //  - Stubbed.firebaseUser() needs to add some UserInfo items to providerData
      }));

      // Make the mock FirebaseAuth plugin emit the mock firebase User object.
      controller.add(stubbedUser);
    });

    test('googleSignInStream resets auth steps on cancel', () {
      final service = AuthService(
          firebase: FirebaseAuthExample.signedInMock,
          google: GoogleSignInExample.cancellingMock);

      // the service should set auth step to signing in with google
      // then due to user cancel (which means google sign in returns null)
      // the service should reset the auth step to waiting for input
      final expectedAuthSteps = [
        AuthenticationEnum.contactingGoogle,
        AuthenticationEnum.waitingForInput
      ];

      service.streamOfStoreAuthState.listen(expectAsync1((action) {
        expect(
            (action as SetAuthStepAction).step, expectedAuthSteps.removeAt(0));
      }, count: 2));
    });

    /// Setup an [AuthService] with mocks so the googleSignInStream
    /// emits the same sequence of [ReduxAction]s as a normal sign in
    test('streamOfStoreAuthState emits expected actions during authentication',
        () {
      final service = AuthService(
          firebase: FirebaseAuthExample.signedInMock,
          google: MockGoogleSignIn());

      expect(
          service.streamOfStoreAuthState,
          emitsInOrder(<ReduxAction>[
            SetAuthStepAction(AuthenticationEnum.contactingGoogle),
            SetAuthStepAction(AuthenticationEnum.signingInWithFirebase),
            SetAuthStepAction(AuthenticationEnum.waitingForInput),
            // NavigatorPopAll()
          ]));
    });

    test('streamOfStoreAuthState catches errors and emits StoreProblemActions',
        () async {
      final service = AuthService(
          firebase: FirebaseAuthExample.signedInMock,
          google: GoogleSignInExample.throwingMock);

      /// The service will emit the google sign in step then the google signin
      /// object throws and the service catches the exception then emits
      /// an action to reset the auth step then emits a problem with
      /// info about the exception.
      ///
      /// We use a [TypeMatcher] as it's difficult to create the expected
      /// [Problem] due to the [Problem.trace] member
      expect(
          service.streamOfStoreAuthState,
          emitsInOrder(<dynamic>[
            SetAuthStepAction(AuthenticationEnum.contactingGoogle),
            SetAuthStepAction(AuthenticationEnum.waitingForInput),
            const TypeMatcher<AddProblemAction>()
              ..having((p) => p.info.message, 'message',
                  equals('Exception: GoogleSignIn.signIn')),
          ]));
    });
  });
}
