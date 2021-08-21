import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/models/auth_provider_data.dart';

part 'auth_user_data.freezed.dart';
part 'auth_user_data.g.dart';

/// [createdOn] and [lastSignedInOn] are in UTC as required for serialization
@freezed
class AuthUserData with _$AuthUserData {
  AuthUserData._();
  factory AuthUserData({
    required String uid,
    String? displayName,
    String? photoURL,
    String? email,
    String? phoneNumber,
    DateTime? createdOn,
    DateTime? lastSignedInOn,
    required bool isAnonymous,
    required bool emailVerified,
    required IList<AuthProviderData> providers,
  }) = _AuthUserData;

  bool get hasGitHub => providers
      .where((provider) => provider.providerId == 'github.com')
      .isNotEmpty;

  factory AuthUserData.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDataFromJson(json);
}
