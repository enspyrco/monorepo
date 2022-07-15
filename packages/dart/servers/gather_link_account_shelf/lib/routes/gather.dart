import 'package:shelf/shelf.dart' show Response, Request;

import '../services/locate.dart';

Future<Response> gatherHandler(Request request) async {
  final firestore = Locate.firestore;
  String? nonce, gatherId;

  try {
    nonce = request.url.queryParameters['nonce']!;
    gatherId = request.url.queryParameters['gatherPlayerId']!;

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

    await firestore.setDocument(at: 'users/$uid', to: fields);

    return Response.ok('''
      <head>
      </head>
      <body>
        <div>Credentials saved!\n\nIf this window didn't automatically close, please close it.</div>
      </body>
      <script>
        window.close();
      </script>
    ''');
  } catch (error, trace) {
    firestore.createDocument(at: 'errors', from: {
      'nonce': nonce,
      'gatherId': gatherId,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'error': error.toString(),
      'trace': trace.toString()
    });

    return Response.internalServerError(
        body: 'error:\n$error\n\ntrace:\n$trace');
  } finally {
    // Locate.client.close();
  }
}
