import 'package:redaux/redaux.dart';

import 'auth/state/user_state.dart';

class AppState extends State {
  static AppState get initial => AppState(user: UserState.initial);

  AppState({required this.user});

  UserState user;

  AppState copyWith({UserState? user}) {
    return AppState(user: user ?? this.user);
  }
}
