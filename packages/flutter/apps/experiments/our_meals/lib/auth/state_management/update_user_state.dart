import 'package:redaux/redaux.dart';

import '../../app/state/app_state.dart';
import '../state/user_state.dart';

class UpdateUserState extends SyncAction<AppState> {
  UpdateUserState(this.user);

  final UserState user;

  @override
  Reducer<AppState> get reducer => _UpdateUserStateReducer.instance;
}

class _UpdateUserStateReducer extends Reducer<AppState> {
  @override
  AppState call(state, covariant UpdateUserState action) =>
      state.copyWith(user: action.user);

  static final instance = _UpdateUserStateReducer();
}
