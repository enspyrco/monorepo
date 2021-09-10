import 'dart:convert';

import 'package:test/test.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

void main() {
  test('connects', () async {
    var webSocket = WebSocketChannel.connect(Uri.parse('ws://localhost:8080'));
    webSocket.sink.add(jsonEncode(AnnouncePresence('userId').toJson()));
  });
}
