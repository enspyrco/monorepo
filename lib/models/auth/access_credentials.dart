import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immutable_collections/immutable_collections.dart';

part 'access_credentials.freezed.dart';
part 'access_credentials.g.dart';

@freezed
class AccessCredentials with _$AccessCredentials {
  factory AccessCredentials({
    /// An access token.
    required String accessToken,

    /// A refresh token, which can be used to refresh the access credentials.
    ///
    /// This field may be null.
    required String refreshToken,

    /// A JWT used in calls to Google APIs that accept an id_token param.
    required String idToken,

    /// Scopes these credentials are valid for.
    required ImmutableList<String> scopes,
  }) = _AccessCredentials;

  factory AccessCredentials.fromJson(Map<String, dynamic> json) =>
      _$AccessCredentialsFromJson(json);
}
