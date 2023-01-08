import 'package:astro_types/auth_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'user_auth_state_flutterfire.dart';

class AuthStateFlutterfire implements AuthState, AstroState {
  const AuthStateFlutterfire({this.user = const UserAuthStateFlutterfire()});

  @override
  final UserAuthStateFlutterfire user;

  @override
  AuthStateFlutterfire copyWith({covariant UserAuthStateFlutterfire? user}) =>
      AuthStateFlutterfire(user: user ?? this.user);

  @override
  JsonMap toJson() => {'user': user.toJson()};

  @override
  bool operator ==(Object other) =>
      other is AuthStateFlutterfire && other.user == user;

  @override
  int get hashCode => user.hashCode;
}
