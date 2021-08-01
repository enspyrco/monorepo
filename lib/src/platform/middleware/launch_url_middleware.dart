import 'package:redfire/src/redux/extensions/store_extensions.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import '../../../actions.dart';

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
