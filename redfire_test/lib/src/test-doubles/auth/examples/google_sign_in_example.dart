import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire_test/redfire_test.dart';

class GoogleSignInExample {
  // When the user cancels during the signin process, the Future returned
  // by signIn completes with null
  static GoogleSignIn get cancellingMock {
    final mock = MockGoogleSignIn();
    when(mock.signIn()).thenAnswer((_) => Future.value(null));
    return mock;
  }

  static GoogleSignIn get basicMock {
    final mock = MockGoogleSignIn();
    when(mock.signIn())
        .thenAnswer((_) => Future.value(MockGoogleSignInAccount()));
    return mock;
  }

  static GoogleSignIn get throwingMock {
    final mock = MockGoogleSignIn();
    when(mock.signIn()).thenThrow(Exception('GoogleSignIn.signIn'));
    return mock;
  }
}
