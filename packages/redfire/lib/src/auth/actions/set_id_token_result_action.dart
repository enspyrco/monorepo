import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/models/id_token_result.dart';
import 'package:redfire/types.dart';

part 'set_id_token_result_action.freezed.dart';
part 'set_id_token_result_action.g.dart';

@freezed
class SetIdTokenResultAction with _$SetIdTokenResultAction, ReduxAction {
  SetIdTokenResultAction._();
  factory SetIdTokenResultAction(IdTokenResult result) =
      _SetIdTokenResultAction;

  factory SetIdTokenResultAction.fromJson(JsonMap json) =>
      _$SetIdTokenResultActionFromJson(json);

  @override
  String get typeName => 'SetIdTokenResultAction';
}
