import 'package:enspyr_redux/redux.dart';

import 'auth/state/user_state.dart';

class AppState extends ReduxState {
  static AppState get initial => AppState(user: UserState.initial);

  AppState({required this.user});

  UserState user;

  AppState copyWith({UserState? user}) {
    return AppState(user: user ?? this.user);
  }
}
