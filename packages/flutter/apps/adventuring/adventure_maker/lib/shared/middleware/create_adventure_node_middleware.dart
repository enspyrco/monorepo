import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/create_adventure_node_action.dart';

class CreateAdventureNodeMiddleware
    extends TypedMiddleware<AppState, CreateAdventureNodeAction> {
  CreateAdventureNodeMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            var uid = store.state.auth.userData?.uid;
            if (uid == null) return;

            var service = RedFireLocator.getFirestoreService();

            if (store.state.adventures.selected == null) {
              await service.createDocument(at: 'adventures', from: {
                'ownerIds': [uid],
                'name': action.name
              });
              return;
            }

            if (store.state.challenges.selected == null) {
              await service.createDocument(at: 'challenges', from: {
                'ownerIds': [uid],
                'name': action.name,
                'parentIds': [store.state.adventures.selected!.id]
              });

              return;
            }

            if (store.state.tasks.selected == null) {
              await service.createDocument(at: 'tasks', from: {
                'ownerIds': [uid],
                'name': action.name,
                'parentIds': [store.state.challenges.selected!.id]
              });

              return;
            }

            if (store.state.steps.selected == null) {
              await service.createDocument(at: 'steps', from: {
                'ownerIds': [uid],
                'name': action.name,
                'parentIds': [store.state.tasks.selected!.id]
              });

              return;
            }
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
