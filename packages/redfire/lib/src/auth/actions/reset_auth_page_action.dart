import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'reset_auth_page_action.freezed.dart';
part 'reset_auth_page_action.g.dart';

@freezed
class ResetAuthPageAction with _$ResetAuthPageAction, ReduxAction {
  ResetAuthPageAction._();
  factory ResetAuthPageAction() = _ResetAuthPageAction;

  factory ResetAuthPageAction.fromJson(JsonMap json) =>
      _$ResetAuthPageActionFromJson(json);

  @override
  String get typeName => 'ResetAuthPageAction';
}
