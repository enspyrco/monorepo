import 'package:freezed_annotation/freezed_annotation.dart';

part 'apple_id_credential.freezed.dart';
part 'apple_id_credential.g.dart';

@freezed
class AppleIdCredential with _$AppleIdCredential {
  factory AppleIdCredential({
    /// An identifier associated with the authenticated user.
    ///
    /// This will always be provided on iOS and macOS systems. On Android, however, this will not be present.
    /// This will stay the same between sign ins, until the user deauthorizes your App.
    String? userIdentifier,

    /// The users given name, in case it was requested.
    /// You will need to provide the [AppleIDAuthorizationScopes.fullName] scope to the [AppleIDAuthorizationRequest] for requesting this information.
    ///
    /// This information will only be provided on the first authorizations.
    /// Upon further authorizations, you will only  the [userIdentifier],
    /// meaning you will need to store this data securely on your servers.
    /// For more information see: https://forums.developer.apple.com/thread/121496
    String? givenName,

    /// The users family name, in case it was requested.
    /// You will need to provide the [AppleIDAuthorizationScopes.fullName] scope to the [AppleIDAuthorizationRequest] for requesting this information.
    ///
    /// This information will only be provided on the first authorizations.
    /// Upon further authorizations, you will only get the [userIdentifier],
    /// meaning you will need to store this data securely on your servers.
    /// For more information see: https://forums.developer.apple.com/thread/121496
    String? familyName,

    /// The users email in case it was requested.
    /// You will need to provide the [AppleIDAuthorizationScopes.email] scope to the [AppleIDAuthorizationRequest] for requesting this information.
    ///
    /// This information will only be provided on the first authorizations.
    /// Upon further authorizations, you will only get the [userIdentifier],
    /// meaning you will need to store this data securely on your servers.
    /// For more information see: https://forums.developer.apple.com/thread/121496
    String? email,

    /// The verification code for the current authorization.
    ///
    /// This code should be used by your server component to validate the authorization with Apple within 5 minutes upon receiving it.
    required String authorizationCode,

    /// A JSON Web Token (JWT) that securely communicates information about the user to your app.
    String? identityToken,

    /// The `state` parameter that was passed to the request.
    ///
    /// This data is not modified by Apple.
    String? state,
  }) = _AppleIdCredential;

  factory AppleIdCredential.fromJson(Map<String, dynamic> json) =>
      _$AppleIdCredentialFromJson(json);
}
