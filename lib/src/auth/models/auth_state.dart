import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/typedefs.dart';

import '../enums/authentication_enum.dart';
import 'auth_user_data.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState(
      {String? email,
      List<String>? signInMethodsForEmail,
      AuthUserData? userData,
      required AuthenticationEnum step}) = _AuthState;

  // Initial state is null user data and waiting for input
  factory AuthState.init() =>
      AuthState(step: AuthenticationEnum.waitingForInput);

  factory AuthState.fromJson(JsonMap json) => _$AuthStateFromJson(json);
}
