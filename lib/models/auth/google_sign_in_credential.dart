library google_sign_in_credential;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/serializers.dart';

part 'google_sign_in_credential.g.dart';

/// A BuiltValue version of google_sign_in/GoogleSignInAuthentication
///
/// Holds authentication tokens after sign in.
abstract class GoogleSignInCredential
    implements Built<GoogleSignInCredential, GoogleSignInCredentialBuilder> {
  /// An OpenID Connect ID token that identifies the user.
  String? get idToken;

  /// The OAuth2 access token to access Google services.
  String? get accessToken;

  /// Server auth code used to access Google Login
  String? get serverAuthCode;

  GoogleSignInCredential._();

  factory GoogleSignInCredential(
      {String? idToken,
      String? accessToken,
      String? serverAuthCode}) = _$GoogleSignInCredential._;

  factory GoogleSignInCredential.by(
          [void Function(GoogleSignInCredentialBuilder) updates]) =
      _$GoogleSignInCredential;

  Object toJson() =>
      serializers.serializeWith(GoogleSignInCredential.serializer, this);

  // static GoogleSignInCredential fromJson(String jsonString) =>
  //     serializers.deserializeWith(
  //         GoogleSignInCredential.serializer, json.decode(jsonString));

  static Serializer<GoogleSignInCredential> get serializer =>
      _$googleSignInCredentialSerializer;
}
