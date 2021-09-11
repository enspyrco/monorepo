import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/enums/authentication_enum.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'set_auth_step_action.freezed.dart';
part 'set_auth_step_action.g.dart';

@freezed
class SetAuthStepAction with _$SetAuthStepAction, ReduxAction {
  factory SetAuthStepAction(AuthenticationEnum step) = _SetAuthStepAction;

  factory SetAuthStepAction.contactingApple() =>
      SetAuthStepAction(AuthenticationEnum.contactingApple);
  factory SetAuthStepAction.contactingGoogle() =>
      SetAuthStepAction(AuthenticationEnum.contactingGoogle);
  factory SetAuthStepAction.signingInWithFirebase() =>
      SetAuthStepAction(AuthenticationEnum.signingInWithFirebase);
  factory SetAuthStepAction.waitingForInput() =>
      SetAuthStepAction(AuthenticationEnum.waitingForInput);

  factory SetAuthStepAction.fromJson(JsonMap json) =>
      _$SetAuthStepActionFromJson(json);
}
