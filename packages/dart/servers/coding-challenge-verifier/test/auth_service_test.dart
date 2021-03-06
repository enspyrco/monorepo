import 'package:coding_challenge_verifier/services/auth_service.dart';
import 'package:test/test.dart';

import 'data/example_body.dart';

/// The AuthService takes
void main() {
  group('AuthService', () {
    test('correctly calculates the signature', () async {
      var authService = AuthService();

      // in real life the key is generated by github and stored in the secret manager

      // the signatures won't match because we used the wrong key
      expect(() => authService.verifySender(signature1, body1, 'wrong key'),
          throwsException);

      // when we use the correct key the signatures match
      expect(() => authService.verifySender(signature1, body1, 'right key'),
          returnsNormally);
    });
  });
}
