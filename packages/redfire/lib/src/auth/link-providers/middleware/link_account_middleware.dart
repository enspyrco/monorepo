import 'package:redux/redux.dart';

import '../../../../extensions.dart';
import '../../../../types.dart';
import '../actions/link_account_action.dart';
import '../actions/update_link_accounts_view_action.dart';
import '../enums/linking_account_enum.dart';

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
