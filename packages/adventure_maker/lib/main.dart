import 'package:adventure_maker/adventures/actions/tap_adventures_action.dart';
import 'package:adventure_maker/adventures/middleware/tap_adventures_middleware.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/shared/middleware/create_adventure_node_middleware.dart';
import 'package:adventure_maker/shared/pages/main_page.dart';
import 'package:adventure_maker/shared/reducers/select_adventure_node_reducer.dart';
import 'package:adventure_maker/shared/reducers/set_adventure_nodes_reducer.dart';
import 'package:flutter/widgets.dart';
import 'package:redfire/widgets.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      onSignInActions: const [TapAdventuresAction()],
      middlewares: [CreateAdventureNodeMiddleware(), TapAdventuresMiddleware()],
      reducers: [SetAdventureNodesReducer(), SelectAdventureNodeReducer()],
      pageTransforms: const [],
      title: 'adventure_maker', // optional, defaults to 'Title Note Set'
      mainPage: const MainPage(),
    ));
