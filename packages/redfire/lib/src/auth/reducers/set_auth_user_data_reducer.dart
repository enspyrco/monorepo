import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/src/auth/actions/set_auth_user_data_action.dart';
import 'package:redfire/src/auth/constants/auth_provider_names.dart';
import 'package:redfire/src/auth/enums/providers_enum.dart';
import 'package:redfire/src/auth/link-providers/enums/linking_account_enum.dart';
import 'package:redfire/src/auth/link-providers/models/link_accounts_view_model.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class SetAuthUserDataReducer<T extends RedFireState>
    extends TypedReducer<T, SetAuthUserDataAction> {
  SetAuthUserDataReducer()
      : super((state, action) {
          var newStateOf = <ProvidersEnum, LinkingStateEnum>{
            for (var v in ProvidersEnum.values) v: LinkingStateEnum.unlinked
          };

          for (var entry in state.auth.linking.stateOf.entries) {
            if (entry.value == LinkingStateEnum.linking) {
              newStateOf[entry.key] = LinkingStateEnum.linking;
            }
          }

          if (action.authUserData != null) {
            for (var authProvider in action.authUserData!.providers) {
              newStateOf[authProviderEnumFrom[authProvider.providerId]!] =
                  LinkingStateEnum.linked;
            }
          }
          return ((state as dynamic).copyWith.auth(
              userData: action.authUserData,
              linking: LinkAccountsViewModel(newStateOf.lock)) as T);
        });
}
