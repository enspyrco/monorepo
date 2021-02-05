import 'package:freezed_annotation/freezed_annotation.dart';

import 'asana_project_credentials.dart';
import 'google_project_credentials.dart';

part 'auth_provider_project_credentials.freezed.dart';
part 'auth_provider_project_credentials.g.dart';

@freezed
abstract class AuthProviderProjectCredentials
    with _$AuthProviderProjectCredentials {
  factory AuthProviderProjectCredentials(
          {required GoogleProjectCredentials google,
          required AsanaProjectCredentials asana}) =
      _AuthProviderProjectCredentials;

  factory AuthProviderProjectCredentials.fromJson(Map<String, dynamic> json) =>
      _$AuthProviderProjectCredentialsFromJson(json);
}
