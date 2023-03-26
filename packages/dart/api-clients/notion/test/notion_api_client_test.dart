import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:notion_api_client/notion_api_client.dart';
import 'package:test/test.dart';

import 'data/page_object.dart';

void main() {
  group('Smoke tests >', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('NotionClient takes a http.Client and uses it to call an endpoint',
        () async {
      final bodyController = StreamController<List<int>>();
      bodyController.add(Utf8Encoder().convert(pageObjectTestData));
      bodyController.close();
      var response = StreamedResponse(bodyController.stream, 200,
          headers: {'content-type': 'application/json'});
      var mockClient =
          MockClient.streaming((req, stream) => Future.value(response));
      var notion = NotionClient(client: mockClient, token: 'token');

      var pageObject = await notion.getPageProperties(id: '...');

      notion.close();

      expect(pageObject.id, equals('be633bf1-dfa0-436d-b259-571129a590e5'));
    });
  });
}
