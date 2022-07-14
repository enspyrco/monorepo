import 'package:shelf/shelf.dart' show Response, Request;

import '../services/locate.dart';

Future<Response> gatherHandler(Request request) async {
  var nonce = request.url.queryParameters['nonce'];
  var gatherId = request.url.queryParameters['gatherPlayerId'];
  final firestore = Locate.firestore;

  try {
    var docs = await firestore.getDocuments(
        at: 'users', where: 'gathernonce', isEqualTo: nonce);

    if (docs.length != 1) {
      throw 'There should be 1 document with the provided nonce but there were ${docs.length}';
    }

    var doc = docs.first;
    var uid = doc.id;
    var fields = doc.fields;
    fields['gather'] = gatherId;
    fields.remove('gathernonce');

    firestore.setDocument(at: 'users/$uid', to: fields);
  } catch (error, trace) {
    firestore.createDocument(at: 'errors', from: {
      'nonce': nonce,
      'gatherId': gatherId,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'error': error.toString(),
      'trace': trace.toString()
    });
  } finally {
    // Locate.client.close();
  }

  return Response.ok('gatherId: $gatherId');
}
