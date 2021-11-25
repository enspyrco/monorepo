import 'dart:convert';
import 'dart:io';

import 'package:coding_challenge_verifier/services/auth_service.dart';
import 'package:coding_challenge_verifier/services/firestore_service.dart';
import 'package:coding_challenge_verifier/utils/type_utils.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<Response> handler(Request request) async {
  AuthService authService = AuthService();

  // Validate the request - if signatures don't match exception is thrown.
  var key = Platform.environment['WEBHOOK_SECRET']!; // from secret manager
  var body = await request.readAsString();
  var signature = request.headers['X-Hub-Signature-256'];
  await authService.verifySender(signature, body, key);

  // we want: userId, repoName, challengeNumber, prNumber, repoToken

  // Create a client that will authenticate as the default service account.
  final client = await clientViaApplicationDefaultCredentials(scopes: []);

  final firestoreService =
      FirestoreService(client, projectId: 'tech-world-project');

  var json = jsonDecode(body) as JsonMap;
  firestoreService.setDocument(at: 'github-events', to: json);
  // final httpService = HttpService();
  // final sourceContents = await httpService.retrieveContents();

  client.close();

  return Response.ok('Diddley dunarooni.');
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at https://${server.address.host}:${server.port}');
  });
}
