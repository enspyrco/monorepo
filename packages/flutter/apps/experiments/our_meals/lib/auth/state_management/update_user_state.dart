import 'package:enspyr_redux/redux.dart';

import '../../app_state.dart';
import '../state/user_state.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  final UserState user;

  UpdateUserStateAction(this.user);

  static const ReduxMiddleware<AppState>? _m = null;
  static final ReduxReducer<AppState> _r = UpdateUserStateReducer();

  @override
  ReduxMiddleware<AppState>? get middleware => _m;

  @override
  ReduxReducer<AppState>? get reducer => _r;
}

class UpdateUserStateReducer extends ReduxReducer<AppState> {
  @override
  AppState call(state, covariant UpdateUserStateAction action) =>
      state.copyWith(user: action.user);
}
