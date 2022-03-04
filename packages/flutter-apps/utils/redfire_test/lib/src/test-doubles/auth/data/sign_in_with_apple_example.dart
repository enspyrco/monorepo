import 'package:redfire/types.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignInWithAppleWrapperExample {
  static SignInWithAppleWrapper get cancellingMock =>
      _FakeSignInWithAppleWrapperCancels();

  static SignInWithAppleWrapper get throwingFake =>
      _FakeSignInWithAppleWrapperThrows();
}

// When the user cancels during the signin process, it seems a particular
// exception is thrown - TODO: review docs and run tests to see if this is true
class _FakeSignInWithAppleWrapperCancels implements SignInWithAppleWrapper {
  @override
  Future<AuthorizationCredentialAppleID> getCredential(
      {List<AppleIDAuthorizationScopes>? scopes}) {
    throw const SignInWithAppleAuthorizationException(
      code: AuthorizationErrorCode.canceled,
      message: 'User canceled authorization',
    );
  }
}

class _FakeSignInWithAppleWrapperThrows implements SignInWithAppleWrapper {
  @override
  Future<AuthorizationCredentialAppleID> getCredential(
      {List<AppleIDAuthorizationScopes>? scopes}) {
    throw Exception('AppleSignIn.signIn');
  }
}
