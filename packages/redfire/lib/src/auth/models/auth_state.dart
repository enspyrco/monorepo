import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/link-providers/models/link_accounts_view_model.dart';
import 'package:redfire/src/auth/models/email_auth_v_m.dart';
import 'package:redfire/src/auth/models/id_token_result.dart';
import 'package:redfire/src/types/typedefs.dart';
import 'package:redfire/types.dart';

import '../enums/auth_step_enum.dart';
import 'auth_user_data.dart';

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
