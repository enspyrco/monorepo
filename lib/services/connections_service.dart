import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

/// All of the user connections are kept by the [ConnectionsService] object,
/// which keeps a map of [WebSocketChannel]s to userIds.
///
/// When a user connection is added or removed the [PresentList] is broadcast.
class ConnectionsService {
  ConnectionsService();
  final presenceMap = <WebSocketChannel, String>{};

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
        jsonEncode(PresentList(ids: presenceMap.values.toList()).toJson());
    broadcast(presentListMessage);
  }

  void broadcast(String message) {
    for (final ws in presenceMap.keys) {
      ws.sink.add(message);
    }
  }
}
