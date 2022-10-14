import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

Future<AccessCredentials> obtainCredentials() async {
  final client = http.Client();

  // TODO: make a model class with a fromJson
  var credentialsString = File('credentials.json').readAsStringSync();
  var credentials = jsonDecode(credentialsString);
  var adventuverse = credentials['adventuverse'];
  var desktopClient = adventuverse['desktopClient'];
  var clientId = desktopClient['clientId'];
  var clientSecret = desktopClient['clientSecret'];

  try {
    return await obtainAccessCredentialsViaUserConsent(
      ClientId(clientId, clientSecret),
      ['https://www.googleapis.com/auth/gmail.modify'],
      client,
      (String url) {
        print('Please go to the following URL and grant access:');
        print('  => $url' r'&access_type=offline');
        print('');
      },
    );
  } finally {
    client.close();
  }
}
