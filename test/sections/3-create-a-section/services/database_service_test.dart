import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:the_process/services/database_service.dart';

import '../../../mocks/plugins/mock_firebase_firestore.dart';

void main() {
  group('DatabaseService', () {
    test('.createSection calls firestore doc() with uid', () {
      final mockFirestore = MockFirebaseFirestore();
      final service = DatabaseService(mockFirestore);

      service.createSection(uid: 'uid', name: 'testy');

      verify(mockFirestore.doc('new/uid'));
    });
  });
}
