import 'package:redux/redux.dart';
import 'package:the_process/actions/platform/detect_platform_action.dart';
import 'package:the_process/actions/problems/add_problem_action.dart';
import 'package:the_process/actions/settings/update_settings_action.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/platform_service.dart';

class DetectPlatformMiddleware
    extends TypedMiddleware<AppState, DetectPlatformAction> {
  DetectPlatformMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          try {
            final platform = platformService.detectPlatform();
            store.dispatch(UpdateSettingsAction(platform: platform));
          } catch (error, trace) {
            store.dispatch(AddProblemAction(
                errorString: error.toString(), traceString: trace.toString()));
          }
        });
}
