import 'package:shelf/shelf.dart' show Response, Request;

Future<Response> gatherHandler(Request request) async {
  String? nonce, gatherId;

  try {
    nonce = request.url.queryParameters['nonce']!;
    gatherId = request.url.queryParameters['gatherPlayerId']!;

    // TODO: Mint token with Firebase Admin SDK & send to client
    final String token = '...';

    return Response.movedPermanently(
        'https://gather-identity-link.web.app/gather?token=$token');
  } catch (error, trace) {
    return Response.internalServerError(
        body: 'error:\n$error\n\ntrace:\n$trace');
  } finally {
    // Locate.client.close();
  }
}
