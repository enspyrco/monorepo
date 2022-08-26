import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../types.dart';

part 'sign_out_action.freezed.dart';
part 'sign_out_action.g.dart';

@freezed
class SignOutAction with _$SignOutAction, ReduxAction {
  const SignOutAction._();
  const factory SignOutAction() = _SignOutAction;

  factory SignOutAction.fromJson(JsonMap json) => _$SignOutActionFromJson(json);

  @override
  String get typeName => 'SignOutAction';
}
