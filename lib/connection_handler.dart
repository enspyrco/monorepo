import 'dart:convert';

import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_game_server/services/locator.dart';

/// Assumptions
/// -
final connectionHandler = webSocketHandler((WebSocketChannel webSocket) {
  final connections = Locator.getConnectionsService();
  // Now attach a listener to the websocket that will perform the ongoing logic
  webSocket.stream.listen(
    (message) {
      final jsonData = jsonDecode(message);
      // If a user is announcing their presence, store the webSocket against the
      // userId and broadcast the current connections
      if (jsonData['type'] == 'announce_presence') {
        connections.addAndBroadcast(webSocket, jsonData['userId'] as String);
      } else {
        connections.broadcast('$message');
      }
    },
    onError: (error) {
      print(error);
      webSocket.sink.add('$error');
    },
    onDone: () {
      connections.removeAndBroadcast(webSocket);
    },
  );
});
