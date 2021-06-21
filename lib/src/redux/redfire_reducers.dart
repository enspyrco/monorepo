import 'package:redfire/src/auth/reducers/store_auth_step_reducer.dart';
import 'package:redfire/src/auth/reducers/store_auth_user_data_reducer.dart';
import 'package:redfire/src/problems/reducers/add_problem_reducer.dart';
import 'package:redfire/src/settings/reducers/update_settings.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
List<Reducer<T>> redfireReducers<T extends RedFireState>() => [
      AddProblemReducer<T>(),
      StoreAuthStepReducer<T>(),
      StoreAuthUserDataReducer<T>(),
      UpdateSettingsReducer<T>(),
    ];
