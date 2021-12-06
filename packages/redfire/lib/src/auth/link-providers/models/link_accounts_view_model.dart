import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/link-providers/enums/linking_account_enum.dart';
import 'package:redfire/types.dart';

part 'link_accounts_view_model.freezed.dart';
part 'link_accounts_view_model.g.dart';

@freezed
class LinkAccountsViewModel with _$LinkAccountsViewModel, ReduxState {
  static const String className = 'LinkAccountsViewModel';

  const LinkAccountsViewModel._();
  const factory LinkAccountsViewModel(
      IMap<ProvidersEnum, LinkingStateEnum> stateOf) = _LinkAccountsViewModel;

  factory LinkAccountsViewModel.fromJson(JsonMap json) =>
      _$LinkAccountsViewModelFromJson(json);

  factory LinkAccountsViewModel.init() =>
      LinkAccountsViewModel(IMap<ProvidersEnum, LinkingStateEnum>());

  @override
  String get typeName => className;
}
