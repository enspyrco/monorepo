import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'sign_in_with_email_action.freezed.dart';
part 'sign_in_with_email_action.g.dart';

@freezed
class SignInWithEmailAction with _$SignInWithEmailAction, ReduxAction {
  SignInWithEmailAction._();
  factory SignInWithEmailAction(String password) = _SignInWithEmailAction;

  factory SignInWithEmailAction.fromJson(JsonMap json) =>
      _$SignInWithEmailActionFromJson(json);

  @override
  String get typeName => 'SignInWithEmailAction';
}
