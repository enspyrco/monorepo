/// In RedFire a [UserInfo] is converted to a [AuthProviderData] via UserInfo.toModel()

class AuthProviderData {
  AuthProviderData({
    /// The provider identifier.
    required String providerId,

    /// The provider’s user ID for the user.
    required String? uid,

    /// The name of the user.
    String? displayName,

    /// The URL of the user’s profile photo.
    String? photoURL,

    /// The user’s email address.
    String? email,

    /// The user's phone number.
    String? phoneNumber,
  });
}
