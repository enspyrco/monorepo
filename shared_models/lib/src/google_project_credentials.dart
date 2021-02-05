import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_project_credentials.freezed.dart';
part 'google_project_credentials.g.dart';

@freezed
abstract class GoogleProjectCredentials with _$GoogleProjectCredentials {
  factory GoogleProjectCredentials(
          {required String id,
          required String secret,
          @JsonKey(name: 'redirect_url') required String redirectURL}) =
      _GoogleProjectCredentials;

  factory GoogleProjectCredentials.fromJson(Map<String, dynamic> json) =>
      _$GoogleProjectCredentialsFromJson(json);
}
