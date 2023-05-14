import 'dart:io';

import 'package:gather_link_account_shelf/routes/gather.dart';
import 'package:gather_link_account_shelf/routes/github.dart';
import 'package:gather_link_account_shelf/services/locate.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final _router = Router()
  ..get('/gather/', gatherHandler)
  ..get('/github/', githubHandler);

const locator = Locate();

void main(List<String> args) async {
  locator.provideDefaultFirebaseAdmin();

  final ip = InternetAddress.anyIPv4;

  final handler =
      Pipeline().addHandler(_router); // addMiddleware(logRequests())

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(handler, ip, port);

  print('Server listening on port ${server.port}');
}
