import 'package:flireator/actions/auth/retrieve_flireator_data_action.dart';
import 'package:flireator/actions/auth/store_auth_data_action.dart';
import 'package:flireator/actions/auth/store_sign_in_step_action.dart';
import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:flireator/utils/problems_utils.dart';
import 'package:redux/redux.dart';
import 'package:flireator/extensions/auth/auth_data_extensions.dart';

class StoreAuthDataMiddleware
    extends TypedMiddleware<AppState, StoreAuthDataAction> {
  StoreAuthDataMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'StoreAuthDataMiddleware');

          try {
            if (action.data == null) {
              // we are not signed in

              store.dispatch(
                  StoreSignInStepAction(step: SignInStep.waitingForInput));
            } else {
              // we are signed in

              store.dispatch(StoreSignInStepAction(
                  step: SignInStep.retrievingFlireatorData));
              final uid = store.state.authData?.uid;
              if (uid == null) return;
              store.dispatch(RetrieveFlireatorDataAction(userId: uid));

              if (store.state.gitHubToken == null) {
                // we have no token

                if (action.data != null && action.data!.hasGitHub) {
                  // // we have signed in with github so retrieve the stored token
                  // store.dispatch(
                  //     StoreAuthStep(step: GitHubAuthStep.retrievingStoredToken));
                  // final token = await databaseService
                  //     .retrieveStoredToken(action.data.uid);
                  // store.dispatch(StoreGitHubToken(token: token));
                } else {
                  // connect to the database to see if there is a token there
                  // store.dispatch(
                  //     StoreAuthStep(step: AuthStep.listeningForTempToken));
                  // databaseService.connectTempTokenToStore(
                  //     uid: action.data.uid);
                }
              }
            }
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
