import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/get_authorized.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/services/platform_service.dart';
import 'package:uuid/uuid.dart';

class GetAuthorizedMiddleware extends TypedMiddleware<AppState, GetAuthorized> {
  GetAuthorizedMiddleware(
      DatabaseService databaseService, PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          await databaseService.updateAuthorizationStep(
              provider: action.toAccess,
              uid: store.state.authUserData.uid,
              step: AuthorizationStep.gettingAuthorized);

          final unguessable = Uuid().v1();

          // TODO: save unguessable to new/uid/authorizing so cloud functions
          // can match unguessable to firebase UID

          await platformService.getAuthorized(
              provider: action.toAccess, state: unguessable);
        });
}
