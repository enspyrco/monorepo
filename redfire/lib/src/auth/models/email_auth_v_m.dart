import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/enums/email_sign_in_step_enum.dart';
import 'package:redfire/types.dart';

part 'email_auth_v_m.freezed.dart';
part 'email_auth_v_m.g.dart';

@freezed
class EmailAuthVM with _$EmailAuthVM, ReduxModel {
  factory EmailAuthVM({
    String? email,
    @Default(EmailSignInStepEnum.waitingForEmail)
        EmailSignInStepEnum emailSignInStep,
  }) = _EmailAuthVM;

  factory EmailAuthVM.fromJson(JsonMap json) => _$EmailAuthVMFromJson(json);
}
