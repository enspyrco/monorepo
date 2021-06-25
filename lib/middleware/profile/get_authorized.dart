import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/get_authorized_action.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/extensions/redux_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/services/platform_service.dart';
import 'package:uuid/uuid.dart';

class GetAuthorizedMiddleware
    extends TypedMiddleware<AppState, GetAuthorizedAction> {
  GetAuthorizedMiddleware(
      DatabaseService databaseService, PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          try {
            await databaseService.updateAuthorizationStep(
                provider: action.provider,
                uid: store.state.authUserData?.uid ?? '-',
                step: AuthorizationStep.gettingAuthorized);

            // can improve security by saving to database and sending in 'state'
            final unguessable = const Uuid().v1();

            await platformService.getAuthorized(
                provider: action.provider, state: unguessable);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
