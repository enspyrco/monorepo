import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../types/redux_action.dart';

part 'sign_in_with_apple_action.freezed.dart';
part 'sign_in_with_apple_action.g.dart';

@freezed
class SignInWithAppleAction with _$SignInWithAppleAction, ReduxAction {
  const SignInWithAppleAction._();
  const factory SignInWithAppleAction() = _SignInWithAppleAction;

  factory SignInWithAppleAction.fromJson(JsonMap json) =>
      _$SignInWithAppleActionFromJson(json);

  @override
  String get typeName => 'SignInWithAppleAction';
}
