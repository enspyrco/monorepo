import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:run_dart_code_in_pubsub_message/evaluate.dart';
import 'package:run_dart_code_in_pubsub_message/typedefs.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<Response> handler(Request request) async {
  try {
    var body = await request.readAsString();
    var decodedBodyJson = jsonDecode(body);
    print('body:\n$decodedBodyJson');

    var messageJson = decodedBodyJson['message'];
    var encodedMessageData = messageJson['data'];
    final decodedMessageJson =
        json.decode(utf8.decode(base64.decode(encodedMessageData))) as JsonMap;
    print('decodedMessageJson: $decodedMessageJson');

    // Get required values from the pubsub message
    var expression = decodedMessageJson['value'] as String;
    var applicationId = decodedMessageJson['application_id'] as String;
    var token = decodedMessageJson['token'] as String;

    String result = await evaluate(expression);
    print('result:\n$result');

    // Make a http call to edit the interaction response
    var uri = Uri.parse(
        "https://discord.com/api/v8/webhooks/$applicationId/$token/messages/@original");
    var response = await http.patch(uri, body: {'content': result});

    print('response:\n${response.body}');

    return Response.ok('...');
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
