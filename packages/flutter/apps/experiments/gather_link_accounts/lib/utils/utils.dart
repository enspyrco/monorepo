import 'dart:convert';
import 'dart:math';

// From: https://www.scottbrady91.com/dart/generating-a-crypto-random-string-in-dart
class Utils {
  static final Random _random = Random.secure();

  static String generateNonce([int length = 32]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));

    return base64Url.encode(values);
  }
}
