import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types/redux_action.dart';

part 'sign_in_with_google_action.freezed.dart';
part 'sign_in_with_google_action.g.dart';

@freezed
class SignInWithGoogleAction with _$SignInWithGoogleAction, ReduxAction {
  factory SignInWithGoogleAction() = _SignInWithGoogleAction;

  factory SignInWithGoogleAction.fromJson(Map<String, Object?> json) =>
      _$SignInWithGoogleActionFromJson(json);
}
