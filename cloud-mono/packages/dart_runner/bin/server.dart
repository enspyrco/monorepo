import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

typedef JsonMap = Map<String, Object?>;
typedef JsonList = List<Object?>;

const pckString =
    '0d1eec8d297df3dd1da292791d1f6cc71c7cf98e05e733217f7dac754dfceb93';

Future<Response> handler(Request request) async {
  try {
    String signature = request.headers['X-Signature-Ed25519']!;
    String timestamp = request.headers['X-Signature-Timestamp']!;
    String body = await request.readAsString();

    print('body:\n$body');
    print('signature:\n$signature');
    print('timestamp:\n$timestamp');

    var pck = PublicKey(hex.decode(pckString));
    var msg = utf8.encode(timestamp + body);
    var sig = hex.decode(signature);

    bool verified = verify(pck, msg as Uint8List, sig as Uint8List);
    if (verified) {
      // Server should ACK any valid PING
      var json = jsonDecode(body) as JsonMap;
      if (json['type'] == 1) return Response.ok('{"type": 1}');
      return Response.notFound('"type" key not found in body');
    } else {
      return Response(401);
    }
  } catch (e) {
    return Response.internalServerError();
  }
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at https://${server.address.host}:${server.port}');
  });
}
