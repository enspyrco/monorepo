import 'dart:convert';

import 'package:gather_link_account_shelf/config/secret.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/shelf.dart' show Request, Response;

// https://gather-link-account-shelf-eogj3aa7na-uc.a.run.app/github/?code=a3ba08bbee674a21a85b&state=lvr_W0cxHHezXKDDhMnT7zbGTGVmGtoTjiB_-OYVNAU%3D

Future<Response> githubHandler(Request request) async {
  String? nonce, code, githubUsername;

  try {
    nonce = request.url.queryParameters['state']!;
    code = request.url.queryParameters['code']!;

    // Exchange the code & secret for a token
    var tokenResponse = await http.post(
        Uri(
            scheme: 'https',
            host: 'github.com',
            path: 'login/oauth/access_token'),
        headers: {
          'Accept': 'application/json'
        },
        body: {
          'client_id': '3b2457d371c7b9b4a1b8',
          'client_secret': clientSecret,
          'code': code
        });
    var decodedTokenResponse =
        jsonDecode(utf8.decode(tokenResponse.bodyBytes)) as Map;
    var accessToken = decodedTokenResponse['access_token'] as String;

    // Use the github API to get the username
    var userResponse = await http.get(
        Uri(scheme: 'https', host: 'api.github.com', path: 'user'),
        headers: {'Authorization': 'token $accessToken'});
    var decodedUserResponse =
        jsonDecode(utf8.decode(userResponse.bodyBytes)) as Map;
    githubUsername = decodedUserResponse['login'] as String;

    // TODO: Mint token with Firebase Admin SDK & send to client

    final String token = '...';

    return Response.movedPermanently(
        'https://gather-identity-link.web.app/gather?token=$token');
  } catch (error, trace) {
    return Response.internalServerError(
        body: 'error:\n$error\n\ntrace:\n$trace');
  } finally {
    // Locate.client.close();
  }
}
