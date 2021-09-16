import 'package:firebase_auth/firebase_auth.dart';
import 'package:redfire/src/auth/actions/email/get_providers_for_email_action.dart';
import 'package:redfire/src/auth/actions/email/set_email_action.dart';
import 'package:redfire/src/auth/actions/email/set_providers_for_email_action.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';

class GetProvidersForEmailMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, GetProvidersForEmailAction> {
  GetProvidersForEmailMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getAuthService();

            store.dispatch(SetEmailAction(action.email));

            final methods =
                await service.retrieveSignInMethodsFor(action.email);

            store.dispatch(SetProvidersForEmailAction(methods));
          } catch (error, trace) {
            if (error is FirebaseAuthException &&
                error.code == 'invalid-email') {
              store.dispatch(SetEmailAction(null));
            }
            store.dispatchProblem(error, trace);
          }
        });
}
