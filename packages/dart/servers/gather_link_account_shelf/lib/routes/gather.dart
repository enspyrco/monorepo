import 'package:shelf/shelf.dart' show Response, Request;

import '../services/locate.dart';

Future<Response> gatherHandler(Request request) async {
  var nonce = request.url.queryParameters['nonce'];
  var gatherId = request.url.queryParameters['playerId'];
  final firestore = Locate.firestore;

  try {
    var docs = await firestore.getDocuments(
        at: 'users', where: 'nonce', isEqualTo: nonce);

    if (docs.length != 1) {
      throw 'There should be 1 document with the provided nonce but there were ${docs.length}';
    }

    var doc = docs.first;
    doc['name'];
  } catch (e) {
    firestore.createDocument(at: 'errors', from: {
      'uid': ,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'error': e
    });
  } finally {
    client.close();
  }

  return Response.ok('playerId: $playerId, nonce: $nonce');
}
