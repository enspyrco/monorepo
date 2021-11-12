import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'sign_up_with_email_action.freezed.dart';
part 'sign_up_with_email_action.g.dart';

@freezed
class SignUpWithEmailAction with _$SignUpWithEmailAction, ReduxAction {
  SignUpWithEmailAction._();
  factory SignUpWithEmailAction(String password) = _SignUpWithEmailAction;

  factory SignUpWithEmailAction.fromJson(JsonMap json) =>
      _$SignUpWithEmailActionFromJson(json);

  @override
  String get typeName => 'SignUpWithEmailAction';
}
