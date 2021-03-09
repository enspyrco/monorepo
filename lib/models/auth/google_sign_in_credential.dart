import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_sign_in_credential.freezed.dart';
part 'google_sign_in_credential.g.dart';

@freezed
class GoogleSignInCredential with _$GoogleSignInCredential {
  factory GoogleSignInCredential({
    /// An OpenID Connect ID token that identifies the user.
    String? idToken,

    /// The OAuth2 access token to access Google services.
    String? accessToken,

    /// Server auth code used to access Google Login
    String? serverAuthCode,
  }) = _GoogleSignInCredential;

  factory GoogleSignInCredential.fromJson(Map<String, dynamic> json) =>
      _$GoogleSignInCredentialFromJson(json);
}
