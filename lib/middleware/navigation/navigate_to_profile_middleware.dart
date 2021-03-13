import 'package:flireator/actions/navigation/navigate_to_profile.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/navigation_service.dart';
import 'package:redux/redux.dart';

class NavigateToProfileMiddleware
    extends TypedMiddleware<AppState, NavigateToProfile> {
  NavigateToProfileMiddleware(NavigationService navigationService)
      : super((store, action, next) async {
          next(action);

          await navigationService.navigateTo('/profile');
        });
}
