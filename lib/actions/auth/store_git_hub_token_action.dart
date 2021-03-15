import 'package:freezed_annotation/freezed_annotation.dart';

import '../redux_action.dart';

part 'store_git_hub_token_action.freezed.dart';
part 'store_git_hub_token_action.g.dart';

@freezed
class StoreGitHubTokenAction with _$StoreGitHubTokenAction, ReduxAction {
  factory StoreGitHubTokenAction({String? token}) = _StoreGitHubTokenAction;

  factory StoreGitHubTokenAction.fromJson(Map<String, dynamic> json) =>
      _$StoreGitHubTokenActionFromJson(json);
}
