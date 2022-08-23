import 'package:redaux/redaux.dart';

import '../../app_state.dart';
import '../state/user_state.dart';

class UpdateUserState extends SyncAction<AppState> {
  final UserState user;

  UpdateUserState(this.user);

  static final Reducer<AppState> _r = UpdateUserStateReducer();

  @override
  Reducer<AppState>? get reducer => _r;
}

class UpdateUserStateReducer extends Reducer<AppState> {
  @override
  AppState call(state, covariant UpdateUserState action) =>
      state.copyWith(user: action.user);
}
