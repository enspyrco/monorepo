import 'package:flireator/actions/app/plumb_services.dart';
import 'package:flireator/actions/auth/connect_auth_state_to_store.dart';
import 'package:flireator/actions/problems/listen_for_problems.dart';
import 'package:flireator/extensions/themes/theme_data_extensions.dart';
import 'package:flireator/extensions/themes/theme_mode_extensions.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/models/app/settings.dart';
import 'package:flireator/models/flireator/flireator.dart';
import 'package:flireator/widgets/auth/sign_in_page.dart';
import 'package:flireator/widgets/home/home_page.dart';
import 'package:flireator/widgets/profile/profile_page.dart';
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
        onInit: (store) {
          store.dispatch(PlumbServices());
          store.dispatch(ConnectAuthStateToStore());
          store.dispatch(ListenForProblems());
        },
        distinct: true,
        converter: (store) => store.state.settings,
        builder: (context, settings) {
          return MaterialApp(
            title: 'Flutter Firebase Project Creator',
            navigatorKey: navKey,
            theme: MakeThemeData.from(settings.lightTheme),
            darkTheme: MakeThemeData.from(settings.darkTheme),
            themeMode: MakeThemeMode.from(settings.brightnessMode),
            home: StoreConnector<AppState, Flireator>(
              distinct: true,
              converter: (store) => store.state.flireator,
              builder: (context, flireator) {
                return (flireator == null) ? SignInPage() : HomePage();
              },
            ),
            routes: <String, WidgetBuilder>{
              '/profile': (context) => ProfilePage(),
            },
          );
        },
      ),
    );
  }
}
