import 'package:freezed_annotation/freezed_annotation.dart';

import '../../types/redux_action.dart';
import '../../types/typedefs.dart';

part 'sign_in_with_google_action.freezed.dart';
part 'sign_in_with_google_action.g.dart';

@freezed
class SignInWithGoogleAction with _$SignInWithGoogleAction, ReduxAction {
  const SignInWithGoogleAction._();
  const factory SignInWithGoogleAction() = _SignInWithGoogleAction;

  factory SignInWithGoogleAction.fromJson(JsonMap json) =>
      _$SignInWithGoogleActionFromJson(json);

  @override
  String get typeName => 'SignInWithGoogleAction';
}
