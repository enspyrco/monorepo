import 'package:redfire/types.dart';

class AppleIdCredentialExample {
  static AppleIdCredential get basic => AppleIdCredential(
      userIdentifier: 'uid',
      givenName: 'Nick',
      familyName: 'Meinhold',
      email: 'nick@enspyr.co',
      authorizationCode: 'code',
      identityToken: 'idToken',
      state: 'state');
}
