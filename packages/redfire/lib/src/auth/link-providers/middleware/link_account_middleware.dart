import 'package:redfire/extensions.dart';
import 'package:redfire/src/auth/link-providers/actions/link_account_action.dart';
import 'package:redfire/src/auth/link-providers/actions/update_link_accounts_view_action.dart';
import 'package:redfire/src/auth/link-providers/enums/linking_account_enum.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class LinkAccountMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, LinkAccountAction> {
  LinkAccountMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            store.dispatch(UpdateLinkAccountsViewAction(
                provider: action.provider, state: LinkingStateEnum.linking));

            // we are temporarily doing the github auth from the widget as the lib needs a context
            // final service = RedFireLocator.getAuthService();
            // service.linkGithub(token);

            // Note: when the AuthData providers list is updated, an action
            // is dispatched to clear the waiting state of the provider
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
