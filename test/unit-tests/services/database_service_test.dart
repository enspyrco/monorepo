import 'package:mockito/mockito.dart';
import 'package:redfire/src/database/services/database_service.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('DatabaseService', () {
    test('.createSection calls firestore doc() with uid', () {
      final mockFirestore = MockFirebaseFirestore();
      final service = DatabaseService(database: mockFirestore);

      service.createDocument(at: '', json: {'uid': 'uid', 'name': 'testy'});

      verify(mockFirestore.doc('new/uid'));
    });
  });
}
