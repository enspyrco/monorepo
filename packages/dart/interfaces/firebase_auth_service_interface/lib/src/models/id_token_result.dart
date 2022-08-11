/// Copied from: firebase_auth_platform_interface-6.5.2/lib/src/id_token_result.dart
/// TODO: Review if this class also works for FirebaseAuthServiceRest

/// Interface representing ID token result obtained from [getIdTokenResult].
/// It contains the ID token JWT string and other helper properties for getting
/// different data associated with the token as well as all the decoded payload
/// claims.
///
/// Note that these claims are not to be trusted as they are parsed client side.
/// Only server side verification can guarantee the integrity of the token
/// claims.
class IdTokenResult {
  IdTokenResult(this._data);

  final Map<String, dynamic> _data;

  /// The authentication time formatted as UTC string. This is the time the user
  /// authenticated (signed in) and not the time the token was refreshed.
  DateTime? get authTime => _data['authTimestamp'] == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(_data['authTimestamp']);

  /// The entire payload claims of the ID token including the standard reserved
  /// claims as well as the custom claims.
  Map<String, dynamic>? get claims => _data['claims'] == null
      ? null
      : Map<String, dynamic>.from(_data['claims']);

  /// The time when the ID token expires.
  DateTime? get expirationTime => _data['expirationTimestamp'] == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(_data['expirationTimestamp']);

  /// The time when ID token was issued.
  DateTime? get issuedAtTime => _data['issuedAtTimestamp'] == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(_data['issuedAtTimestamp']);

  /// The sign-in provider through which the ID token was obtained (anonymous,
  /// custom, phone, password, etc). Note, this does not map to provider IDs.
  String? get signInProvider => _data['signInProvider'];

  /// The Firebase Auth ID token JWT string.
  String? get token => _data['token'];

  @override
  String toString() {
    return '$IdTokenResult(authTime: $authTime, claims: ${claims.toString()}, expirationTime: $expirationTime, issuedAtTime: $issuedAtTime, signInProvider: $signInProvider, token: $token)';
  }
}
