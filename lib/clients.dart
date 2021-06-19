import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

class Clients {
  Clients();
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
