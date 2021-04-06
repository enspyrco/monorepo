import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/models/auth/google_sign_in_credential.dart';
import 'package:the_process/services/auth_service.dart';

import '../../test-data/auth_test_data.dart';

class AuthServiceFake extends Fake implements AuthService {
  @override
  Future<String> getCurrentUserId() => Future.value('uid');

  @override
  Future<GoogleSignInCredential> getGoogleCredential() =>
      Future.value(exampleGoogleSignInCredential);

  // @override
  // Future<AuthUserData> signInWithGoogle(
  //         {required GoogleSignInCredential credential}) =>
  //     Future.value(AuthUserData());

  // @override
  // Future<AuthUserData> signInWithApple(
  //         {required AppleIdCredential credential}) =>
  //     Future.value(AuthUserData());
}
