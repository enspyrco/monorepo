import 'package:flireator/actions/redux_action.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_git_hub_auth_action.freezed.dart';
part 'request_git_hub_auth_action.g.dart';

@freezed
class RequestGitHubAuthAction with _$RequestGitHubAuthAction, ReduxAction {
  factory RequestGitHubAuthAction() = _RequestGitHubAuthAction;

  factory RequestGitHubAuthAction.fromJson(Map<String, dynamic> json) =>
      _$RequestGitHubAuthActionFromJson(json);
}
