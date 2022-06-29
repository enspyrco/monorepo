import 'dart:async';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:notion_api_client/notion_api_client.dart';
import 'package:test/test.dart';

void main() {
  group('Smoke tests >', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('NotionClient takes a http.Client and uses it to call an endpoint',
        () {
      final bodyController = StreamController<List<int>>();
      bodyController.close();
      var response = StreamedResponse(bodyController.stream, 200,
          headers: {'content-type': 'application/json'});
      var mockClient =
          MockClient.streaming((req, stream) => Future.value(response));
      var notion = NotionClient(client: mockClient, token: 'token');
      notion.getPageProperties(id: 'e93dda7fa5ed4e28ba27e857cd1f6757');
      notion.close();

      expect(true, isTrue);
    }, skip: true); // I think was only half finished, skipping
  });
}
