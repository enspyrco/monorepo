import 'dart:convert';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

/// All of the user connections are kept by the [ConnectionsService] object,
/// which keeps a map of [WebSocketChannel]s to userIds.
///
/// When a user connection is added or removed the [PresentList] is broadcast.
class ConnectionsService {
  // We can constructor inject the message handler function used by shelf_web_socket
  ConnectionsService([Function(WebSocketChannel)? messageHandler]) {
    _messageHandler = messageHandler ?? defaultMessageHandler;
  }

  final presenceMap = <WebSocketChannel, String>{};

  // We keep the handler function as a member so that different handlers can
  // be constructor injected.
  late final Function(WebSocketChannel) _messageHandler;
  void defaultMessageHandler(WebSocketChannel webSocket) {
    // Now attach a listener to the websocket that will perform the ongoing logic
    webSocket.stream.listen(
      (message) {
        final jsonData = jsonDecode(message);
        // If a user is announcing their presence, store the webSocket against the
        // userId and broadcast the current connections
        if (jsonData['type'] == 'announce_presence') {
          print(
              'server received: $message \nAdding user & broadcasting present list');
          addAndBroadcast(webSocket, jsonData['userId'] as String);
        } else {
          print('server received: $message, broadcasting');
          broadcast('$message');
        }
      },
      onError: (error) {
        print(error);
        webSocket.sink.add('$error');
      },
      onDone: () {
        removeAndBroadcast(webSocket);
      },
    );
  }

  Function(WebSocketChannel) get messageHandler => _messageHandler;

  void addAndBroadcast(WebSocketChannel ws, String userId) {
    presenceMap[ws] = userId;
    _broadcastPresentList();
  }

  void removeAndBroadcast(WebSocketChannel ws) {
    presenceMap.remove(ws);
    _broadcastPresentList();
  }

  void _broadcastPresentList() {
    final presentListMessage =
        jsonEncode(PresentSet(ids: presenceMap.values.toISet()).toJson());
    broadcast(presentListMessage);
  }

  void broadcast(String message) {
    for (final ws in presenceMap.keys) {
      ws.sink.add(message);
    }
  }
}
