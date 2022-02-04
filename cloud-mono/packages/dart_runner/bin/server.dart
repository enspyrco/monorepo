import 'dart:convert';

import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

typedef JsonMap = Map<String, Object?>;
typedef JsonList = List<Object?>;

Future<Response> handler(Request request) async {
  try {
    String body = await request.readAsString();
    var json = jsonDecode(body) as JsonMap;
    if (json['type'] == 1) return Response.ok('{"type": 1}');

    String signature = request.headers['X-Signature-Ed25519'] ?? '';
    String timestamp = request.headers['X-Signature-Timestamp'] ?? '';

    print('body:\n$body');
    print('signature:\n$signature');
    print('timestamp:\n$timestamp');
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
