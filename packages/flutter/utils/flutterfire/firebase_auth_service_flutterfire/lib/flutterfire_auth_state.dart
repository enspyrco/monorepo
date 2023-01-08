import 'package:astro_types/auth_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'flutterfire_user_state.dart';

class FlutterfireAuthState implements AuthState, AstroState {
  FlutterfireAuthState({required this.user});

  static FlutterfireAuthState get initial =>
      FlutterfireAuthState(user: FlutterfireUserState.initial);

  @override
  final FlutterfireUserState user;

  @override
  FlutterfireAuthState copyWith({covariant FlutterfireUserState? user}) =>
      FlutterfireAuthState(user: user ?? this.user);

  @override
  JsonMap toJson() => {'user': user.toJson()};

  @override
  bool operator ==(Object other) =>
      other is FlutterfireAuthState && other.user == user;

  @override
  int get hashCode => user.hashCode;
}
