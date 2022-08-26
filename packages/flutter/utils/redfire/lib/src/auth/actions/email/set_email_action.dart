import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../../types.dart';

part 'set_email_action.freezed.dart';
part 'set_email_action.g.dart';

@freezed
class SetEmailAction with _$SetEmailAction, ReduxAction {
  const SetEmailAction._();
  const factory SetEmailAction(String? text) = _SetEmailAction;

  factory SetEmailAction.fromJson(JsonMap json) =>
      _$SetEmailActionFromJson(json);

  @override
  String get typeName => 'SetEmailAction';
}
