import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:redfire/utils.dart';
import 'package:redfire/widgets.dart';

import 'adventures/actions/read_adventures_action.dart';
import 'adventures/middleware/read_adventures_middleware.dart';
import 'app_state.dart';
import 'challenges/middleware/read_challenges_middleware.dart';
import 'home/pages/home_page.dart';
import 'redfire_options.dart';
import 'shared/middleware/create_adventure_node_middleware.dart';
import 'shared/middleware/select_adventure_node_middleware.dart';
import 'shared/reducers/select_adventure_node_reducer.dart';
import 'shared/reducers/set_adventure_nodes_reducer.dart';

void main() => runApp(AppWidget<AppState>(
      config: RedFireOptions.currentPlatform,
      logins: {
        EmailLoginConfig(),
        PlatformDefaultLoginConfig(clientId: RedFireOptions.web.auth.clientId!),
      }.lock,
      initialState: AppState.init(),
      initialActions: const [],
      onSignInActions: const [
        ReadAdventuresAction(),
      ],
      middlewares: [
        CreateAdventureNodeMiddleware(),
        ReadAdventuresMiddleware(),
        ReadChallengesMiddleware(),
        SelectAdventureNodeMiddleware(),
      ],
      reducers: [
        SetAdventureNodesReducer(),
        SelectAdventureNodeReducer(),
      ],
      pageTransforms: ISet(),
      title: 'adventure_maker', // optional, defaults to 'Title Note Set'
      homePage: const HomePage(),
    ));
