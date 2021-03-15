import 'package:freezed_annotation/freezed_annotation.dart';

part 'git_hub_user.freezed.dart';
part 'git_hub_user.g.dart';

@freezed
class GitHubUser with _$GitHubUser {
  factory GitHubUser({required String login, required String avatarUrl}) =
      _GitHubUser;

  factory GitHubUser.fromJson(Map<String, dynamic> json) =>
      _$GitHubUserFromJson(json);
}
