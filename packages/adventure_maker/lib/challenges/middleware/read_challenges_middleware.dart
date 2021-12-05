import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/challenges/actions/read_challenges_action.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/actions/set_adventure_nodes_action.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class ReadChallengesMiddleware
    extends TypedMiddleware<AppState, ReadChallengesAction> {
  ReadChallengesMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getDatabaseService();
            var jsonList = await service.getDocuments(
                at: 'challenges',
                where: 'parentIds',
                arrayContains: store.state.adventures.selected!);

            var challenges = jsonList
                .map<ChallengeModel>(
                    (json) => ChallengeModel.fromJson(json as JsonMap))
                .toISet();

            store.dispatch(SetAdventureNodesAction(challenges));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
