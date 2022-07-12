import 'package:firestore_api_client/firestore_api_client.dart';
import 'package:googleapis_auth/auth_io.dart';

void main(List<String> arguments) async {
  final httpClient = await clientViaApplicationDefaultCredentials(scopes: []);

  final apiClient = GoogleapisFirestoreService(
      client: httpClient,
      rootUrl: 'http://localhost:8081/',
      projectId: 'demo-project');

  var docId = await apiClient.createDocument(at: 'at', from: {'a': 'b'});
  print(docId);

  var docs = await apiClient.getDocuments(at: 'at', where: 'a', isEqualTo: 'a');
  docs.forEach(print);

  httpClient.close();
}
