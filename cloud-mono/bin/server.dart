import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notion_pages_to_web_tutorial/models/notion/notion_block_types.dart'
    as notion_types;
import 'package:notion_pages_to_web_tutorial/notion_auth_token.dart';
import 'package:notion_pages_to_web_tutorial/utils.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

const authority = 'api.notion.com';
const path = 'v1/blocks/';

Future<Response> handler(Request request) async {
  final body = await request.readAsString();
  print('{"body": $body}');
  var bodyJson = jsonDecode(body) as Map<String, Object?>;
  var pageId = bodyJson['pageId'] as String;

  var client = http.Client();
  try {
    var response = await client
        .get(Uri.https(authority, path + pageId + '/children'), headers: {
      'Authorization': 'Bearer $token',
      'Notion-Version': '2021-08-16'
    });
    print(response.body);

    var responseJson = jsonDecode(response.body) as JsonMap;
    var responseList = responseJson['results'] as JsonList;
    var notionObjects = responseList
        .cast<JsonMap>()
        .map((json) => notion_types.map[json['type']]!(json));
    print(notionObjects);
  } finally {
    client.close();
  }

  return Response.ok('Success.');
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at https://${server.address.host}:${server.port}');
  });
}
