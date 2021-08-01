import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/models/auth_provider_data.dart';

part 'auth_user_data.freezed.dart';
part 'auth_user_data.g.dart';

@freezed
class AuthUserData with _$AuthUserData {
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

  factory AuthUserData.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDataFromJson(json);
}
