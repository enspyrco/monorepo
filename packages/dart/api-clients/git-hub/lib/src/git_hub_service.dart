import 'dart:convert';

import 'package:git_hub_api_client/src/git_hub_auth.dart';
import 'package:http/http.dart';
import 'package:json_types/json_types.dart';

class GitHubService {
  final GitHubAuth _auth;
  final String _orgName;

  GitHubService._(GitHubAuth auth, {required String org})
      : _auth = auth,
        _orgName = org;

  static Future<GitHubService> createWithAppAuth(
      {required String privateKey,
      required String appId,
      required String installationId,
      required String org}) async {
    var auth =
        await GitHubAuth.createAppAuth(privateKey, appId, installationId);
    return GitHubService._(auth, org: org);
  }

  Future<JsonMap> createRepo({required String name}) async {
    var token = await _auth.requestToken();
    final response =
        await post(Uri.parse('https://api.github.com/orgs/$_orgName/repos'),
            headers: {
              "Accept": "application/vnd.github.v3+json",
              "Authorization": "token $token",
            },
            body: '{"name":"$name"}');
    return jsonDecode(response.body);
  }
}
