import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<Response> handler(Request request) async {
  // Decode the JSON into a push message.
  final body = await request.readAsString();

  print(body);
  // var pushMessage = PushEvent.fromJson(body);
  // print(pushMessage.message.asString);

  // The subscription requires a 200 response
  return Response.ok('Success.');
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at https://${server.address.host}:${server.port}');
  });
}
