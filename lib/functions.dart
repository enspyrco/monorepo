import 'dart:async';

import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';

final handler = webSocketHandler((webSocket) =>
    webSocket.stream.listen((message) => webSocket.sink.add('$message')));

@CloudFunction()
FutureOr<Response> function(Request request) async => handler(request);
