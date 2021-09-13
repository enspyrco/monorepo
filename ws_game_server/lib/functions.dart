import 'dart:async';

import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:ws_game_server/services/locator.dart';

@CloudFunction()
FutureOr<Response> function(Request request) async {
  // If there is no client connections service already provided, provide the default.
  final clientConnectionsService =
      Locator.provideDefaultClientConnectionsService();

  return webSocketHandler(clientConnectionsService.messageHandler)(request);
}
