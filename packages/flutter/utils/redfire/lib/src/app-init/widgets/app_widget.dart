import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_devtools_screen/redux_devtools_screen.dart';
import 'package:split_view/split_view.dart';

import '../../auth/utils/login_configs.dart';
import '../../navigation/models/page_data.dart';
import '../../platform/plugins/wrappers/firebase_wrapper.dart';
import '../../redux/extensions/reducers_list_extension.dart';
import '../../settings/extensions/brightness_mode_enum_extensions.dart';
import '../../settings/extensions/theme_set_extensions.dart';
import '../../settings/models/settings.dart';
import '../../types/red_fire_state.dart';
import '../../types/redux_action.dart';
import '../../utils/devtools_global.dart';
import '../../utils/red_fire_config.dart';
import '../../utils/red_fire_locator.dart';
import '../redux/redfire_initial_actions.dart';
import '../redux/redfire_middlewares.dart';
import '../redux/redfire_reducers.dart';
import 'initializing_error_page.dart';
import 'initializing_indicator.dart';
import 'pages_navigator.dart';

class AppWidget<T extends RedFireState> extends StatefulWidget {
  late final Store<T> _store;
  final FirebaseWrapper _firebase;
  final RedFireConfig _config;
  final String _title;
  final List<ReduxAction> _initialActions;

  // The default constructor takes an initialized store, currently only used
  // in tests.
  AppWidget.fromStore(
      {Key? key,
      required Store<T> initializedStore,
      required Widget homePage,
      ISet<PageDataTransforms>? pageTransforms,
      FirebaseWrapper? firebaseWrapper,
      required RedFireConfig config,
      required ISet<LoginConfig> logins,
      String? title})
      : _store = initializedStore,
        _firebase = firebaseWrapper ?? FirebaseWrapper(),
        _config = config,
        _title = title ?? 'Title Not Set',
        _initialActions = [],
        super(key: key) {
    addPageTransforms<T>(homePage, logins, pageTransforms ?? ISet());
  }

  AppWidget(
      {Key? key,
      required T initialState,
      required Widget homePage,
      List<ReduxAction>? initialActions,
      List<ReduxAction>? onSignInActions,
      List<Reducer<T>>? reducers,
      List<Middleware<T>>? middlewares,
      ISet<PageDataTransforms>? pageTransforms,
      FirebaseWrapper? firebaseWrapper,
      required RedFireConfig config,
      required ISet<LoginConfig> logins,
      String? title})
      : _firebase = firebaseWrapper ?? FirebaseWrapper(),
        _config = config,
        _title = title ?? 'Title Not Set',
        _initialActions = initialActions ?? [],
        super(key: key) {
    addPageTransforms<T>(homePage, logins, pageTransforms ?? ISet());
    // create the redux store, combining any provided reducers and middleware
    _store = Store<T>((redfireReducers<T>() + (reducers ?? [])).combine(),
        initialState: initialState,
        middleware: [...redfireMiddlewares(), ...(middlewares ?? [])]);

    RedFireLocator.provideOnSignInActions(onSignInActions);
  }

  @override
  _AppWidgetState<T> createState() => _AppWidgetState<T>();
}

class _AppWidgetState<T extends RedFireState> extends State<AppWidget<T>> {
  dynamic _error;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    try {
      RedFireLocator.provideConfig(widget._config);
      _initializeFlutterFire(options: widget._config.firebase);
    } catch (e) {
      setState(() => _error = e);
    }
  }

  void _initializeFlutterFire({FirebaseOptions? options}) async {
    // firebase must be initialised first so createStore() can run
    await widget._firebase.init(options);

    // Dispatch any actions that were passed in.
    for (final action in [
      ...(widget._initialActions),
      ...redfireInitialActions,
    ]) {
      widget._store.dispatch(action);
    }

    setState(() => _initialized = true);
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return InitializingErrorPage(_error, StackTrace.current);
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return InitializingIndicator(_initialized);
    }

    return StoreProvider<T>(
      store: widget._store,
      child: StoreConnector<T, Settings>(
        distinct: true,
        converter: (store) => store.state.settings,
        builder: (context, settings) {
          return MaterialApp(
              title: widget._title,
              theme: settings.lightTheme.data,
              darkTheme: settings.darkTheme.data,
              themeMode: settings.brightnessMode.theme,
              home: (const bool.fromEnvironment('REDUX_DEVTOOLS'))
                  ? SplitView(
                      viewMode: SplitViewMode.Horizontal,
                      children: [
                        Material(
                            child: ReduxDevToolsScreen(
                                reduxEventsController.stream)),
                        PagesNavigator<T>(widget._store),
                      ],
                    )
                  : PagesNavigator<T>(widget._store));
        },
      ),
    );
  }
}
