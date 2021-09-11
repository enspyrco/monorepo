import 'package:firebase_auth/firebase_auth.dart';
import 'package:redfire/src/auth/actions/email/check_sign_in_methods_for_email_action.dart';
import 'package:redfire/src/auth/actions/email/store_email_action.dart';
import 'package:redfire/src/auth/actions/email/store_sign_in_methods_for_email_action.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';

class CheckSignInMethodsForEmailMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, CheckSignInMethodsForEmailAction> {
  CheckSignInMethodsForEmailMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getAuthService();

            store.dispatch(StoreEmailAction(action.email));

            final methods =
                await service.retrieveSignInMethodsFor(action.email);

            store.dispatch(StoreSignInMethodsForEmailAction(methods));
          } catch (error, trace) {
            if (error is FirebaseAuthException &&
                error.code == 'invalid-email') {
              store.dispatch(StoreEmailAction(null));
            }
            store.dispatchProblem(error, trace);
          }
        });
}
