import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/enums/auth_step_enum.dart';
import 'package:redfire/src/types/redux_action.dart';

part 'store_auth_step_action.freezed.dart';
part 'store_auth_step_action.g.dart';

@freezed
class StoreAuthStepAction with _$StoreAuthStepAction, ReduxAction {
  factory StoreAuthStepAction(AuthStepEnum step) = _StoreAuthStepAction;

  factory StoreAuthStepAction.contactingApple() =>
      StoreAuthStepAction(AuthStepEnum.contactingApple);
  factory StoreAuthStepAction.contactingGoogle() =>
      StoreAuthStepAction(AuthStepEnum.contactingGoogle);
  factory StoreAuthStepAction.signingInWithFirebase() =>
      StoreAuthStepAction(AuthStepEnum.signingInWithFirebase);
  factory StoreAuthStepAction.waitingForInput() =>
      StoreAuthStepAction(AuthStepEnum.waitingForInput);

  factory StoreAuthStepAction.fromJson(Map<String, Object?> json) =>
      _$StoreAuthStepActionFromJson(json);
}
