import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../../types.dart';
import '../enums/linking_account_enum.dart';

part 'update_link_accounts_view_action.freezed.dart';
part 'update_link_accounts_view_action.g.dart';

@freezed
class UpdateLinkAccountsViewAction
    with _$UpdateLinkAccountsViewAction, ReduxAction {
  const UpdateLinkAccountsViewAction._();
  const factory UpdateLinkAccountsViewAction(
      {required ProvidersEnum provider,
      required LinkingStateEnum state}) = _UpdateLinkAccountsViewAction;

  factory UpdateLinkAccountsViewAction.fromJson(JsonMap json) =>
      _$UpdateLinkAccountsViewActionFromJson(json);

  @override
  String get typeName => 'UpdateLinkAccountsViewAction';
}
