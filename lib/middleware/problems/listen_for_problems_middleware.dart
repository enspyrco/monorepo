import 'package:flireator/actions/problems/listen_for_problems.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/navigation_service.dart';
import 'package:redux/redux.dart';

class ListenForProblemsMiddleware
    extends TypedMiddleware<AppState, ListenForProblems> {
  ListenForProblemsMiddleware(NavigationService navigationService)
      : super((store, action, next) async {
          next(action);

          store.onChange.listen((state) {
            if (state.displayProblem != null &&
                !navigationService.displayingProblem) {
              navigationService.display(state.displayProblem!);
            }
          });
        });
}
