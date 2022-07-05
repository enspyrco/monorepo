import 'package:firestore_api_client/firestore_api_client.dart';

void main() {
  var service = FirestoreService(projectId: 'mock-project');
  print(service.toString());
}
