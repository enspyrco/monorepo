import 'dart:async';

import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:web_socket_game_server/services/connections_service.dart';
import 'package:web_socket_game_server/services/locator.dart';

import 'connection_handler.dart';

@CloudFunction()
FutureOr<Response> function(Request request) async {
  if (Locator.hasNoConnectionsService) {
    Locator.provide(connectionsService: ConnectionsService());
  }
  return connectionHandler(request);
}
