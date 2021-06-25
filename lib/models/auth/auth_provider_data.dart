import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_provider_data.freezed.dart';
part 'auth_provider_data.g.dart';

@freezed
class AuthProviderData with _$AuthProviderData {
  factory AuthProviderData({
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
  }) = _AuthProviderData;

  factory AuthProviderData.fromJson(Map<String, dynamic> json) =>
      _$AuthProviderDataFromJson(json);
}
