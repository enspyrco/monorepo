import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:the_process/services/database_service.dart';

import '../../../mocks/firebase/firebase_test_doubles.mocks.dart';

void main() {
  group('DatabaseService', () {
    test('.createSection calls firestore doc() with uid', () {
      final firestoreMock = MockFirebaseFirestore();
      final service = DatabaseService(database: firestoreMock);

      service.createSection(uid: 'uid', name: 'testy');

      verify(firestoreMock.doc('new/uid'));
    });
  });
}
