import 'package:redux/redux.dart';
import 'package:the_process/actions/platform/detect_platform_action.dart';
import 'package:the_process/actions/settings/update_settings_action.dart';
import 'package:the_process/extensions/redux_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/platform_service.dart';

class DetectPlatformMiddleware
    extends TypedMiddleware<AppState, DetectPlatformAction> {
  DetectPlatformMiddleware(
      AuthService authService, PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          try {
            final platform = platformService.detectPlatform();

            // AuthService needs to know platform to use correct auth plugins
            authService.platform = platform;

            store.dispatch(UpdateSettingsAction(platform: platform));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
