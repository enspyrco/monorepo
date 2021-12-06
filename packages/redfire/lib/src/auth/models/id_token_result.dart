import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'id_token_result.freezed.dart';
part 'id_token_result.g.dart';

// A model of FlutterFire's IdTokenResult:
// https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_auth/firebase_auth_platform_interface/lib/src/id_token_result.dart
@freezed
class IdTokenResult with _$IdTokenResult, ReduxState {
  static const String className = 'IdTokenResult';

  const IdTokenResult._();
  factory IdTokenResult({
    /// The authentication time formatted as UTC string. This is the time the user
    /// authenticated (signed in) and not the time the token was refreshed.
    DateTime? authTime,

    /// The entire payload claims of the ID token including the standard reserved
    /// claims as well as the custom claims.
    Map<String, dynamic>? claims,

    /// The time when the ID token expires.
    DateTime? expirationTime,

    /// The time when ID token was issued.
    DateTime? issuedAtTime,

    /// The sign-in provider through which the ID token was obtained (anonymous,
    /// custom, phone, password, etc), converted to [ProvidersEnum].
    ProvidersEnum? signInProvider,

    /// The Firebase Auth ID token JWT string.
    String? token,
  }) = _IdTokenResult;

  factory IdTokenResult.fromJson(JsonMap json) => _$IdTokenResultFromJson(json);

  @override
  String get typeName => className;
}
