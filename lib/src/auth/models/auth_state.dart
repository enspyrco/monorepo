import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/authentication_enum.dart';
import 'auth_user_data.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState(
      {AuthUserData? userData, required AuthenticationEnum step}) = _AuthState;

  // Initial state is null user data and waiting for input
  factory AuthState.init() =>
      AuthState(step: AuthenticationEnum.waitingForInput);

  factory AuthState.fromJson(Map<String, Object?> json) =>
      _$AuthStateFromJson(json);
}
