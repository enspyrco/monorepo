import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/reducers/auth_reducers.dart';
import 'package:flireator/reducers/problems_reducers.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer =
    combineReducers<AppState>(<AppState Function(AppState, dynamic)>[
  ...authReducers,
  ...problemsReducers,
]);
