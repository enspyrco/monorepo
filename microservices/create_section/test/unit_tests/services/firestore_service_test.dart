import 'package:create_section/src/services/firestore_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../test_data/firestore_document_test_data.dart'
    as firestore_document_test_data;
import '../../test_doubles/apis/firestore_api_test_doubles.dart';
import '../../test_doubles/apis/firestore_api_test_doubles.mocks.dart';

void main() {
  group('FirestoreService', () {
    ////////////// getGoogleUserCredentials
    // -- Order of events we want to test:
    // 1. Create document name from the userId.
    // 3. Use firestoreApi to retrieve data from the firestore.
    // 4. Convert to a model object.
    // -- What could go wrong?
    // 1. Using the firestoreApi produces an error.
    // 2. Malformed data is used to create the credentials model.

    test(
        'getGoogleUserCredentials() retrieves user credentials and converts to model object',
        () async {
      final exampleUserId = 'uid';
      final exampleDoc = firestore_document_test_data.userCredentialsDoc;

      final mockFirestoreApi = createFirestoreApiMockThatReturns(
          document: exampleDoc, onCalling: FirestoreFunctionNamed.documentsGet);

      // Create the subject under test.
      final firestoreService = await FirestoreService(mockFirestoreApi);

      // Run the function we are testing.
      final googleUserCredentials =
          await firestoreService.getGoogleUserCredentials(exampleUserId);

      // Save a variable for easier access.
      final googleFields = exampleDoc.fields['google']!.mapValue.fields;

      // Check the model object contains the same data provided by the api.
      expect(googleUserCredentials.accessToken,
          googleFields['access_token']!.stringValue);
      expect(googleUserCredentials.expiryDate.toString(),
          googleFields['expiry_date']!.integerValue);
      expect(
          googleUserCredentials.idToken, googleFields['id_token']!.stringValue);
      expect(googleUserCredentials.refreshToken,
          googleFields['refresh_token']!.stringValue);
      expect(googleUserCredentials.scope, googleFields['scope']!.stringValue);
      expect(googleUserCredentials.tokenType,
          googleFields['token_type']!.stringValue);
    });

    test('getGoogleUserCredentials() throws when firestore api throws',
        () async {
      final exampleUserId = 'uid';
      final exampleExceptionMessage = 'exampleExceptionMessage';

      final mockFirestoreApi = MockFirestoreApi();
      when(mockFirestoreApi.projects)
          .thenThrow(Exception(exampleExceptionMessage));

      // Create the subject under test.
      final firestoreService = await FirestoreService(mockFirestoreApi);

      // Run the function we are testing.
      expect(firestoreService.getGoogleUserCredentials(exampleUserId),
          throwsException);
    });

    test(
        'getGoogleUserCredentials() throws TypeError when given malformed data',
        () async {
      final exampleUserId = 'uid';
      final exampleDoc = firestore_document_test_data.basicDoc;

      final mockFirestoreApi = createFirestoreApiMockThatReturns(
          document: exampleDoc, onCalling: FirestoreFunctionNamed.documentsGet);

      // Create the subject under test.
      final firestoreService = await FirestoreService(mockFirestoreApi);

      // Run the function we are testing.
      expect(firestoreService.getGoogleUserCredentials(exampleUserId),
          throwsA(const TypeMatcher<TypeError>()));
    });
  });
}
