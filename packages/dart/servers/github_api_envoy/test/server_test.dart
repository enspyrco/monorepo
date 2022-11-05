import 'dart:io';

import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:git_hub_api_client/git_hub_api_client.dart';
import 'package:googleapis/secretmanager/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

final appUri = Uri.parse('https://api.github.com/app');
const local = 'http://0.0.0.0:8080';
const githubOrg = 'adventures-in';

void main() {
  test('GitHub API Client', () async {
    var privateKeyString =
        File('test/data/adventures-in.2022-02-16.private-key.pem')
            .readAsStringSync();

    var githubApp = await GitHubService.createWithAppAuth(
        org: githubOrg,
        privateKey: privateKeyString,
        appId: '173221',
        installationId: '23353229');
    var jsonResponse = await githubApp.createRepo(name: 'justATestRepo');
    print(jsonResponse);
  }, skip: true); // this is a live test that creates a repo so we skip it

  test('SecretManagerService', () async {
    var serviceAccountCredentialsJson =
        File('test/data/mobbing-on-discord-7ad4cd6e7835.json')
            .readAsStringSync();
    var serviceAccountCredentials =
        ServiceAccountCredentials.fromJson(serviceAccountCredentialsJson);
    var httpClient = await clientViaServiceAccount(
        serviceAccountCredentials, [SecretManagerApi.cloudPlatformScope]);
  },
      skip:
          true); // Not sure what happened to mobbing-on-discord-7ad4cd6e7835.json

  test('Create JWT for authenticated call to GitHub API', () async {
    var builder = JWTBuilder()
      // GitHub App's identifier
      ..issuer = '173221'
      // issued at time, 60 seconds in the past to allow for clock drift
      ..issuedAt = DateTime.now().subtract(Duration(seconds: 60))
      // JWT expiration time (10 minute maximum)
      ..expiresAt = DateTime.now().add(Duration(minutes: 10));

    var pemString = File('test/data/adventures-in.2022-02-16.private-key.pem')
        .readAsStringSync();
    var signer = JWTRsaSha256Signer(privateKey: pemString);
    var signedJWT = builder.getSignedToken(signer);

    // var decodedToken = JWT.parse('$stringToken');
    // // Verify signature:
    // print(decodedToken.verify(signer)); // true

    // // Validate claims:
    // var validator = JWTValidator() // uses DateTime.now() by default
    //   ..issuer = '173221'; // set claims you wish to validate
    // Set<String> errors = validator.validate(decodedToken);
    // print(errors); // (empty list)
  },
      skip:
          true); // Not sure what happened to: adventures-in.2022-02-16.private-key.pem

  test('Echo', () async {
    final response = await get(Uri.parse(local + '/echo/hello'));
    expect(response.statusCode, 200);
    expect(response.body, 'hello\n');
  }, skip: true);
}
