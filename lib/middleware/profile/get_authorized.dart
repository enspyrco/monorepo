import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/get_authorized.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/auth/provider.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/services/platform_service.dart';

class GetAuthorizedMiddleware extends TypedMiddleware<AppState, GetAuthorized> {
  GetAuthorizedMiddleware(
      DatabaseService databaseService, PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          if (action.toAccess == Provider.google) {
            await databaseService.updateGoogleAuthorization(
                uid: store.state.authUserData.uid,
                step: AuthorizationStep.gettingAuthorized,
                authorized: false);

            await platformService.getAuthorized();
          }
        });
}
