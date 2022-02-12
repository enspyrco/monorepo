import 'dart:convert';

import 'package:dart_runner/evaluate.dart';
import 'package:dart_runner/typedefs.dart';
import 'package:dart_runner/utils/json_utils.dart';
import 'package:dart_runner/utils/logging_utils.dart';
import 'package:dart_runner/utils/response_utils.dart';
import 'package:dart_runner/verify_signature.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<Response> handler(Request request) async {
  try {
    String body = await request.readAsString();

    printRequestInfo(request, body);

    if (validSignature(body, request.headers)) {
      var json = jsonDecode(body) as JsonMap;
      print('decoded json:\n$json');

      // Server should ACK any valid PING
      if (json['type'] == 1) return ackResponse();

      var expression = extractValue(json);
      String result = await evaluate(expression);

      print('Result:\n$result');

      return respondWait();
    } else {
      return Response(401);
    }
  } catch (e, s) {
    print('Exception:\n$e\n\nTrace:\n$s');
    return Response.internalServerError();
  }
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at https://${server.address.host}:${server.port}');
  });
}
