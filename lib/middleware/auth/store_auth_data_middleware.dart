import 'package:flireator/actions/auth/retrieve_flireator_data.dart';
import 'package:flireator/actions/auth/store_auth_data.dart';
import 'package:flireator/actions/auth/store_sign_in_step.dart';
import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:flireator/services/navigation_service.dart';
import 'package:flireator/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class StoreAuthDataMiddleware extends TypedMiddleware<AppState, StoreAuthData> {
  StoreAuthDataMiddleware(AuthService authService,
      NavigationService navigationService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'StoreAuthDataMiddleware');

          try {
            if (action.data == null) {
              // we are not signed in

              store.dispatch(StoreSignInStep(step: SignInStep.waitingForInput));
            } else {
              // we are signed in

              store.dispatch(
                  StoreSignInStep(step: SignInStep.retrievingFlireatorData));
              store.dispatch(
                  RetrieveFlireatorData(userId: store.state.authData.uid));

              if (store.state.gitHubToken == null) {
                // we have no token

                if (action.data.hasGitHub) {
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
