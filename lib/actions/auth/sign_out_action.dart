import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';

part 'sign_out_action.freezed.dart';
part 'sign_out_action.g.dart';

@freezed
class SignOutAction with _$SignOutAction, ReduxAction {
  factory SignOutAction() = _SignOutAction;

  factory SignOutAction.fromJson(Map<String, dynamic> json) =>
      _$SignOutActionFromJson(json);
}
