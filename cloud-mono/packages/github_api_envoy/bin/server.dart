import 'dart:io';

import 'package:git_hub_api_client/git_hub_api_client.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:secret_manager_api_client/secret_manager_api_client.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf/shelf_io.dart' as shelf_io;

final githubInstallationId = Platform.environment['GITHUB_INSTALLATION_ID']!;
final gcpProjectId = Platform.environment['GCP_PROJECT_ID']!;
final githubAppId = Platform.environment['GITHUB_APP_ID']!;
final secretName = Platform.environment['SECRET_NAME']!;
final githubOrg = Platform.environment['GITHUB_ORG']!;

GitHubService? _githubService;

Future<Response> handler(Request request) async {
  // If needed, retrieve the private key from the SecretManager & create a GitHubService
  if (_githubService == null) {
    var httpClient = await clientViaApplicationDefaultCredentials(scopes: []);
    var privateKey = await SecretManagerService(gcpProjectId, httpClient)
        .requestSecretValue(name: secretName);
    // Use the GitHub App private key to create an authenticated GitHub Client
    _githubService = await GitHubService.createWithAppAuth(
        org: githubOrg,
        privateKey: privateKey,
        appId: githubAppId,
        installationId: githubInstallationId);
  }

  // Create a local variable to avoid having to ! when _githubService is accessed
  var githubApp = _githubService!;

  githubApp.createRepo(name: 'woop!');

  return Response.ok('You have acheived the success.');
}

void main() {
  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at https://${server.address.host}:${server.port}');
  });
}
