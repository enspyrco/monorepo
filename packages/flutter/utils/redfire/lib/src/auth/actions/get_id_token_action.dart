import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../types.dart';

part 'get_id_token_action.freezed.dart';
part 'get_id_token_action.g.dart';

@freezed
class GetIdTokenAction with _$GetIdTokenAction, ReduxAction {
  const GetIdTokenAction._();
  const factory GetIdTokenAction() = _GetIdTokenAction;

  factory GetIdTokenAction.fromJson(JsonMap json) =>
      _$GetIdTokenActionFromJson(json);

  @override
  String get typeName => 'GetIdTokenAction';
}
