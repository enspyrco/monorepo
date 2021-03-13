import 'package:flireator/actions/git_hub/launch_git_hub_auth.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/platform_service.dart';
import 'package:redux/redux.dart';

class LaunchGitHubAuthMiddleware
    extends TypedMiddleware<AppState, LaunchGitHubAuth> {
  LaunchGitHubAuthMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          store.dispatch(Set);
          await platformService.launchGitHubAuth(state: null);
        });
}
