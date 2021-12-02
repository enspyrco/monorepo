import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/middleware/create_adventure_middleware.dart';
import 'package:adventure_maker/pages/main_page.dart';
import 'package:flutter/widgets.dart';
import 'package:redfire/widgets.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      middlewares: [CreateAdventureMiddleware()],
      reducers: const [],
      pageTransforms: const [],
      title: 'adventure_maker', // optional, defaults to 'Title Note Set'
      mainPage: const MainPage(),
    ));
