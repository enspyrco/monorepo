import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/link-providers/enums/linking_account_enum.dart';
import 'package:redfire/types.dart';

part 'link_accounts_view_model.freezed.dart';
part 'link_accounts_view_model.g.dart';

@freezed
class LinkAccountsViewModel with _$LinkAccountsViewModel, ReduxModel {
  const factory LinkAccountsViewModel(
      IMap<ProvidersEnum, LinkingStateEnum> providers) = _LinkAccountsViewModel;

  factory LinkAccountsViewModel.fromJson(JsonMap json) =>
      _$LinkAccountsViewModelFromJson(json);
}
