import 'auth_provider_data.dart';

/// This class was created in RedFire -> mapped from a User via `user.toModel();`

/// [createdOn] and [lastSignedInOn] are in UTC as required for serialization
class AuthUserData {
  AuthUserData({
    required String uid,
    String? tenantId,
    String? displayName,
    String? photoURL,
    String? email,
    String? phoneNumber,
    DateTime? createdOn,
    DateTime? lastSignedInOn,
    required bool isAnonymous,
    required bool emailVerified,
    required List<AuthProviderData> providers,
  });
}
