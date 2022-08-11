import 'user_info.dart';
import 'user_metadata.dart';

/// Copied from: firebase_auth-3.6.2/lib/src/user.dart
/// TODO: Check if this works for the REST client too

/// The User class in FlutterFire's firebse_auth has a lot of functionality that
/// should be in the service rather than the model IMO
///
/// Members:
/// - MultiFactor
/// Functions
/// - delete
/// - getIdToken
/// - getIdTokenResult
/// - linkWithCredential
/// - linkWithPopup
/// - linkWithPhoneNumber
/// - reauthenticateWithCredential
/// - reload
/// - sendEmailVerification
/// - unlink
/// - updateEmail
/// - updatePassword
/// - updatePhoneNumber
/// - updatePhotoURL
/// - updateDisplayName
/// - verifyBeforeUpdateEmail

/// A user account.
class User {
  User(
      this.displayName,
      this.email,
      this.emailVerified,
      this.isAnonymous,
      this.metadata,
      this.phoneNumber,
      this.photoURL,
      this.providerData,
      this.refreshToken,
      this.tenantId,
      this.uid);

  /// The users display name.
  ///
  /// Will be `null` if signing in anonymously or via password authentication.
  final String? displayName;

  /// The users email address.
  ///
  /// Will be `null` if signing in anonymously.
  final String? email;

  /// Returns whether the users email address has been verified.
  ///
  /// To send a verification email, see [sendEmailVerification].
  ///
  /// Once verified, call [reload] to ensure the latest user information is
  /// retrieved from Firebase.
  final bool emailVerified;

  /// Returns whether the user is a anonymous.
  final bool isAnonymous;

  /// Returns additional metadata about the user, such as their creation time.
  final UserMetadata metadata;

  /// Returns the users phone number.
  ///
  /// This property will be `null` if the user has not signed in or been has
  /// their phone number linked.
  final String? phoneNumber;

  /// Returns a photo URL for the user.
  ///
  /// This property will be populated if the user has signed in or been linked
  /// with a 3rd party OAuth provider (such as Google).
  final String? photoURL;

  /// Returns a list of user information for each linked provider.
  final List<UserInfo> providerData;

  /// Returns a JWT refresh token for the user.
  ///
  /// This property maybe `null` or empty if the underlying platform does not
  /// support providing refresh tokens.
  final String? refreshToken;

  /// The current user's tenant ID.
  ///
  /// This is a read-only property, which indicates the tenant ID used to sign
  /// in the current user. This is `null` if the user is signed in from the
  /// parent project.
  final String? tenantId;

  /// The user's unique ID.
  final String uid;

  @override
  String toString() {
    return '$User('
        'displayName: $displayName, '
        'email: $email, '
        'emailVerified: $emailVerified, '
        'isAnonymous: $isAnonymous, '
        'phoneNumber: $phoneNumber, '
        'photoURL: $photoURL, '
        'providerData, $providerData, '
        'refreshToken: $refreshToken, '
        'tenantId: $tenantId, '
        'uid: $uid)';
  }
}
