import 'package:flireator/actions/auth/store_git_hub_token.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreGitHubTokenReducer extends TypedReducer<AppState, StoreGitHubToken> {
  StoreGitHubTokenReducer()
      : super((state, action) {
          return state.rebuild((b) => b..gitHubToken = action.token);
        });
}
