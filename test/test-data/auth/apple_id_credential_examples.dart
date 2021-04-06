import 'package:the_process/models/auth/apple_id_credential.dart';

class ExampleAppleIdCredential {
  static AppleIdCredential get basic => AppleIdCredential(
      userIdentifier: 'uid',
      givenName: 'Nick',
      familyName: 'Meinhold',
      email: 'nick@enspyr.co',
      authorizationCode: 'code',
      identityToken: 'idToken',
      state: 'state');
}
