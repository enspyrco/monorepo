import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/redux_action.dart';

part 'sign_in_with_apple_action.freezed.dart';
part 'sign_in_with_apple_action.g.dart';

@freezed
class SignInWithAppleAction with _$SignInWithAppleAction, ReduxAction {
  factory SignInWithAppleAction() = _SignInWithAppleAction;

  factory SignInWithAppleAction.fromJson(Map<String, Object?> json) =>
      _$SignInWithAppleActionFromJson(json);
}
