import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

const authority = 'api.notion.com';
const path = 'v1/pages/';

Future<Response> handler(Request request) async {
  final body = await request.readAsString();
  print(body);
  var bodyJson = jsonDecode(body) as Map<String, Object?>;
  var pageId = bodyJson['pageId'] as String;

  var client = http.Client();
  try {
    var response = await client.get(Uri.https(authority, path + pageId));
    // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    // var uri = Uri.parse(decodedResponse['uri'] as String);
    // print(await client.get(uri));
    print(response);
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
