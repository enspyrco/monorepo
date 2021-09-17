import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:redfire_test/src/test-doubles/http/mocks/http_test_doubles.mocks.dart';

class Stubbed {
  static http.Client client({String? body}) {
    final mockClient = MockClient();
    final futureResponse = Future.value(http.Response(body ?? 'body', 400,
        headers: {'content-type': 'application/json; charset=utf-8'}));

    when(mockClient.get(any)).thenAnswer((_) => futureResponse);

    return mockClient;
  }
}
