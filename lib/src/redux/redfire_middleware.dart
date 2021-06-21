import 'package:redfire/src/auth/middleware/observe_auth_state_middleware.dart';
import 'package:redfire/src/auth/middleware/sign_in_with_apple_middleware.dart';
import 'package:redfire/src/auth/middleware/sign_in_with_google_middleware.dart';
import 'package:redfire/src/platform/middleware/detect_platform.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redfire/src/utils/dev_tools_middleware.dart';
import 'package:redux/redux.dart';

/// Middleware is used for a variety of things that are performed when actions
/// are dispatched to the Store.  For example: Logging, Async calls (database,
/// network), Calling to system frameworks.
///
/// The middleawre can also perform another action using the [NextDispatcher]
List<Middleware<T>> redfireMiddleware<T extends RedFireState>() => [
      ObserveAuthStateMiddleware<T>(),
      SignInWithAppleMiddleware<T>(),
      SignInWithGoogleMiddleware<T>(),
      DetectPlatformMiddleware<T>(),
      DevToolsMiddleware<T>(),
    ];
