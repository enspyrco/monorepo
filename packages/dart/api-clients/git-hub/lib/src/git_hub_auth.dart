import 'dart:convert';

import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:http/http.dart';
import 'package:json_utils/json_utils.dart';

class GitHubAuth {
  final String _privateKey;
  final String _appId;
  final String _installationId;
  String _installationToken;
  DateTime _tokenExpiry;

  GitHubAuth._(
    this._privateKey,
    this._appId,
    this._installationId,
    this._installationToken,
    this._tokenExpiry,
  );

  static Future<GitHubAuth> createAppAuth(
      String privateKey, String appId, String installationId) async {
    var installationTokenJson =
        await _requestToken(privateKey, appId, installationId);

    return GitHubAuth._(
      privateKey,
      appId,
      installationId,
      installationTokenJson['token'] as String,
      DateTime.parse(installationTokenJson['expires_at'] as String),
    );
  }

  static Future<JsonMap> _requestToken(
      String privateKey, String appId, String installationId) async {
    var builder = JWTBuilder()
      // GitHub App's identifier
      ..issuer = appId
      // issued at time, 60 seconds in the past to allow for clock drift
      ..issuedAt = DateTime.now().subtract(Duration(seconds: 60))
      // JWT expiration time (10 minute maximum)
      ..expiresAt = DateTime.now().add(Duration(minutes: 10));

    var signer = JWTRsaSha256Signer(privateKey: privateKey);
    var signedJWT = builder.getSignedToken(signer);

    // Use the JWT to request an installation token
    var installationTokenResponse = await post(
        Uri.parse(
            'https://api.github.com/app/installations/$installationId/access_tokens'),
        headers: {
          "Accept": "application/vnd.github.v3+json",
          "Authorization": "Bearer $signedJWT",
        });

    return jsonDecode(installationTokenResponse.body);
  }

  /// Refreshes token if required
  Future<String> requestToken() async {
    if (_tokenExpiry.isBefore(DateTime.now())) {
      var installationTokenJson =
          await _requestToken(_privateKey, _appId, _installationId);
      _installationToken = installationTokenJson['token'] as String;
      _tokenExpiry =
          DateTime.parse(installationTokenJson['expires_at'] as String);
    }

    return _installationToken;
  }
}
