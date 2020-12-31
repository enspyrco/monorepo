import 'package:firebase_core/firebase_core.dart';
import 'package:mockito/mockito.dart';

class FirebaseAppMock extends Mock implements FirebaseApp {
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! FirebaseApp) return false;
    return other.name == name && other.options == options;
  }
}
