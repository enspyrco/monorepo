import 'dart:convert';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

/// All of the user connections are kept by the [ClientConnectionsService] object,
/// which keeps a map of [WebSocketChannel]s to userIds.
///
/// When a user connection is added or removed the [OtherPlayerIds] is broadcast.
class ClientConnectionsService {
  // We can constructor inject the message handler function used by shelf_web_socket
  ClientConnectionsService([Function(WebSocketChannel)? messageHandler]) {
    _messageHandler = messageHandler ?? defaultMessageHandler;
  }

  final presenceMap = <WebSocketChannel, String>{};

  // We keep the handler function as a member so that different handlers can
  // be constructor injected.
  late final Function(WebSocketChannel) _messageHandler;

  // The default function that [_messageHandler] is set to.
  void defaultMessageHandler(WebSocketChannel webSocket) {
    // Now attach a listener to the websocket that will perform the ongoing logic
    webSocket.stream.listen(
      (jsonString) {
        final jsonData = jsonDecode(jsonString);
        // If a user is announcing their presence, store the webSocket against the
        // userId and broadcast the current connections
        if (jsonData['type'] == PresentMessage.jsonType) {
          print(
              'server received: $jsonString \nAdding user & broadcasting other player list');
          _addAndBroadcast(webSocket, jsonData['userId'] as String);
        } else if (jsonData['type'] == OtherPlayerIdsMessage.jsonType) {
          print('server received: $jsonString, broadcasting other player ids');
          _broadcastOtherPlayerIds();
        } else if (jsonData['type'] == PlayerPathMessage.jsonType) {
          print('server received: $jsonString, broadcasting');
          _broadcastPlayerPath(jsonData);
        } else {
          throw Exception('Unknown json type in websocket stream: $jsonData');
        }
      },
      onError: (error) {
        print(error);
        webSocket.sink.add('$error');
      },
      onDone: () {
        _removeAndBroadcast(webSocket);
      },
    );
  }

  Function(WebSocketChannel) get messageHandler => _messageHandler;

  void _addAndBroadcast(WebSocketChannel ws, String userId) {
    presenceMap[ws] = userId;
    _broadcastOtherPlayerIds();
  }

  void _removeAndBroadcast(WebSocketChannel ws) {
    presenceMap.remove(ws);
    _broadcastOtherPlayerIds();
  }

  void _broadcastOtherPlayerIds() {
    for (final ws in presenceMap.keys) {
      // make the "other players" list for this player and send
      var otherIdsList = presenceMap.values.toISet().remove(presenceMap[ws]!);
      final message =
          jsonEncode(OtherPlayerIdsMessage(ids: otherIdsList).toJson());
      ws.sink.add(message);
    }
  }

  void _broadcastPlayerPath(JsonMap jsonData) {
    var message = PlayerPathMessage.fromJson(jsonData);
    for (final ws in presenceMap.keys) {
      if (presenceMap[ws]! != message.userId) {
        ws.sink.add(jsonEncode(message.toJson()));
      }
    }
  }

  void _broadcast(String message) {
    for (final ws in presenceMap.keys) {
      ws.sink.add(message);
    }
  }
}
