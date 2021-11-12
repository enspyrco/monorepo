import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/link-providers/enums/linking_account_enum.dart';
import 'package:redfire/types.dart';

part 'update_link_accounts_view_action.freezed.dart';
part 'update_link_accounts_view_action.g.dart';

@freezed
class UpdateLinkAccountsViewAction
    with _$UpdateLinkAccountsViewAction, ReduxAction {
  UpdateLinkAccountsViewAction._();
  const factory UpdateLinkAccountsViewAction(
      {required ProvidersEnum provider,
      required LinkingStateEnum state}) = _UpdateLinkAccountsViewAction;

  factory UpdateLinkAccountsViewAction.fromJson(JsonMap json) =>
      _$UpdateLinkAccountsViewActionFromJson(json);

  @override
  String get typeName => 'UpdateLinkAccountsViewAction';
}
