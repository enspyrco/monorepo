import 'dart:async';

import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_game_server/services/connections_service.dart';
import 'package:web_socket_game_server/services/locator.dart';

@CloudFunction()
FutureOr<Response> function(Request request) async {
  // If there is no connections service already provided, create and provide one.
  Locator.provideConnectionsService(ConnectionsService(), overwrite: false);

  final connectionsService = Locator.getConnectionsService();

  return webSocketHandler(connectionsService.messageHandler)(request);
}
