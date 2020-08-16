import 'package:flireator/actions/navigation/launch_url.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/platform_service.dart';
import 'package:redux/redux.dart';

class LaunchURLMiddleware extends TypedMiddleware<AppState, LaunchURL> {
  LaunchURLMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          await platformService.redirectTo(action.url);
        });
}
