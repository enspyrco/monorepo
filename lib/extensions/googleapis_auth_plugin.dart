import 'package:built_collection/built_collection.dart';
import 'package:googleapis_auth/auth.dart' as googleapis_auth;
import 'package:the_process/models/auth/access_credentials.dart';

extension AccessCredentialsExt on googleapis_auth.AccessCredentials {
  AccessCredentials toModel() => AccessCredentials(
      accessToken: accessToken.data,
      refreshToken: refreshToken,
      idToken: idToken,
      scopes: BuiltList(scopes));
}
