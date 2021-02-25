import 'package:the_process/actions/platform/launch_url.dart';
import 'package:the_process/actions/problems/add_problem.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:the_process/services/platform_service.dart';

class LaunchURLMiddleware extends TypedMiddleware<AppState, LaunchUrl> {
  LaunchURLMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          try {
            await platformService.launchURL(action.url);
          } catch (error, trace) {
            store.dispatch(AddProblem(
                errorString: error.toString(), traceString: trace.toString()));
          }
        });
}
