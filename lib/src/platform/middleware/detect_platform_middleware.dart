import 'package:redux/redux.dart';

import '../../../actions.dart';
import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';
import '../../utils/locator.dart';

class DetectPlatformMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, DetectPlatformAction> {
  DetectPlatformMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final platformService = Locator.getPlatformService();

            final platform = platformService.detectPlatform();
            store.dispatch(UpdateSettingsAction(platform: platform));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
