import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/enums/auth/auth_step.dart';

part 'store_auth_step_action.freezed.dart';
part 'store_auth_step_action.g.dart';

@freezed
class StoreAuthStepAction with _$StoreAuthStepAction, ReduxAction {
  factory StoreAuthStepAction({required AuthStep step}) = _StoreAuthStepAction;

  factory StoreAuthStepAction.fromJson(Map<String, dynamic> json) =>
      _$StoreAuthStepActionFromJson(json);
}
