import 'package:shelf/shelf.dart' show Request, Response;

Response rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}
