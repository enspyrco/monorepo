import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:test/test.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:ws_game_server/services/locator.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

import 'test-doubles/test_doubles.mocks.dart';

// Useful test examples:
// https://github.com/dart-lang/shelf_web_socket/blob/master/test/web_socket_test.dart

void main() {
  test('connects', () async {
    var webSocket = WebSocketChannel.connect(Uri.parse('ws://localhost:8080'));
    webSocket.sink.add(jsonEncode(PresentMessage('userId').toJson()));
  });

  // TODO: test is not finished and so is skipped
  test('can communicate with a dart:io WebSocket client', () async {
    var mockService = MockClientConnectionsService();
    Locator.provide(service: mockService);
    var handler = webSocketHandler(mockService.messageHandler);

    final server = await shelf_io.serve(handler, 'localhost', 0);

    print('Serving at ws://${server.address.host}:${server.port}');

    try {
      final webSocket =
          await WebSocket.connect('ws://localhost:${server.port}');
      var n = 0;
      await webSocket.listen((message) {
        if (n == 0) {
          expect(message, equals('hello!'));
          webSocket.add('ping');
        } else if (n == 1) {
          expect(message, equals('pong'));
          webSocket.close();
          server.close();
        } else {
          fail('Only expected two messages.');
        }
        n++;
      }).asFuture();
    } finally {
      await server.close();
    }
  }, skip: true);
}
