import 'package:firebase_core/firebase_core.dart';

import 'auth_options.dart';

class RedFireConfig {
  const RedFireConfig({
    required FirebaseOptions firebase,
    required AuthOptions auth,
  })  : _firebase = firebase,
        _auth = auth;

  final FirebaseOptions _firebase;
  final AuthOptions _auth;

  FirebaseOptions get firebase => _firebase;
  AuthOptions get auth => _auth;
}
