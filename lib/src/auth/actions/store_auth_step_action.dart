import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/enums/authentication_enum.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'store_auth_step_action.freezed.dart';
part 'store_auth_step_action.g.dart';

@freezed
class StoreAuthStepAction with _$StoreAuthStepAction, ReduxAction {
  factory StoreAuthStepAction(AuthenticationEnum step) = _StoreAuthStepAction;

  factory StoreAuthStepAction.contactingApple() =>
      StoreAuthStepAction(AuthenticationEnum.contactingApple);
  factory StoreAuthStepAction.contactingGoogle() =>
      StoreAuthStepAction(AuthenticationEnum.contactingGoogle);
  factory StoreAuthStepAction.signingInWithFirebase() =>
      StoreAuthStepAction(AuthenticationEnum.signingInWithFirebase);
  factory StoreAuthStepAction.waitingForInput() =>
      StoreAuthStepAction(AuthenticationEnum.waitingForInput);

  factory StoreAuthStepAction.fromJson(JsonMap json) =>
      _$StoreAuthStepActionFromJson(json);
}
