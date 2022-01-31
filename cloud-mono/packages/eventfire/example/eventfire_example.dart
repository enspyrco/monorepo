import 'package:eventfire/eventfire.dart';

void main() {
  var service = FirestoreService(projectId: 'mock-project');
  print(service.toString());
}
