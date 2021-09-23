import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'get_id_token_action.freezed.dart';
part 'get_id_token_action.g.dart';

@freezed
class GetIdTokenAction with _$GetIdTokenAction, ReduxAction {
  factory GetIdTokenAction() = _GetIdTokenAction;

  factory GetIdTokenAction.fromJson(JsonMap json) =>
      _$GetIdTokenActionFromJson(json);
}
