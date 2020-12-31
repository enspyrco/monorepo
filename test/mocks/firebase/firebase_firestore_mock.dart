import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';

class FirebaseFirestoreMock extends Mock implements FirebaseFirestore {
  @override
  bool operator ==(dynamic o) =>
      o is FirebaseFirestore && o.app.name == app.name;
}
