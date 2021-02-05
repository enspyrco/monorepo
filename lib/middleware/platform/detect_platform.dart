import 'package:redux/redux.dart';
import 'package:the_process/actions/platform/detect_platform.dart';
import 'package:the_process/actions/problems/add_problem.dart';
import 'package:the_process/actions/settings/update_settings.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/platform_service.dart';

class DetectPlatformMiddleware
    extends TypedMiddleware<AppState, DetectPlatform> {
  DetectPlatformMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          try {
            final platform = platformService.detectPlatform();
            store.dispatch(UpdateSettings(platform: platform));
          } catch (error, trace) {
            store.dispatch(AddProblem(
                errorString: error.toString(), traceString: trace.toString()));
          }
        });
}
