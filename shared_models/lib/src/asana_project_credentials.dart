import 'package:freezed_annotation/freezed_annotation.dart';

part 'asana_project_credentials.freezed.dart';
part 'asana_project_credentials.g.dart';

@freezed
abstract class AsanaProjectCredentials with _$AsanaProjectCredentials {
  factory AsanaProjectCredentials(
          {@JsonKey(name: 'client_id') required String clientId,
          @JsonKey(name: 'client_secret') required String clientSecret,
          @JsonKey(name: 'redirect_uri') required String redirectURI}) =
      _AsanaProjectCredentials;

  factory AsanaProjectCredentials.fromJson(Map<String, dynamic> json) =>
      _$AsanaProjectCredentialsFromJson(json);
}
