// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StateImplementationGenerator
// **************************************************************************

class AuthStateTestDouble implements AuthState {
  AuthStateTestDouble({
    required this.user,
  });

  @override
  final UserAuthState user;

  @override
  AuthStateTestDouble copyWith({
    UserAuthState? user,
  }) =>
      AuthStateTestDouble(
        user: user ?? this.user,
      );

  @override
  Map<String, Object?> toJson() => {
        'user': user,
      };

  @override
  String toString() => 'user: $user, ';

  @override
  int get hashCode => user.hashCode;

  @override
  bool operator ==(Object other) =>
      other is AuthStateTestDouble && user == other.user;
}
