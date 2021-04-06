import 'dart:convert';

import 'package:create_section/src/services/auth_service.dart';
import 'package:create_section/src/services/firestore_service.dart';
import 'package:googleapis/firestore/v1.dart';
import 'package:test/test.dart';
import 'package:googleapis_auth/src/auth_http_utils.dart'
    show AutoRefreshingClient;

import '../../test-data/auth_test_data.dart' as auth_test_data;
import '../../test-doubles/apis/firestore_api_test_doubles.dart';
import '../../test-doubles/apis/secretmanager_api_test_doubles.dart';
import '../../test-doubles/services/fake_firestore_service.dart';

final enspyrTesterId = 'ayl3FcuCUVUmwpDGAvwI47ujyY32';

void main() {
  group('AuthService', () {
    // -- Order of events we want to test:
    // 1. Retrieve user credentials from the firestore.
    // 3. Retrieve project credentials json from secretmanager.
    // 4. Convert user credentials to an AccessCredentials object.
    // 5. Convert project credentials json to a ClientId.
    // 6. Use ClientId & AccessCredentials to create the AutoRefreshingAuthClient.

    // -- What could go wrong?
    // 1. Calling the firestore service throws an error.
    //    - auth service should throw
    // 2. Calling secretmanager throws an error.
    //    - auth service should throw
    // 3. Bad user credentials causes an error.
    //    - auth service should throw
    // 4. Bad project credentials causes an error.
    //    - auth service should throw

    test(
        '.getUserClient() turns project & user credentials into authenticated client',
        () async {
      // Create test data.
      final exampleCredentialsJson = auth_test_data.credentialsJson;
      final exampleGoogleUserCredentials = auth_test_data.googleUserCredentials;

      // Create test doubles.
      final fakeFirestoreService = FakeFirestoreService(
          googleUserCredentials: exampleGoogleUserCredentials);
      final mockSecretmanagerApi = createSecretmanagerApiMockThatReturns(
          payload: createSecretPayloadFrom(json: exampleCredentialsJson),
          onCalling: SecretmanagerFunctionNamed.access);

      // Create the subject under test.
      final authService = AuthService();

      // Run the function we are testing.
      final userClient = await authService.getUserClient(
          'testUserId', fakeFirestoreService, mockSecretmanagerApi);

      // Check that the user credentials provided by the firestoreApi became
      // part of the client's credentials.
      expect(userClient.credentials.refreshToken,
          exampleGoogleUserCredentials.refreshToken);
      expect(
          userClient.credentials.idToken, exampleGoogleUserCredentials.idToken);
      // -- The access token is created from several members of the data
      // provided by the firestoreApi (after conversion to json).
      expect(userClient.credentials.accessToken.data,
          exampleGoogleUserCredentials.accessToken);
      expect(userClient.credentials.accessToken.type,
          exampleGoogleUserCredentials.tokenType);
      expect(userClient.credentials.accessToken.expiry.millisecondsSinceEpoch,
          exampleGoogleUserCredentials.expiryDate);

      // Convert the string that we passed in to the fakeSecretmanagerApi
      // into json and check the relevant members become the ClientId that
      // was used to create the authenticated client.
      final json = jsonDecode(auth_test_data.credentialsJson);
      final underlyingClient = userClient as AutoRefreshingClient;
      expect(underlyingClient.clientId.identifier, json['google']['id']);
      expect(underlyingClient.clientId.secret, json['google']['secret']);
    });

    test('.getUserClient() throws when firestore service throws', () async {
      // Create test data.
      final exampleCredentialsJson = auth_test_data.credentialsJson;

      // Create test doubles.
      final fakeFirestoreService = FakeFirestoreService(
          getGoogleUserCredentialsException: Exception('yo!'));
      final mockSecretmanagerApi = createSecretmanagerApiMockThatReturns(
          payload: createSecretPayloadFrom(json: exampleCredentialsJson),
          onCalling: SecretmanagerFunctionNamed.access);

      // Create the subject under test.
      final authService = AuthService();

      // Run the function we are testing.
      expect(
          authService.getUserClient(
              'testUserId', fakeFirestoreService, mockSecretmanagerApi),
          throwsException);
    });

    test('.getUserClient() throws when secret manager service throws',
        () async {
      // Create test data.
      final exampleGoogleUserCredentials = auth_test_data.googleUserCredentials;
      final exampleException = Exception('An Exception!');

      // Create test doubles.
      final fakeFirestoreService = FakeFirestoreService(
          googleUserCredentials: exampleGoogleUserCredentials);
      final mockSecretmanagerApi =
          createSecretmanagerApiMockThatThrows(exception: exampleException);

      // Create the subject under test.
      final authService = AuthService();

      // Run the function we are testing.
      expect(
          authService.getUserClient(
              'testUserId', fakeFirestoreService, mockSecretmanagerApi),
          throwsException);
    });

    test('.getUserClient() throws when secret manager api provides bad json',
        () async {
      // Create test data (with malformed json).
      final exampleCredentialsJson = 'blah';
      final exampleGoogleUserCredentials = auth_test_data.googleUserCredentials;

      // Create test doubles.
      final fakeFirestoreService = FakeFirestoreService(
          googleUserCredentials: exampleGoogleUserCredentials);
      final mockSecretmanagerApi = createSecretmanagerApiMockThatReturns(
          payload: createSecretPayloadFrom(json: exampleCredentialsJson),
          onCalling: SecretmanagerFunctionNamed.access);

      // Create the subject under test.
      final authService = AuthService();

      // Run the function we are testing.
      expect(
          authService.getUserClient(
              'testUserId', fakeFirestoreService, mockSecretmanagerApi),
          throwsException);
    });

    test('.getUserClient() throws when firestore api provides a bad document',
        () async {
      // Create test data.
      final exampleCredentialsJson = auth_test_data.credentialsJson;
      final exampleDoc = Document();

      final mockFirestoreApi = createFirestoreApiMockThatReturns(
          document: exampleDoc, onCalling: FirestoreFunctionNamed.documentsGet);

      // Create test doubles.
      final fakeFirestoreService = FirestoreService(mockFirestoreApi);
      final mockSecretmanagerApi = createSecretmanagerApiMockThatReturns(
          payload: createSecretPayloadFrom(json: exampleCredentialsJson),
          onCalling: SecretmanagerFunctionNamed.access);

      // Create the subject under test.
      final authService = AuthService();

      // Run the function we are testing.
      expect(
          authService.getUserClient(
              'testUserId', fakeFirestoreService, mockSecretmanagerApi),
          throwsA(TypeMatcher<TypeError>()));
    });
  });
}
