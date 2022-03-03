import 'package:redux/redux.dart';

import '../../../extensions.dart';
import '../../../services.dart';
import '../../../types.dart';
import '../../settings/enums/platform_enum.dart';
import '../actions/sign_in_with_git_hub_action.dart';

class SignInWithGitHubMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SignInWithGitHubAction> {
  SignInWithGitHubMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            if (store.state.settings.platform == PlatformsEnum.web) {
              final service = RedFireLocator.getAuthService();
              await service.signInWithGithubOnWeb();
            }
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
