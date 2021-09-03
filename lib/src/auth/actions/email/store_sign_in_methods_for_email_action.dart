import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'store_sign_in_methods_for_email_action.freezed.dart';
part 'store_sign_in_methods_for_email_action.g.dart';

@freezed
class StoreSignInMethodsForEmailAction
    with _$StoreSignInMethodsForEmailAction, ReduxAction {
  factory StoreSignInMethodsForEmailAction(List<String> methods) =
      _StoreSignInMethodsForEmailAction;

  factory StoreSignInMethodsForEmailAction.fromJson(JsonMap json) =>
      _$StoreSignInMethodsForEmailActionFromJson(json);
}
