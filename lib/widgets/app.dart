import 'package:flireator/actions/app/plumb_services.dart';
import 'package:flireator/extensions/themes/theme_data_extensions.dart';
import 'package:flireator/extensions/themes/theme_mode_extensions.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/models/app/settings.dart';
import 'package:flireator/widgets/auth/auth_page.dart';
import 'package:flireator/widgets/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FlireatorApp extends StatelessWidget {
  /// The redux store
  final Store<AppState> store;

  /// The [GlobalKey] used by the [NavigationService]
  final GlobalKey<NavigatorState> navKey;

  FlireatorApp(this.store, this.navKey);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, Settings>(
        onInit: (store) => store.dispatch(PlumbServices()),
        distinct: true,
        converter: (store) => store.state.settings,
        builder: (context, settings) {
          return MaterialApp(
            title: 'Flutter Firebase Project Creator',
            navigatorKey: navKey,
            theme: MakeThemeData.from(settings.lightTheme),
            darkTheme: MakeThemeData.from(settings.darkTheme),
            themeMode: MakeThemeMode.from(settings.brightnessMode),
            home: StoreConnector<AppState, bool>(
              distinct: true,
              converter: (store) =>
                  store.state.userData != null &&
                  store.state.userData.hasGitHub &&
                  store.state.gitHubToken != null,
              builder: (context, signedInAndHaveToken) {
                return (signedInAndHaveToken) ? HomePage() : AuthPage();
              },
            ),
          );
        },
      ),
    );
  }
}
