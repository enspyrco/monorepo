import 'package:flireator/services/database/firestore_service.dart';
import 'package:test/test.dart';

import '../../mocks/firestore_mocks.dart';

void main() {
  group('Firestore Service', () {
    //
    setUp(() async {});

    test('emits null when no flireator is present', () async {
      final service = FirestoreService(FakeFirestore());

      final flireator = await service.retrieveFlireatorData('userId');

      expect(flireator, null);
    });
  });
}
