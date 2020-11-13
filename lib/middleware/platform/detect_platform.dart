import 'package:redux/redux.dart';
import 'package:the_process/actions/platform/detect_platform.dart';
import 'package:the_process/actions/settings/update_settings.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/platform_service.dart';

class DetectPlatformMiddleware
    extends TypedMiddleware<AppState, DetectPlatform> {
  DetectPlatformMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          final platform = platformService.detectPlatform();
          store.dispatch(UpdateSettings(platform: platform));
        });
}
