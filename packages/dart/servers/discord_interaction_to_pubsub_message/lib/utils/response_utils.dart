import 'dart:convert';

import 'package:shelf/shelf.dart';

Response respondWith(String result) {
  return Response.ok(
      jsonEncode({
        'type': 4,
        'data': {
          'tts': false,
          'content': result,
          'embeds': [],
          'allowed_mentions': {'parse': []}
        }
      }),
      headers: {'Content-type': 'application/json'});
}

Response respondWait() {
  return Response.ok(jsonEncode({'type': 5}),
      headers: {'Content-type': 'application/json'});
}

Response ackResponse() => Response.ok(jsonEncode({'type': 1}),
    headers: {'Content-type': 'application/json'});
