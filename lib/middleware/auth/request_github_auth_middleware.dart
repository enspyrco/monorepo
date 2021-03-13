import 'package:flireator/actions/auth/request_git_hub_auth.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/platform_service.dart';
import 'package:flireator/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class RequestGitHubAuthMiddleware
    extends TypedMiddleware<AppState, RequestGitHubAuth> {
  RequestGitHubAuthMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'RequestGitHubAuthMiddleware');

          try {
            // store.dispatch(
            //     StoreGitHubAuthStep(step: GitHubAuthStep.requestingGitHubAuth));
            // await platformService.redirectWithState(store.state.userData.uid);
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
