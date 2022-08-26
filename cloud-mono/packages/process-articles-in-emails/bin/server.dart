import 'dart:convert';

import 'package:firestore_service_googleapis/firestore_service_googleapis.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:json_types/json_types.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<Response> handler(Request request) async {
  try {
    // Decode the JSON into a push message.
    final body = await request.readAsString();

    print(body);

    // Use a client that authenticates as the default service account
    final client = await clientViaApplicationDefaultCredentials(scopes: []);
    final firestoreService = FirestoreServiceGoogleapis(
        client: client, projectId: 'the-adventuverse');

    try {
      var json = jsonDecode(body) as JsonMap;
      var doc = await firestoreService.setDocument(at: 'emails', to: json);
      print('saved: ${doc.path}');
    } catch (e) {
      firestoreService.setDocument(at: 'email-errors', to: {'error': '$e'});
    } finally {
      client.close();
    }

    // var pushMessage = PushEvent.fromJson(body);
    // print(pushMessage.message.asString);

  } catch (e) {
    print(e);
  }
  // The subscription requires a 200 response
  return Response.ok('Success.');
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print(
        'Started server, listening on https://${server.address.host}:${server.port}');
  });
}
