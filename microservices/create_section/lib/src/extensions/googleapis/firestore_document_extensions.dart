import 'package:googleapis/firestore/v1.dart';
import 'package:shared_models/shared_models.dart' show GoogleUserCredentials;

/// This extension is used on a document returned from a database read.
/// The fields should always hold the expected values so this extension will
/// throw if any of the accessed fields are null, so always wrap a call to
/// the extension in a try catch.
///
/// When used in a cloud function, the call is already wrapped in a try/catch
/// that will print the exception to the logs.
extension DocumentExtension on Document {
  GoogleUserCredentials toGoogleUserCredentials() {
    final googleFields = fields!['google']!.mapValue!.fields!;

    return GoogleUserCredentials(
      accessToken: googleFields['access_token']!.stringValue!,
      refreshToken: googleFields['refresh_token']!.stringValue!,
      expiryDate: int.parse(googleFields['expiry_date']!.integerValue!),
      idToken: googleFields['id_token']!.stringValue!,
      tokenType: googleFields['token_type']!.stringValue!,
      scope: googleFields['scope']!.stringValue!,
    );
  }
}
