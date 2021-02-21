import 'package:shared_models/shared_models.dart';
import 'package:test/test.dart';

import 'package:create_section/src/extensions/models/google_user_credentials_extensions.dart';

void main() {
  group('GoogleUserCredentials Extension', () {
    test('toAccessCredentials() returns expected AccessCredentials', () {
      final exampleTokenType = 'Bearer';
      final exampleAccessToekn = 'accessToken';
      final exampleExpiryDate = DateTime.parse('2012-02-27').toUtc();
      final exampleRefreshToken = 'refreshToken';
      final exampleIdToken = 'idToken';
      final exampleScopesString = 'scope1 scope2';

      final credentials = GoogleUserCredentials(
          refreshToken: exampleRefreshToken,
          expiryDate: exampleExpiryDate.millisecondsSinceEpoch,
          accessToken: exampleAccessToekn,
          tokenType: exampleTokenType,
          idToken: exampleIdToken,
          scope: 'scope1 scope2');

      final accessCredentials = credentials.toAccessCredentials();

      expect(accessCredentials.accessToken.type, exampleTokenType);
      expect(accessCredentials.accessToken.data, exampleAccessToekn);
      expect(accessCredentials.accessToken.expiry, exampleExpiryDate);
      expect(accessCredentials.refreshToken, exampleRefreshToken);
      expect(accessCredentials.idToken, exampleIdToken);
      expect(accessCredentials.scopes, exampleScopesString.split(' '));
    });
  });
}
