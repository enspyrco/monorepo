import 'package:adventure_maker/actions/tap_adventures_action.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/middleware/create_adventure_middleware.dart';
import 'package:adventure_maker/middleware/tap_adventures.dart';
import 'package:adventure_maker/pages/main_page.dart';
import 'package:adventure_maker/reducers/set_adventures_reducer.dart';
import 'package:adventure_maker/reducers/set_selected_adventure_reducer.dart';
import 'package:flutter/widgets.dart';
import 'package:redfire/widgets.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      onSignInActions: const [TapAdventuresAction()],
      middlewares: [CreateAdventureMiddleware(), TapAdventuresMiddleware()],
      reducers: [SetAdventuresReducer(), SetSelectedAdventureReducer()],
      pageTransforms: const [],
      title: 'adventure_maker', // optional, defaults to 'Title Note Set'
      mainPage: const MainPage(),
    ));
