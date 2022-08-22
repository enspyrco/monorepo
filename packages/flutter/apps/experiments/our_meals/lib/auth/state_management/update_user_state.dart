import 'package:redaux/redaux.dart';

import '../../app_state.dart';
import '../state/user_state.dart';

class UpdateUserStateAction extends Action<AppState> {
  final UserState user;

  UpdateUserStateAction(this.user);

  static const Middleware<AppState>? _m = null;
  static final Reducer<AppState> _r = UpdateUserStateReducer();

  @override
  Middleware<AppState>? get middleware => _m;

  @override
  Reducer<AppState>? get reducer => _r;
}

class UpdateUserStateReducer extends Reducer<AppState> {
  @override
  AppState call(state, covariant UpdateUserStateAction action) =>
      state.copyWith(user: action.user);
}
