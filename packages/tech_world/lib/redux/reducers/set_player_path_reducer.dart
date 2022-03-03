import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/set_player_path_action.dart';

class SetPlayerPathReducer extends TypedReducer<AppState, SetPlayerPathAction> {
  SetPlayerPathReducer()
      : super(
          (state, action) => state.copyWith.game(
              playerPaths: (state.game.playerPaths
                  .add(action.message.userId, action.message.points))),
        );
}
