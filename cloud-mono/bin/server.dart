import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<Response> handler(Request request) async {
  var body = await request.readAsString();

  var bodyBytes = utf8.encode(body);
  var key = utf8.encode(
      Platform.environment['WEBHOOK_SECRET']!); // secret from secret manager
  var digest = Hmac(sha256, key).convert(bodyBytes);

  var signature = 'sha256=$digest';
  if (signature != request.headers['X-Hub-Signature-256']) {
    throw 'Signature mismatch.';
  }

  // for now while we debug
  print(body);

  var json = jsonEncode(body);
  print(json);

  // we want:
  // userId, repoName, challengeNumber, prNumber, repoToken

  return Response.ok('Diddley dunarooni.');
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at https://${server.address.host}:${server.port}');
  });
}
