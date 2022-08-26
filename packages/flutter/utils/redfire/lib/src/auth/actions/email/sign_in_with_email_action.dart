import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../../types.dart';

part 'sign_in_with_email_action.freezed.dart';
part 'sign_in_with_email_action.g.dart';

@freezed
class SignInWithEmailAction with _$SignInWithEmailAction, ReduxAction {
  const SignInWithEmailAction._();
  const factory SignInWithEmailAction(String password) = _SignInWithEmailAction;

  factory SignInWithEmailAction.fromJson(JsonMap json) =>
      _$SignInWithEmailActionFromJson(json);

  @override
  String get typeName => 'SignInWithEmailAction';
}
