import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../types.dart';
import '../models/id_token_result.dart';

part 'set_id_token_result_action.freezed.dart';
part 'set_id_token_result_action.g.dart';

@freezed
class SetIdTokenResultAction with _$SetIdTokenResultAction, ReduxAction {
  const SetIdTokenResultAction._();
  const factory SetIdTokenResultAction(IdTokenResult result) =
      _SetIdTokenResultAction;

  factory SetIdTokenResultAction.fromJson(JsonMap json) =>
      _$SetIdTokenResultActionFromJson(json);

  @override
  String get typeName => 'SetIdTokenResultAction';
}
