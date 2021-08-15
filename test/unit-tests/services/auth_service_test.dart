import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/src/auth/actions/store_auth_user_data_action.dart';
import 'package:redfire/src/auth/services/auth_service.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('AuthService', () {
    test('should provide a stream of user objects converted to actions', () {
      // Create the auth service with a stubbed FirebaseAuth plugin.
      final mockFirebaseAuth = MockFirebaseAuth();
      final controller = StreamController<User>();
      when(mockFirebaseAuth.authStateChanges())
          .thenAnswer((_) => controller.stream);
      final authService = AuthService(
          // FakeFirebaseAuth(authStateEventsController: controller),
          mockFirebaseAuth,
          MockGoogleSignIn(),
          MockAppleSignInWrapper());

      // Create a stubbed User object that will be emitted for the test.
      final stubbedUser = Stubbed.firebaseUser();

      // Check that the streamOfStoreAuthState returned by the auth service
      // eventually emits a StoreAuthUserDataAction with expected state.
      authService.streamOfStoreAuthState.listen(expectAsync1((action) {
        expect(action is StoreAuthUserDataAction, true);
        action = action as StoreAuthUserDataAction;
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
  });
}
