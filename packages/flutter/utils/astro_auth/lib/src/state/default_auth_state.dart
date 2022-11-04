import 'package:astro_types/auth_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'default_user_state.dart';

class DefaultAuthState implements AuthState, AstroState {
  DefaultAuthState({required this.user});

  static DefaultAuthState get initial =>
      DefaultAuthState(user: DefaultUserState.initial);

  @override
  final DefaultUserState user;

  @override
  DefaultAuthState copyWith({DefaultUserState? user}) =>
      DefaultAuthState(user: user ?? this.user);

  @override
  JsonMap toJson() => {'user': user.toJson()};

  @override
  bool operator ==(Object other) =>
      other is DefaultAuthState && other.user == user;

  @override
  int get hashCode => user.hashCode;
}
