import 'package:shelf/shelf.dart' show Request, Response;

import '../services/locate.dart';

// https://gather-link-account-shelf-eogj3aa7na-uc.a.run.app/github/?code=a3ba08bbee674a21a85b&state=lvr_W0cxHHezXKDDhMnT7zbGTGVmGtoTjiB_-OYVNAU%3D

Future<Response> githubHandler(Request request) async {
  final firestore = Locate.firestore;
  String? nonce, code, githubId;

  try {
    nonce = request.url.queryParameters['state']!;
    code = request.url.queryParameters['code']!;

    var docs = await firestore.getDocuments(
        at: 'users', where: 'githubnonce', isEqualTo: nonce);

    if (docs.length != 1) {
      throw '${docs.length} docs were found with the passed nonce, there should be 1';
    }

    // TODO: Exchange the code & secret for a token
    // TODO: Use the github API to get the username

    githubId = 'github id';

    var doc = docs.first;
    var uid = doc.id;
    var fields = doc.fields;
    fields['github'] = githubId;
    fields.remove('githubnonce');

    await firestore.setDocument(at: 'users/$uid', to: fields);

    return Response.ok('GitHub account successfully linked!\n\n'
        'You can close this window and return to the original window.');
  } catch (error, trace) {
    firestore.createDocument(at: 'errors', from: {
      'nonce': nonce,
      'githubId': githubId,
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
