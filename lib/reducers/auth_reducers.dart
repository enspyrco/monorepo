import 'package:flireator/actions/auth/sign_out.dart';
import 'package:flireator/actions/auth/store_auth_step.dart';
import 'package:flireator/actions/auth/store_git_hub_token.dart';
import 'package:flireator/actions/auth/store_user_data.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final authReducers = <AppState Function(AppState, dynamic)>[
  StoreUserDataReducer(),
  StoreAuthStepReducer(),
  StoreGitHubTokenReducer(),
  SignOutReducer(),
];

class StoreUserDataReducer extends TypedReducer<AppState, StoreUserData> {
  StoreUserDataReducer()
      : super((state, action) =>
            state.rebuild((b) => b..userData = action.userData?.toBuilder()));
}

class StoreAuthStepReducer extends TypedReducer<AppState, StoreAuthStep> {
  StoreAuthStepReducer()
      : super(
            (state, action) => state.rebuild((b) => b..authStep = action.step));
}

class StoreGitHubTokenReducer extends TypedReducer<AppState, StoreGitHubToken> {
  StoreGitHubTokenReducer()
      : super((state, action) {
          return state.rebuild((b) => b..gitHubToken = action.token);
        });
}

class SignOutReducer extends TypedReducer<AppState, SignOut> {
  SignOutReducer()
      : super((state, action) => state.rebuild((b) => b..gitHubToken = null));
}
