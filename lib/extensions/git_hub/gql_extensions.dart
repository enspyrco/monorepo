import 'package:flireator/models/git_hub/git_hub_repository.dart';
import 'package:flireator/models/git_hub/git_hub_user.dart';
import 'package:github_graphql_client/src/github_gql/github_queries.data.gql.dart';

extension ListOfGitHubRepositoryExt
    on List<$Repositories$viewer$repositories$nodes> {
  List<GitHubRepository> toGitHubRepositories() {
    final list = <GitHubRepository>[];
    for (final node in this) {
      final repo = GitHubRepository(
          description: node.description,
          isFork: node.isFork,
          isPrivate: node.isPrivate,
          issues: node.issues.totalCount,
          name: node.name,
          owner: GitHubUser(
              avatarUrl: node.owner.avatarUrl.value, login: node.owner.login),
          stargazers: node.stargazers.totalCount,
          url: node.url.value);
      list.add(repo);
    }
    return list;
  }
}
