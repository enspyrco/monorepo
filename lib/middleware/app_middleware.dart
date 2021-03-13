import 'package:flireator/middleware/auth/connect_auth_state_middleware.dart';
import 'package:flireator/middleware/auth/plumb_services_middleware.dart';
import 'package:flireator/middleware/auth/request_github_auth_middleware.dart';
import 'package:flireator/middleware/auth/retrieve_flireator_data_middleware.dart';
import 'package:flireator/middleware/auth/sign_in_with_apple_middleware.dart';
import 'package:flireator/middleware/auth/sign_out_middleware.dart';
import 'package:flireator/middleware/auth/store_auth_data_middleware.dart';
import 'package:flireator/middleware/git_hub/retrieve_git_hub_repositories_middleware.dart';
import 'package:flireator/middleware/navigation/launch_url_middleware.dart';
import 'package:flireator/middleware/navigation/navigate_to_profile_middleware.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:flireator/services/git_hub_service.dart';
import 'package:flireator/services/navigation_service.dart';
import 'package:flireator/services/platform_service.dart';
import 'package:redux/redux.dart';

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createAppMiddleware({
  AuthService authService,
  GitHubService gitHubService,
  DatabaseService databaseService,
  PlatformService platformService,
  NavigationService navigationService,
}) {
  return [
    // Auth
    ConnectAuthStateMiddleware(authService),
    PlumbServicesMiddleware(authService, databaseService, navigationService),
    RequestGitHubAuthMiddleware(platformService),
    RetrieveFlireatorDataMiddleware(databaseService),
    SignInWithAppleMiddleware(authService, databaseService),
    SignOutMiddleware(authService, navigationService),
    StoreAuthDataMiddleware(authService, navigationService, databaseService),
    // GitHub
    RetrieveGitHubRepositoriesMiddleware(gitHubService),
    // Navigation
    LaunchURLMiddleware(platformService),
    NavigateToProfileMiddleware(navigationService),
  ];
}
