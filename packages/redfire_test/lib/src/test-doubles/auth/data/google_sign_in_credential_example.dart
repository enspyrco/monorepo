import 'package:redfire/types.dart';

class GoogleSignInCredentialExample {
  static GoogleSignInCredential get basic => GoogleSignInCredential(
      accessToken: 'accessToken',
      serverAuthCode: 'serverAuthCode',
      idToken: 'idToken');
}
