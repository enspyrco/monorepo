import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/redfire.dart';
import 'package:redfire/widgets.dart';
import 'package:redux/redux.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

import 'app_state.dart';
import 'challenges/reducers/dismiss_challenge.dart';
import 'challenges/reducers/start_challenge_reducer.dart';
import 'game/tech_world_game.dart';
import 'redfire_options.dart';
import 'redux/middleware/set_auth_user_data_middleware.dart';
import 'redux/reducers/set_other_player_ids_reducer.dart';
import 'redux/reducers/set_player_path_reducer.dart';
import 'redux/services/locator.dart';
import 'shared/pages/main_page.dart';

void main() {
  // We create the store separately so we can pass the onChange stream into
  // the TechWorldGame object.
  final store = Store<AppState>(
    (redfireReducers<AppState>() +
            [
              SetOtherPlayerIdsReducer(),
              SetPlayerPathReducer(),
              StartChallengeReducer(),
              DismissChallengeReducer()
            ])
        .combine(),
    initialState: AppState.init(),
    middleware: [
      ...redfireMiddlewares(),
      ...[SetAuthUserDataMiddleware()]
    ],
  );

  final _networkingService = Locator.provideDefaultNetworkingService();
  final _serverController = StreamController<ServerMessage>();
  // TODO: add try/catch blocks and onError callback
  _serverController.stream.listen((message) {
    // print(message);
    _networkingService.publish(message);
  });

  final game = TechWorldGame(
      appStateChanges: store.onChange, serverSink: _serverController.sink);

  runApp(AppWidget<AppState>.fromStore(
      config: RedFireOptions.currentPlatform,
      initializedStore: store,
      title: 'Tech World',
      mainPage: MainPage(game: game)));
}
