import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:redfire_test/src/test-doubles/http/mocks/http_test_doubles.mocks.dart';

import 'firebase/mocks/firebase_test_doubles.mocks.dart';

class Stubbed {
  static User firebaseUser() {
    final mockUser = MockUser();

    when(mockUser.uid).thenReturn('uid');
    when(mockUser.displayName).thenReturn('displayName');
    when(mockUser.photoURL).thenReturn('photoURL');
    when(mockUser.email).thenReturn('email');
    when(mockUser.phoneNumber).thenReturn('phoneNumber');
    when(mockUser.metadata).thenReturn(UserMetadata(0, 0));
    when(mockUser.isAnonymous).thenReturn(false);
    when(mockUser.emailVerified).thenReturn(false);
    when(mockUser.providerData).thenReturn([]);

    return mockUser;
  }

  static http.Client client({String? body}) {
    final mockClient = MockClient();
    final futureResponse = Future.value(http.Response(body ?? 'body', 400,
        headers: {'content-type': 'application/json; charset=utf-8'}));

    when(mockClient.get(any)).thenAnswer((_) => futureResponse);

    return mockClient;
  }
}
