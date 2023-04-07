import 'dart:convert';
import 'dart:io';

import 'package:discord_interaction_to_pubsub_message/typedefs.dart';
import 'package:discord_interaction_to_pubsub_message/utils/logging_utils.dart';
import 'package:discord_interaction_to_pubsub_message/utils/response_utils.dart';
import 'package:discord_interaction_to_pubsub_message/verify_signature.dart';
import 'package:gcloud/pubsub.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<Response> handler(Request request) async {
  try {
    final String bodyString = await request.readAsString();

    printRequestInfo(request, bodyString);

    if (validSignature(bodyString, request.headers)) {
      final JsonMap bodyJson = jsonDecode(bodyString) as JsonMap;
      print('decoded json:\n$bodyJson');

      if (bodyJson['type'] == 1) return ackResponse(); // ACK any valid PING

      final AutoRefreshingAuthClient client =
          await clientViaApplicationDefaultCredentials(
        scopes: [...PubSub.SCOPES],
      );

      final PubSub pubsub =
          PubSub(client, Platform.environment['PROJECT_NAME']!);

      final Topic topic = await pubsub.lookupTopic('dart-code-strings');

      // We currently just re-encode the bodyJson
      // TODO: just use bodyString but add a test that it is the same as encooding and re-encoding
      await topic.publishString(jsonEncode(bodyJson));

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
