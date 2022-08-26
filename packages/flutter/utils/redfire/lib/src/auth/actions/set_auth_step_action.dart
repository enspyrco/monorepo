import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../types/redux_action.dart';
import '../enums/auth_step_enum.dart';

part 'set_auth_step_action.freezed.dart';
part 'set_auth_step_action.g.dart';

@freezed
class SetAuthStepAction with _$SetAuthStepAction, ReduxAction {
  const SetAuthStepAction._();
  const factory SetAuthStepAction(AuthStepEnum step) = _SetAuthStepAction;

  factory SetAuthStepAction.contactingApple() =>
      const SetAuthStepAction(AuthStepEnum.contactingApple);
  factory SetAuthStepAction.contactingGoogle() =>
      const SetAuthStepAction(AuthStepEnum.contactingGoogle);
  factory SetAuthStepAction.signingInWithFirebase() =>
      const SetAuthStepAction(AuthStepEnum.signingInWithFirebase);
  factory SetAuthStepAction.waitingForInput() =>
      const SetAuthStepAction(AuthStepEnum.waitingForInput);

  factory SetAuthStepAction.fromJson(JsonMap json) =>
      _$SetAuthStepActionFromJson(json);

  @override
  String get typeName => 'SetAuthStepAction';
}
