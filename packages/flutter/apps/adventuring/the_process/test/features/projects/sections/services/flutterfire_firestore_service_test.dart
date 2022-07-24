import 'package:mockito/mockito.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('FlutterfireFirestoreService', () {
    test('createSection function calls firestore collection() with uid', () {
      final firestoreMock = MockFirebaseFirestore();
      final mockColRef = MockCollectionReference<JsonMap>();
      final mockDocRef = MockDocumentReference<JsonMap>();
      when(firestoreMock.collection(any)).thenReturn(mockColRef);
      when(mockColRef.add(any)).thenAnswer((_) => Future.value(mockDocRef));
      when(mockDocRef.id).thenReturn('id');
      RedFireLocator.provide(
          firestoreService:
              FirestoreServiceFlutterfire(firestore: firestoreMock));
      final service = RedFireLocator.getFirestoreService();

      service
          .createDocument(at: 'new/uid', from: {'uid': 'uid', 'name': 'testy'});

      verify(firestoreMock.collection('new/uid'));
    });
  });
}
