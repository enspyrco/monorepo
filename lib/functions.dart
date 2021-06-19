import 'dart:async';
import 'dart:convert';

import 'package:functions_framework/functions_framework.dart';
import 'package:googleapis/firestore/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_game_server/clients.dart';

FirestoreApi? globalFirestore;
// final process = <String, Function(Map<String, Object?>)>{'present': (json) => };
final clients = Clients();

/// Assumptions
/// -
final handler = webSocketHandler((WebSocketChannel webSocket) {
  // Now attach a listener to the websocket that will perform the ongoing logic
  webSocket.stream.listen(
    (message) {
      final jsonData = jsonDecode(message);
      // If a user is announcing their presence, store the webSocket against the
      // userId and broadcast the current connections
      if (jsonData['type'] == 'announce_presence') {
        clients.addAndBroadcast(webSocket, jsonData['userId'] as String);
      } else {
        clients.broadcast('$message');
      }
    },
    onError: (error) {
      print(error);
      webSocket.sink.add('$error');
    },
    onDone: () {
      clients.removeAndBroadcast(webSocket);
    },
  );
});

@CloudFunction()
FutureOr<Response> function(Request request) async {
  // Create the Firestore API client if not already created.
  globalFirestore ??=
      FirestoreApi(await clientViaApplicationDefaultCredentials(scopes: []));

  return handler(request);
}
