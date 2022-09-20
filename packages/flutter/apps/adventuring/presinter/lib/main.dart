import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:redfire/utils.dart';
import 'package:redfire/widgets.dart';

import 'app/app_state.dart';
import 'home/home_screen.dart';

void main() => runApp(AppWidget<AppState>(
      logins: {AppleLoginConfig()}.lock,
      config: RedFireOptions.currentPlatform,
      initialState: AppState.init(),
      initialActions: const [],
      middlewares: const [],
      reducers: const [],
      pageTransforms: ISet(),
      title: 'PresInter', // optional, defaults to 'Title Note Set'
      homePage: const HomeScreen(), // shown on successful authentication
    ));
