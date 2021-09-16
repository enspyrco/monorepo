import 'package:redfire/src/auth/reducers/set_email_reducer.dart';
import 'package:redfire/src/auth/reducers/set_id_token_result_reducer.dart';
import 'package:redfire/src/auth/reducers/set_providers_for_email_reducer.dart';
import 'package:redux/redux.dart';

import '../auth/reducers/set_auth_step_reducer.dart';
import '../auth/reducers/set_auth_user_data_reducer.dart';
import '../auth/reducers/sign_out_reducer.dart';
import '../navigation/reducers/push_page_reducer.dart';
import '../navigation/reducers/remove_current_page_reducer.dart';
import '../problems/reducers/add_problem_reducer.dart';
import '../problems/reducers/remove_problem_reducer.dart';
import '../settings/reducers/update_settings_reducer.dart';
import '../types/red_fire_state.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
List<Reducer<T>> redfireReducers<T extends RedFireState>() => [
      // Auth
      SignOutReducer<T>(),
      SetAuthStepReducer<T>(),
      SetAuthUserDataReducer<T>(),
      SetEmailReducer<T>(),
      SetProvidersForEmailReducer<T>(),
      SetIdTokenResultReducer<T>(),

      // Navigation
      PushPageReducer<T>(),
      RemoveCurrentPageReducer<T>(),

      // Problems
      AddProblemReducer<T>(),
      RemoveProblemReducer<T>(),

      // Profile
      // StoreProfileDataReducer<T>(),

      // Settings
      UpdateSettingsReducer<T>(),
    ];
