import 'package:googleapis/firestore/v1.dart';
import 'package:shared_models/shared_models.dart' show GoogleUserCredentials;

extension DocumentExtension on Document {
  GoogleUserCredentials toGoogleUserCredentials() {
    final googleFields = fields['google']!.mapValue.fields;

    return GoogleUserCredentials(
      accessToken: googleFields['access_token']!.stringValue,
      refreshToken: googleFields['refresh_token']!.stringValue,
      expiryDate: int.parse(googleFields['expiry_date']!.integerValue),
      idToken: googleFields['id_token']!.stringValue,
      tokenType: googleFields['token_type']!.stringValue,
      scope: googleFields['scope']!.stringValue,
    );
  }
}
