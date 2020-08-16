import 'package:flireator/actions/auth/store_auth_step.dart';
import 'package:flireator/actions/auth/store_git_hub_token.dart';
import 'package:flireator/actions/auth/store_user_data.dart';
import 'package:flireator/enums/auth/auth_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:flireator/services/navigation_service.dart';
import 'package:flireator/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class StoreUserDataMiddleware extends TypedMiddleware<AppState, StoreUserData> {
  StoreUserDataMiddleware(AuthService authService,
      NavigationService navigationService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'StoreUserDataMiddleware');

          try {
            if (action.userData == null) {
              // we are not signed in

              if (store.state.authStep == AuthStep.signingOut) {
                // user has just signed out so reset UI
                // navigationService.popHome();
              } else {
                store.dispatch(StoreAuthStep(step: AuthStep.waitingForInput));
              }
            } else {
              // we are signed in

              if (store.state.gitHubToken == null) {
                // we have no token

                if (action.userData.hasGitHub) {
                  // we have signed in with github so retrieve the stored token
                  store.dispatch(
                      StoreAuthStep(step: AuthStep.retrievingStoredToken));
                  final token = await databaseService
                      .retrieveStoredToken(action.userData.uid);
                  store.dispatch(StoreGitHubToken(token: token));
                } else {
                  // connect to the database to see if there is a token there
                  // store.dispatch(
                  //     StoreAuthStep(step: AuthStep.listeningForTempToken));
                  // databaseService.connectTempTokenToStore(
                  //     uid: action.userData.uid);
                }
              }
            }
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
