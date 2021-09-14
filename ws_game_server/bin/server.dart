import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:ws_game_server/services/locator.dart';

// For Google Cloud Run, set _hostname to '0.0.0.0'
const _hostname = '0.0.0.0';

void main() {
  // If there is no client connections service already provided, provide the default.
  final clientConnectionsService =
      Locator.provideDefaultClientConnectionsService();

  var handler = webSocketHandler(clientConnectionsService.messageHandler);

  shelf_io.serve(handler, _hostname, 8080).then((server) {
    print('Serving at ws://${server.address.host}:${server.port}');
  });
}
