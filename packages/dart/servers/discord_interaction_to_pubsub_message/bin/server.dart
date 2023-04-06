import 'dart:convert';
import 'dart:io';

import 'package:discord_interaction_to_pubsub_message/typedefs.dart';
import 'package:discord_interaction_to_pubsub_message/utils/json_utils.dart';
import 'package:discord_interaction_to_pubsub_message/utils/logging_utils.dart';
import 'package:discord_interaction_to_pubsub_message/utils/response_utils.dart';
import 'package:discord_interaction_to_pubsub_message/verify_signature.dart';
import 'package:gcloud/pubsub.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<Response> handler(Request request) async {
  try {
    final String body = await request.readAsString();

    printRequestInfo(request, body);

    if (validSignature(body, request.headers)) {
      final JsonMap json = jsonDecode(body) as JsonMap;
      print('decoded json:\n$json');

      if (json['type'] == 1) return ackResponse(); // ACK any valid PING

      final JsonMap extractedInfo = extractMessageCommandInfo(json);

      final AutoRefreshingAuthClient client =
          await clientViaApplicationDefaultCredentials(
        scopes: [...PubSub.SCOPES],
      );

      final PubSub pubsub =
          PubSub(client, Platform.environment['PROJECT_NAME']!);

      final Topic topic = await pubsub.lookupTopic('dart-code-strings');

      await topic.publishString(jsonEncode(extractedInfo));

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
