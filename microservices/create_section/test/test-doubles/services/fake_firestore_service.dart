import 'package:create_section/src/services/firestore_service.dart';
import 'package:shared_models/src/google_user_credentials.dart';
import 'package:googleapis/firestore/v1.dart';
import 'package:test/fake.dart';

class FakeFirestoreService extends Fake implements FirestoreService {
  final GoogleUserCredentials _googleUserCredentials;
  final Exception? _getGoogleUserCredentialsException;

  FakeFirestoreService(
      {GoogleUserCredentials? googleUserCredentials,
      Exception? getGoogleUserCredentialsException})
      : _googleUserCredentials = googleUserCredentials ??
            GoogleUserCredentials(
                accessToken: 'accessToken',
                expiryDate: DateTime.parse('2012-02-27').millisecondsSinceEpoch,
                idToken: 'idToken',
                refreshToken: 'refreshToken',
                scope: 'scope',
                tokenType: 'Bearer'),
        _getGoogleUserCredentialsException = getGoogleUserCredentialsException;

  @override
  Future<GoogleUserCredentials> getGoogleUserCredentials(String userId) {
    if (_getGoogleUserCredentialsException != null) {
      throw _getGoogleUserCredentialsException!;
    }
    return Future.value(_googleUserCredentials);
  }

  @override
  Future<Document> saveSection(Document doc) {
    final newDoc = Document.fromJson(doc.toJson());
    newDoc.name = 'savedDocName';
    return Future.value(newDoc);
  }
}
