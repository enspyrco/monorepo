import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../constants/auth_provider_names.dart';
import '../models/id_token_result.dart';

extension IdTokenResultExtension on firebase.IdTokenResult {
  IdTokenResult toModel() => IdTokenResult(
      authTime: authTime,
      claims: claims,
      expirationTime: expirationTime,
      issuedAtTime: issuedAtTime,
      signInProvider: authProviderEnumFrom[signInProvider],
      token: token);
}
