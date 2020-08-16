import 'package:flireator/extensions/git_hub/gql_extensions.dart';
import 'package:flireator/models/git_hub/git_hub_repository.dart';
import 'package:flireator/utils/authenticated_http.dart';
import 'package:github_graphql_client/github_graphql_client.dart';
import 'package:http/http.dart' as http;

class GitHubService {
  String _token;
  HttpLink _link;

  set token(String token) {
    _token = token;
    _link = HttpLink(
      'https://api.github.com/graphql',
      httpClient: AuthenticatedClient(token, http.Client()),
    );
  }

  GitHubService();

  Future<List<GitHubRepository>> retrieveRespositories() async {
    // check the token has been set
    if (_token == null) {
      throw 'You tried to use the GitHubService before the token was set';
    }

    // make the request
    var result = await _link.request(Repositories((b) => b..count = 100)).first;
    if (result.errors != null && result.errors.isNotEmpty) {
      throw QueryException(result.errors);
    }

    // convert the result to models
    return $Repositories(result.data)
        .viewer
        .repositories
        .nodes
        .toGitHubRepositories();
  }
}
