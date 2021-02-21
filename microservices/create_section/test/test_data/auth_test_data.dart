import 'package:googleapis_auth/auth_io.dart';
import 'package:shared_models/shared_models.dart' show GoogleUserCredentials;

/// [AccessCredentials] are used in creating [AutoRefreshingAuthClient]
AccessCredentials get accessCredentials => AccessCredentials(
    AccessToken('type', 'data', DateTime.parse('1969-07-20 20:18:04Z')),
    'refreshToken',
    ['scopes']);

String get credentialsJson => '''
{
  "google": {
    "id": "blah.apps.googleusercontent.com",
    "secret": "boopbopbap",
    "redirect_url": "https://the_place.com"
  },
  "asana": {
    "client_id": "blahdyblah",
    "client_secret": "bapboopbop",
    "redirect_uri": "https://place.com"
  }
}
''';

GoogleUserCredentials get googleUserCredentials => GoogleUserCredentials(
    accessToken: 'accessToken',
    expiryDate: DateTime.parse('2012-02-27').millisecondsSinceEpoch,
    idToken: 'idToken',
    refreshToken: 'refreshToken',
    scope: 'scope',
    tokenType: 'Bearer');
