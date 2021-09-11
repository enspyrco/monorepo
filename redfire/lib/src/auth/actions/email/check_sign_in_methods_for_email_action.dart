import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'check_sign_in_methods_for_email_action.freezed.dart';
part 'check_sign_in_methods_for_email_action.g.dart';

@freezed
class CheckSignInMethodsForEmailAction
    with _$CheckSignInMethodsForEmailAction, ReduxAction {
  factory CheckSignInMethodsForEmailAction(String email) =
      _CheckSignInMethodsForEmailAction;

  factory CheckSignInMethodsForEmailAction.fromJson(JsonMap json) =>
      _$CheckSignInMethodsForEmailActionFromJson(json);
}
