import 'additional_user_info.dart';
import 'auth_credential.dart';
import 'user.dart';

/// Copied from firebase_auth-3.6.2/lib/src/user_credential.dart
/// TODO: Check if this works for the REST client too

/// A UserCredential is returned from authentication requests such as
/// [createUserWithEmailAndPassword].
class UserCredential {
  UserCredential(this.additionalUserInfo, this.credential, this.user);

  /// Returns additional information about the user, such as whether they are a
  /// newly created one.
  final AdditionalUserInfo? additionalUserInfo;

  /// The users [AuthCredential].
  final AuthCredential? credential;

  /// Returns a [User] containing additional information and user specific
  /// methods.
  final User? user;

  @override
  String toString() {
    return 'UserCredential('
        'additionalUserInfo: $additionalUserInfo, '
        'credential: $credential, '
        'user: $user)';
  }
}
