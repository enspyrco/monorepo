import 'package:googleapis_auth/auth_io.dart';
import 'package:shared_models/shared_models.dart' show GoogleUserCredentials;

extension GoogleUserCredentialsExtension on GoogleUserCredentials {
  AccessCredentials toAccessCredentials() => AccessCredentials(
      AccessToken(tokenType, accessToken,
          DateTime.fromMillisecondsSinceEpoch(expiryDate).toUtc()),
      refreshToken,
      scope.split(' '),
      idToken: idToken);
}
