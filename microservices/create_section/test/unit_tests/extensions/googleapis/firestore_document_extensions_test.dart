import 'package:test/test.dart';

import 'package:create_section/src/extensions/googleapis/firestore_document_extensions.dart';

import '../../../test_data/firestore_document_test_data.dart'
    as firestore_document_test_data;

void main() {
  group('DocumentExtension', () {
    test('toGoogleUserCredentials() returns expected GoogleUserCredentials',
        () {
      final doc = firestore_document_test_data.userCredentialsDoc;

      final googleUserCredentials = doc.toGoogleUserCredentials();

      final googleFields = doc.fields['google']!.mapValue.fields;

      expect(googleUserCredentials.accessToken,
          googleFields['access_token']!.stringValue);
      expect(googleUserCredentials.refreshToken,
          googleFields['refresh_token']!.stringValue);
      expect(googleUserCredentials.expiryDate,
          int.parse(googleFields['expiry_date']!.integerValue));
      expect(
          googleUserCredentials.idToken, googleFields['id_token']!.stringValue);
      expect(googleUserCredentials.tokenType,
          googleFields['token_type']!.stringValue);
      expect(googleUserCredentials.scope, googleFields['scope']!.stringValue);
    });
  });
}
