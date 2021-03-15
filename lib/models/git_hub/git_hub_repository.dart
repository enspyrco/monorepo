import 'package:flireator/models/git_hub/git_hub_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'git_hub_repository.freezed.dart';
part 'git_hub_repository.g.dart';

@freezed
class GitHubRepository with _$GitHubRepository {
  factory GitHubRepository(
      {required String name,
      required String description,
      required bool isFork,
      required bool isPrivate,
      required int stargazers,
      required String url,
      required int issues,
      required GitHubUser owner}) = _GitHubRepository;

  factory GitHubRepository.fromJson(Map<String, dynamic> json) =>
      _$GitHubRepositoryFromJson(json);
}
