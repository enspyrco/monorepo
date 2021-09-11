import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

import '../../auth/examples/user_example.dart';
import '../../firebase/mocks/firebase_test_doubles.mocks.dart';

class FirebaseAuthExample {
  /// Emits a User with null members then a FirebaseUser with random
  /// values (this follows the pattern when a user is signed in and starts the app)

  /// We mock a UserCredntial and stub the MockFirebaseAuth so that calling
  /// signInWithCredential returns the currently signed-in [User],
  /// or `null` if there isn't any (i.e. the user is signed out).
  static FirebaseAuth get signedInMock {
    final mockUserCredential = MockUserCredential();
    when(mockUserCredential.user).thenReturn(UserExample.basicFake);

    final mockFirebaseAuth = MockFirebaseAuth();
    when(mockFirebaseAuth.authStateChanges()).thenAnswer((_) =>
        Stream.fromIterable([UserExample.emptyFake, UserExample.basicFake]));
    when(mockFirebaseAuth.signInWithCredential(any))
        .thenAnswer((_) => Future.value(mockUserCredential));

    return mockFirebaseAuth;
  }
}
