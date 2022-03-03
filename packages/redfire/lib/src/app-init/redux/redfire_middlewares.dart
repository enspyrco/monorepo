import 'package:redux/redux.dart';

import '../../auth/middleware/get_id_token_middleware.dart';
import '../../auth/middleware/get_providers_for_email_middleware.dart';
import '../../auth/middleware/observe_auth_state_middleware.dart';
import '../../auth/middleware/sign_in_with_apple_middleware.dart';
import '../../auth/middleware/sign_in_with_email_middleware.dart';
import '../../auth/middleware/sign_in_with_git_hub.dart';
import '../../auth/middleware/sign_in_with_google_middleware.dart';
import '../../auth/middleware/sign_out_middleware.dart';
import '../../auth/middleware/sign_up_with_email_middleware.dart';
import '../../platform/middleware/detect_platform_middleware.dart';
import '../../platform/middleware/launch_url_middleware.dart';
import '../../types/red_fire_state.dart';
import '../../utils/dev_tools_middleware.dart';

/// Middleware is used for a variety of things that are performed when actions
/// are dispatched to the Store.  For example: Logging, Async calls (database,
/// network), Calling to system frameworks.
///
/// The middleawre can also perform another action using the [NextDispatcher]
List<Middleware<T>> redfireMiddlewares<T extends RedFireState>() => [
      // Auth
      ObserveAuthStateMiddleware<T>(),
      SignInWithAppleMiddleware<T>(),
      SignInWithGoogleMiddleware<T>(),
      SignOutMiddleware<T>(),
      GetProvidersForEmailMiddleware<T>(),
      SignUpWithEmailMiddleware<T>(),
      SignInWithEmailMiddleware<T>(),
      SignInWithGitHubMiddleware<T>(),
      GetIdTokenMiddleware<T>(),

      // DevTools
      DevToolsMiddleware<T>(),

      // Platform
      DetectPlatformMiddleware<T>(),
      LaunchUrlMiddleware<T>(),
    ];
