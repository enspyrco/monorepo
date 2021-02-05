import 'package:freezed_annotation/freezed_annotation.dart';

part 'asana_user_credentials.freezed.dart';
part 'asana_user_credentials.g.dart';

@freezed
abstract class AsanaUserCredentials with _$AsanaUserCredentials {
  factory AsanaUserCredentials(
      {required String refresh_token,
      required String access_token,
      required int expires_in}) = _AsanaUserCredentials;

  factory AsanaUserCredentials.fromJson(Map<String, dynamic> json) =>
      _$AsanaUserCredentialsFromJson(json);
}
