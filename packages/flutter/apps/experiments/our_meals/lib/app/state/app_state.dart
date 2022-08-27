import 'package:redaux/redaux.dart';

import '../../auth/state/user_state.dart';

class AppState extends RootState {
  static AppState get initial => AppState(user: UserState.initial);

  AppState({required this.user});

  UserState user;

  @override
  AppState copyWith({List<ErrorMessage>? errorMessages, UserState? user}) {
    return AppState(user: user ?? this.user);
  }

  @override
  toJson() => {'user': user.toJson()};
}
