import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/get_authorized.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';

class GetAuthorizedMiddleware extends TypedMiddleware<AppState, GetAuthorized> {
  GetAuthorizedMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final accessCredentials = await authService.getAuthorized();

          print(accessCredentials.refreshToken);

          // databaseService.saveAuthTokens(
          //     uid: store.state.authUserData.uid,
          //     accessToken: accessCredentials.accessToken,
          //     refreshToken: accessCredentials.refreshToken);
        });
}
