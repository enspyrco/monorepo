import 'package:astro_types/auth_types.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('...', () {
      var checking1 = SignedInState.checking;
      var checking2 = SignedInState.checking;
      expect(checking1 == checking2, true);
      var signedIn1 = SignedInState.signedIn;
      var signedIn2 = SignedInState.signedIn;
      expect(signedIn1 == signedIn2, true);
    });
  });
}
