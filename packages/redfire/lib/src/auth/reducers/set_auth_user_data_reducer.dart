import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redux/redux.dart';

import '../../types/red_fire_state.dart';
import '../actions/set_auth_user_data_action.dart';
import '../enums/providers_enum.dart';
import '../link-providers/enums/linking_account_enum.dart';
import '../link-providers/models/link_accounts_view_model.dart';
import '../utils/constants/auth_provider_names.dart';

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
