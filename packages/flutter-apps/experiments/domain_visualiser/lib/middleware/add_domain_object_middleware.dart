import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';

import '../actions/add_domain_object_action.dart';
import '../app_state.dart';
import '../models/class_box.dart';

class AddDomainObjectMiddleware
    extends TypedMiddleware<AppState, AddDomainObjectAction> {
  AddDomainObjectMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final userId = RedFireLocator.getAuthService().getCurrentUserId();

            final object = (action.object as ClassBox).copyWith(userId: userId);

            await RedFireLocator.getDatabaseService().setDocument(
                at: 'domain-objects/${object.id}', to: object.toJson());
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
