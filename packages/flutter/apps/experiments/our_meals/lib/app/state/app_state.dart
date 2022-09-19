import 'package:redaux/redaux.dart';
import 'package:redaux_auth/redaux_auth.dart';

class AppState extends RootState with AuthState {
  static AppState get initial => AppState(user: UserState.initial);

  AppState({required this.user});

  @override
  UserState user;

  @override
  AppState copyWith({List<ErrorMessage>? errorMessages, UserState? user}) {
    return AppState(user: user ?? this.user);
  }

  @override
  toJson() => {'user': user.toJson()};
}
