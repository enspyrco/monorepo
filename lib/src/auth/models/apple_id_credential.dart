import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'apple_id_credential.freezed.dart';
part 'apple_id_credential.g.dart';

/// A freezed version of [sign_in_with_apple/authorization_credential.dart]
///
/// Authorization details from a successful Sign in with Apple flow.
///
/// Most fields are optional in this class.
///
/// Especially [givenName], [familyName], and [email] member will only be provided on the first authorization between
/// the app and Apple ID.
///
/// The [authorizationCode] member is always present and should be used to check the authorizations with Apple servers
/// from your backend. Upon successful validation, you should create a session in your system for the current user,
/// or consider her now logged in.
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

  factory AppleIdCredential.fromJson(JsonMap json) =>
      _$AppleIdCredentialFromJson(json);
}
