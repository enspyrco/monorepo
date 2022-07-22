import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';

import '../actions/update_domain_object_action.dart';
import '../app_state.dart';

class UpdateDomainObjectMiddleware
    extends TypedMiddleware<AppState, UpdateDomainObjectAction> {
  UpdateDomainObjectMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            await RedFireLocator.getFirestoreService().updateDocument(
                at: 'domain-objects/${action.object.id}',
                to: action.object.toJson());
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
