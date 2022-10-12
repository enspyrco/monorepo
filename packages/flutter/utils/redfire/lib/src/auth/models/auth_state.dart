import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../types.dart';
import 'id_token_result.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState(
      {required EmailAuthVM emailVM,
      AuthUserData? userData,
      IdTokenResult? idTokenResult,
      required LinkAccountsViewModel linking,
      required AuthStepEnum step}) = _AuthState;

  // Initial state is null user data and waiting for input
  factory AuthState.init() => AuthState(
      emailVM: EmailAuthVM(),
      step: AuthStepEnum.waitingForInput,
      linking: LinkAccountsViewModel.init());

  factory AuthState.fromJson(JsonMap json) => _$AuthStateFromJson(json);
}
