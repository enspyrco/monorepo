import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

AutoRefreshingAuthClient createAuthClient(http.Client httpClient) {
  var credentialsString = File('credentials.json').readAsStringSync();
  print(credentialsString);
  // TODO: make a model class with a fromJson
  var credentials = jsonDecode(credentialsString);
  var nickmeinholdGmail = credentials['nickmeinholdGmail'];
  var adventuverse = credentials['adventuverse'];
  var accessTokenJson = nickmeinholdGmail['accessToken'];
  var refreshToken = nickmeinholdGmail['refreshToken'];
  var accessToken = AccessToken(accessTokenJson['type'],
      accessTokenJson['data'], DateTime.parse(accessTokenJson['expiry']));
  var desktopClient = adventuverse['desktopClient'];
  var clientId = desktopClient['clientId'];
  var clientSecret = desktopClient['clientSecret'];

  return autoRefreshingClient(
      ClientId(clientId, clientSecret),
      AccessCredentials(accessToken, refreshToken,
          ['https://www.googleapis.com/auth/gmail.modify']),
      httpClient);
}
