import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../redux_action.dart';

part 'store_sign_in_step_action.freezed.dart';
part 'store_sign_in_step_action.g.dart';

@freezed
class StoreSignInStepAction with _$StoreSignInStepAction, ReduxAction {
  factory StoreSignInStepAction({required SignInStep step}) =
      _StoreSignInStepAction;

  factory StoreSignInStepAction.fromJson(Map<String, dynamic> json) =>
      _$StoreSignInStepActionFromJson(json);
}
