import 'package:shelf/shelf.dart' show Response, Request;

import '../services/locate.dart';

Future<Response> gatherHandler(Request request) async {
  String? nonce, gatherId;

  try {
    nonce = request.url.queryParameters['nonce']!;
    gatherId = request.url.queryParameters['gatherPlayerId']!;

    final firebaseAdmin = Locate.firebaseAdmin;

    final String token = await firebaseAdmin
        .mintToken(uid: gatherId, developerClaims: {'gather-nonce': nonce});

    return Response.movedPermanently(
        'https://gather-identity-link.web.app/gather?token=$token');
  } catch (error, trace) {
    return Response.internalServerError(
        body: 'error:\n$error\n\ntrace:\n$trace');
  } finally {
    // Locate.client.close();
  }
}
