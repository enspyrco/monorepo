import 'package:redux/redux.dart';

import '../../../actions.dart';
import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';
import '../../utils/red_fire_locator.dart';

class LaunchUrlMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, LaunchUrlAction> {
  LaunchUrlMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final platformService = RedFireLocator.getPlatformService();

            await platformService.launchUrl(action.url);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
