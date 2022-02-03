import 'dart:convert';

import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

typedef JsonMap = Map<String, Object?>;
typedef JsonList = List<Object?>;

Future<Response> handler(Request request) async {
  String body = await request.readAsString();

  try {
    var json = jsonDecode(body) as JsonMap;
    if (json['type'] == 1) return Response.ok('{"type": 1}');
  } catch (e) {
    return Response.internalServerError(body: e.toString());
  }

  return Response.notFound('No type found in body.');
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at https://${server.address.host}:${server.port}');
  });
}
