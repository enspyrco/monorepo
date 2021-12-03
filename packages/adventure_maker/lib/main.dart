import 'package:adventure_maker/adventures/actions/tap_adventures_action.dart';
import 'package:adventure_maker/adventures/middleware/tap_adventures_middleware.dart';
import 'package:adventure_maker/adventures/reducers/set_adventures_reducer.dart';
import 'package:adventure_maker/adventures/reducers/set_selected_adventure_reducer.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/shared/middleware/create_adventure_part_middleware.dart';
import 'package:adventure_maker/shared/pages/main_page.dart';
import 'package:flutter/widgets.dart';
import 'package:redfire/widgets.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      onSignInActions: const [TapAdventuresAction()],
      middlewares: [CreateAdventurePartMiddleware(), TapAdventuresMiddleware()],
      reducers: [SetAdventuresReducer(), SetSelectedAdventureReducer()],
      pageTransforms: const [],
      title: 'adventure_maker', // optional, defaults to 'Title Note Set'
      mainPage: const MainPage(),
    ));
