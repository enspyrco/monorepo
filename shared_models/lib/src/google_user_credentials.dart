import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_user_credentials.freezed.dart';
part 'google_user_credentials.g.dart';

@freezed
abstract class GoogleUserCredentials with _$GoogleUserCredentials {
  factory GoogleUserCredentials(
      {required String refresh_token,
      required int expiry_date,
      required String access_token,
      required String token_type,
      required String id_token,
      required String scope}) = _GoogleUserCredentials;

  factory GoogleUserCredentials.fromJson(Map<String, dynamic> json) =>
      _$GoogleUserCredentialsFromJson(json);
}
