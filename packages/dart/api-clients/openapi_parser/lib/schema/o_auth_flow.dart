// Spec page in Notion:

/// Configuration details for a supported OAuth Flow
abstract class OAuthFlow {
  /// REQUIRED. The authorization URL to be used for this flow. This MUST be in
  /// the form of a URL. The OAuth2 standard requires the use of TLS.
  ///
  /// oauth2 ("implicit", "authorizationCode")
  String get authorizationUrl;

  /// REQUIRED. The token URL to be used for this flow. This MUST be in the form
  /// of a URL. The OAuth2 standard requires the use of TLS.
  ///
  /// Applies to: oauth2 ("password", "clientCredentials", "authorizationCode")
  String get tokenUrl;

  /// The URL to be used for obtaining refresh tokens. This MUST be in the form
  /// of a URL. The OAuth2 standard requires the use of TLS.
  ///
  /// Applies to: oauth2
  String get refreshUrl;

  /// REQUIRED. The available scopes for the OAuth2 security scheme. A map
  /// between the scope name and a short description for it. The map MAY be empty.
  ///
  /// Applies to: oauth2
  Map<String, String> get scopes;
}
