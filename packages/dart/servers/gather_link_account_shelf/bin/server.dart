import 'dart:io';

import 'package:gather_link_account_shelf/routes/gather.dart';
import 'package:gather_link_account_shelf/routes/root.dart';
import 'package:gather_link_account_shelf/services/locate.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final _router = Router()
  ..get('/', rootHandler)
  ..get('/gather/', gatherHandler);

const locator = Locate();

void main(List<String> args) async {
  await locator.provideDefaultFirestore();

  final ip = InternetAddress.anyIPv4;

  final handler =
      Pipeline().addHandler(_router); // addMiddleware(logRequests())

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(handler, ip, port);

  print('Server listening on port ${server.port}');
}
