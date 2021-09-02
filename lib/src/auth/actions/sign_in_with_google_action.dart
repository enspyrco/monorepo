import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'sign_in_with_google_action.freezed.dart';
part 'sign_in_with_google_action.g.dart';

@freezed
class SignInWithGoogleAction with _$SignInWithGoogleAction, ReduxAction {
  factory SignInWithGoogleAction() = _SignInWithGoogleAction;

  factory SignInWithGoogleAction.fromJson(JsonMap json) =>
      _$SignInWithGoogleActionFromJson(json);
}
