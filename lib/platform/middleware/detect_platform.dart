import 'package:redfire/actions/detect_platform_action.dart';
import 'package:redfire/actions/update_settings_action.dart';
import 'package:redfire/redux/extensions/store_extensions.dart';
import 'package:redfire/types/red_fire_state.dart';
import 'package:redfire/utils/locator.dart';
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
