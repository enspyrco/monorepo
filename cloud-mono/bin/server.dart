import 'dart:convert';
import 'dart:io';

import 'package:coding_challenge_verifier/extensions/json_map_extensions.dart';
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

  // Use a client that authenticates as the default service account to make
  // a service that accesses the Firestore.
  final client = await clientViaApplicationDefaultCredentials(scopes: []);
  final firestoreService =
      FirestoreService(client: client, projectId: 'tech-world-project');

  var json = jsonDecode(body) as JsonMap;

  try {
    // document id is used to reference the event in other docs
    var doc = await firestoreService.setDocument(at: 'github-events', to: json);

    if (json.isFromACompletedJobEvent) {
      var sender = json['sender'] as JsonMap;
      var job = json['workflow_job'] as JsonMap;
      var repo = json['repository'] as JsonMap;

      firestoreService.setDocument(at: 'challenge-results', to: {
        'eventId': doc.name,
        'challengeId': repo['full_name'],
        'userId': sender['login'],
        'result': job['conclusion'],
        'time': DateTime.now().millisecondsSinceEpoch
      });
    }
  } catch (e) {
    firestoreService.setDocument(at: 'github-events', to: json..['error'] = e);
  } finally {
    client.close();
  }

  // final httpService = HttpService();
  // final sourceContents = await httpService.retrieveContents();

  return Response.ok('Diddley dunarooni.');
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at https://${server.address.host}:${server.port}');
  });
}
