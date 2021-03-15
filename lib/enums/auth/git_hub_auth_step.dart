import 'package:freezed_annotation/freezed_annotation.dart';

enum GitHubAuthorizationStep {
  @JsonValue('RETRIEVING_STORED_TOKEN')
  retrievingStoredToken,
  @JsonValue('REQUESTING_GIT_HUB_AUTH')
  requestingGitHubAuth,
  @JsonValue('EXCHANGING_CODE')
  exchangingCode,
  @JsonValue('EXCHANGED_CODE')
  exchangedCode,
  @JsonValue('SIGNING_IN_WITH_GIT_HUB')
  signingInWithGitHub
}
