import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:run_dart_code_in_pubsub_message/evaluate.dart';
import 'package:run_dart_code_in_pubsub_message/exceptions/invalid_message_exception.dart';
import 'package:run_dart_code_in_pubsub_message/exceptions/malformed_json_exception.dart';
import 'package:run_dart_code_in_pubsub_message/interaction_data.dart';
import 'package:run_dart_code_in_pubsub_message/typedefs.dart';
import 'package:run_dart_code_in_pubsub_message/utils/json_utils.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<Response> handler(Request request) async {
  try {
    final String bodyString = await request.readAsString();
    final JsonMap bodyJson = jsonDecode(bodyString);
    print('body:\n$bodyJson');

    final JsonMap messageJson = bodyJson['message'] as JsonMap? ??
        (throw MalformedJsonException(
            'The "message" key was not found at the top level', bodyJson));

    final String encodedMessageData = messageJson['data'] as String? ??
        (throw MalformedJsonException(
            '"data" key was not found in "message" object', bodyJson));

    final JsonMap decodedMessageJson =
        json.decode(utf8.decode(base64.decode(encodedMessageData))) as JsonMap;
    print('decodedMessageJson: $decodedMessageJson');

    final InteractionData interactionData =
        extractMessageCommandInfo(decodedMessageJson);

    print(interactionData);

    // construct the uri we will use to update the Discord response
    var uri = Uri.parse(
        "https://discord.com/api/v8/webhooks/${interactionData.applicationId}/${interactionData.token}/messages/@original");

    // check that message content is formatted Dart code
    final List<String> contentLines = interactionData.content.split('\n');
    if (contentLines.first != '```Dart' || contentLines.last != '```') {
      var response = await http.patch(uri, body: {
        'content': 'The message should contain only formatted Dart code.'
      });
      print(response);
      return Response.ok('...');
    }

    contentLines.removeLast();
    contentLines.removeAt(0);

    String result = await evaluate(contentLines);
    print('result:\n$result');

    // Make a http call to edit the interaction response
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
