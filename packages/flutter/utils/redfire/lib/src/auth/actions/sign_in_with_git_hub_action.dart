import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../types.dart';

part 'sign_in_with_git_hub_action.freezed.dart';
part 'sign_in_with_git_hub_action.g.dart';

@freezed
class SignInWithGitHubAction with _$SignInWithGitHubAction, ReduxAction {
  const SignInWithGitHubAction._();
  const factory SignInWithGitHubAction() = _SignInWithGitHubAction;

  factory SignInWithGitHubAction.fromJson(JsonMap json) =>
      _$SignInWithGitHubActionFromJson(json);

  @override
  String get typeName => 'SignInWithGitHubAction';
}
