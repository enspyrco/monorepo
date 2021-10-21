import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

Response handler(Request request) {
  print(request.headers);
  print(request.headers['Authorization']);

  return Response.ok('Diddley dunarooni.');
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at https://${server.address.host}:${server.port}');
  });
}
