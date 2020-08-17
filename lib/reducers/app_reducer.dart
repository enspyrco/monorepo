import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/reducers/auth/sign_out_reducer.dart';
import 'package:flireator/reducers/auth/store_auth_step_reducer.dart';
import 'package:flireator/reducers/auth/store_git_hub_token_reducer.dart';
import 'package:flireator/reducers/auth/store_user_data_reducer.dart';
import 'package:flireator/reducers/problems/display_problem_reducer.dart';
import 'package:flireator/reducers/problems/remove_problem_reducer.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer =
    combineReducers<AppState>(<AppState Function(AppState, dynamic)>[
  // Auth
  StoreUserDataReducer(),
  StoreAuthStepReducer(),
  StoreGitHubTokenReducer(),
  SignOutReducer(),
  // Problems
  DisplayProblemReducer(),
  RemoveProblemReducer()
]);
