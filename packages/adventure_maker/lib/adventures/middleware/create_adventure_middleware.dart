import 'package:adventure_maker/adventures/actions/create_adventure_action.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';

class CreateAdventureMiddleware
    extends TypedMiddleware<AppState, CreateAdventureAction> {
  CreateAdventureMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            var uid = store.state.auth.userData?.uid;
            if (uid == null) return;

            var service = RedFireLocator.getDatabaseService();
            await service.createDocument(at: 'adventures', from: {
              'ownerIds': [uid],
              'name': action.name,
            });
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
