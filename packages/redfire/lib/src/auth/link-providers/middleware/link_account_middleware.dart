import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/src/auth/link-providers/actions/link_account_action.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class LinkAccountMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, LinkAccountAction> {
  LinkAccountMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getAuthService();

            service.linkGithub(token)

            store.dispatch();
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
