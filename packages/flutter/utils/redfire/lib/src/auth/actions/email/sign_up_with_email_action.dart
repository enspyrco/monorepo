import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../types.dart';

part 'sign_up_with_email_action.freezed.dart';
part 'sign_up_with_email_action.g.dart';

@freezed
class SignUpWithEmailAction with _$SignUpWithEmailAction, ReduxAction {
  const SignUpWithEmailAction._();
  const factory SignUpWithEmailAction(String password) = _SignUpWithEmailAction;

  factory SignUpWithEmailAction.fromJson(JsonMap json) =>
      _$SignUpWithEmailActionFromJson(json);

  @override
  String get typeName => 'SignUpWithEmailAction';
}
