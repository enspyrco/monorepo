import 'package:redfire/src/platform/actions/detect_platform_action.dart';
import 'package:redfire/src/redux/extensions/store_extensions.dart';
import 'package:redfire/src/settings/actions/update_settings_action.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redfire/src/utils/locator.dart';
import 'package:redux/redux.dart';

class DetectPlatformMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, DetectPlatformAction> {
  DetectPlatformMiddleware()
      : super((store, action, next) async {
          next(action);

          final platformService = Locator.getPlatformService();

          try {
            final platform = platformService.detectPlatform();
            store.dispatch(UpdateSettingsAction(platform: platform));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
