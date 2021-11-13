import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'link_account_action.freezed.dart';
part 'link_account_action.g.dart';

@freezed
class LinkAccountAction with _$LinkAccountAction, ReduxAction {
  const LinkAccountAction._();
  const factory LinkAccountAction(ProvidersEnum provider) = _LinkAccountAction;

  factory LinkAccountAction.fromJson(JsonMap json) =>
      _$LinkAccountActionFromJson(json);

  @override
  String get typeName => 'LinkAccountAction';
}
