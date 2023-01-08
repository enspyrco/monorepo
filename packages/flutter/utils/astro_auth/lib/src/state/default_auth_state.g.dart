// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_auth_state.dart';

// **************************************************************************
// SubclassGenerator
// **************************************************************************

class GeneratedDefaultAuthState implements DefaultAuthState {
  GeneratedDefaultAuthState({
    required this.user,
  });

  @override
  final UserAuthState user;

  @override
  GeneratedDefaultAuthState copyWith({
    UserAuthState? user,
  }) =>
      GeneratedDefaultAuthState(
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
      other is GeneratedDefaultAuthState && user == other.user;
}
