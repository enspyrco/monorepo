import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_user_credentials.freezed.dart';
part 'google_user_credentials.g.dart';

@freezed
abstract class GoogleUserCredentials with _$GoogleUserCredentials {
  factory GoogleUserCredentials(
      {@JsonKey(name: 'refresh_token') required String refreshToken,
      @JsonKey(name: 'expiry_date') required int expiryDate,
      @JsonKey(name: 'access_token') required String accessToken,
      @JsonKey(name: 'token_type') required String tokenType,
      @JsonKey(name: 'id_token') required String idToken,
      required String scope}) = _GoogleUserCredentials;

  factory GoogleUserCredentials.fromJson(Map<String, dynamic> json) =>
      _$GoogleUserCredentialsFromJson(json);
}
