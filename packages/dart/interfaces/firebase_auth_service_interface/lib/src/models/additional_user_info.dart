/// Copied from: firebase_auth_platform_interface-6.5.2/lib/src/additional_user_info.dart
/// TODO: Check if this works for the REST client too

/// A structure containing additional user information from a federated identity
/// provider.
class AdditionalUserInfo {
  AdditionalUserInfo({
    required this.isNewUser,
    this.profile,
    this.providerId,
    this.username,
  });

  /// Whether the user account has been recently created.
  final bool isNewUser;

  /// A [Map] containing additional profile information from the identity
  /// provider.
  final Map<String, dynamic>? profile;

  /// The federated identity provider ID.
  final String? providerId;

  /// The username given from the federated identity provider.
  final String? username;

  @override
  String toString() {
    return '$AdditionalUserInfo('
        'isNewUser: $isNewUser, '
        'profile: $profile, '
        'providerId: $providerId, '
        'username: $username)';
  }
}
