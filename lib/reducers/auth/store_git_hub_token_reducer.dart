import 'package:flireator/actions/auth/store_git_hub_token_action.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreGitHubTokenReducer
    extends TypedReducer<AppState, StoreGitHubTokenAction> {
  StoreGitHubTokenReducer()
      : super((state, action) => state.copyWith(gitHubToken: action.token));
}
