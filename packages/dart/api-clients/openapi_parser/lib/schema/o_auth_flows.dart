// Spec page in Notion: https://www.notion.so/reference-material/OAuth-Flows-Object-0e1d39badcf64c298d0362076a7b81a5

import 'o_auth_flow.dart';

/// Allows configuration of the supported OAuth Flows.
///
/// This object MAY be extended with Specification Extensions.
abstract class OAuthFlows {
  /// Configuration for the OAuth Implicit flow
  OAuthFlow get implicit;

  /// Configuration for the OAuth Resource Owner Password flow
  OAuthFlow get password;

  /// Configuration for the OAuth Client Credentials flow.
  /// Previously called application in OpenAPI 2.0.
  OAuthFlow get clientCredentials;

  /// Configuration for the OAuth Authorization Code flow.
  /// Previously called accessCode in OpenAPI 2.0.
  OAuthFlow get authorizationCode;
}
