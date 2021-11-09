import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/src/auth/actions/sign_in_with_git_hub_action.dart';
import 'package:redfire/src/settings/enums/platform_enum.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

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
