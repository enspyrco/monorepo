import 'package:firestore_api_client/firestore_api_client.dart';
import 'package:googleapis_auth/auth_io.dart';

void main(List<String> arguments) async {
  final httpClient = await clientViaApplicationDefaultCredentials(scopes: []);

  final apiClient = GoogleapisFirestoreService(
      client: httpClient,
      rootUrl: 'http://localhost:8081/',
      projectId: 'demo-project');

  var docId =
      await apiClient.createDocument(at: 'users', from: {'nonce': 'abcd'});
  print('Created doc with id: $docId');

  // var docs = await apiClient.getDocuments(at: 'at', where: 'a', isEqualTo: 'b');
  // docs.forEach(print);

  var docs = await apiClient.getDocuments(
      at: 'users', where: 'nonce', isEqualTo: 'abcd');

  if (docs.length != 1) {
    throw 'There should be 1 document with the provided nonce but there were ${docs.length}';
  }

  var doc = docs.first;
  var uid = doc.id;
  var fields = doc.fields;
  fields['gather'] = 'gatherId';
  fields.remove('nonce');

  apiClient.setDocument(at: 'users/$uid', to: fields);

  httpClient.close();
}
