import 'dart:convert';

import 'package:crypto/crypto.dart';

class AuthService {
  /// Verify sender by using the secret key to calculate a signature from the body
  /// and compare it with the signature that was also sent with the request.
  ///
  /// The secret key is added to github to be used by the webhooks and also stored
  /// in the secret manager and retrieved in Cloud Run for use in verfication.
  ///
  /// [verifySender] throws on signature mismatch.
  Future<void> verifySender(String? signature, String body, String key) async {
    var bodyBytes = utf8.encode(body);
    var encodedKey = utf8.encode(key);
    var digest = Hmac(sha256, encodedKey).convert(bodyBytes);

    var calculatedSignature = 'sha256=$digest';
    if (calculatedSignature != signature) {
      throw SignatureMismatchException();
    }
  }
}

class SignatureMismatchException implements Exception {}
