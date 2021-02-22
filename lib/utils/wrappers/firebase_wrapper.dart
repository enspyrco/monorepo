import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

/// Wraps the [Firebase] static function so we can optionally inject a mock in
/// the [AppWidget].
class FirebaseWrapper {
  Future<FirebaseApp> init() async {
    final app = await Firebase.initializeApp();

    // TODO: remove workaround
    FirebaseFirestore.instance.settings = const Settings();

    return app;
  }
}
