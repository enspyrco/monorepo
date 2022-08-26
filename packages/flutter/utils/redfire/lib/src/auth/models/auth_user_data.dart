import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import 'auth_provider_data.dart';

part 'auth_user_data.freezed.dart';
part 'auth_user_data.g.dart';

/// [createdOn] and [lastSignedInOn] are in UTC as required for serialization
@freezed
class AuthUserData with _$AuthUserData {
  const AuthUserData._();
  const factory AuthUserData({
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
    required IList<AuthProviderData> providers,
  }) = _AuthUserData;

  bool get hasGitHub => providers
      .where((provider) => provider.providerId == 'github.com')
      .isNotEmpty;

  factory AuthUserData.fromJson(JsonMap json) => _$AuthUserDataFromJson(json);
}
