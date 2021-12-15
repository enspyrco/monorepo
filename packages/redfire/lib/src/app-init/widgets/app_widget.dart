import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../navigation/actions/remove_current_page_action.dart';
import '../../navigation/extensions/page_data_list_extension.dart';
import '../../navigation/models/page_data.dart';
import '../../platform/plugins/wrappers/firebase_wrapper.dart';
import '../../redux/extensions/reducers_list_extension.dart';
import '../../settings/extensions/brightness_mode_enum_extensions.dart';
import '../../settings/extensions/theme_set_extensions.dart';
import '../../settings/models/settings.dart';
import '../../types/red_fire_state.dart';
import '../../types/redux_action.dart';
import '../../utils/red_fire_config.dart';
import '../../utils/red_fire_locator.dart';
import '../redux/redfire_initial_actions.dart';
import '../redux/redfire_middlewares.dart';
import '../redux/redfire_reducers.dart';
import 'initializing_error_page.dart';
import 'initializing_indicator.dart';

class AppWidget<T extends RedFireState> extends StatefulWidget {
  late final Store<T> _store;
  final FirebaseWrapper _firebase;
  final RedFireConfig? _config;
  final String _title;
  final List<ReduxAction> _initialActions;

  // The default constructor takes an initialized store, currently only used
  // in tests.
  AppWidget.fromStore(
      {Key? key,
      required Store<T> initializedStore,
      required Widget mainPage,
      List<PageDataTransforms>? pageTransforms,
      FirebaseWrapper? firebaseWrapper,
      RedFireConfig? config,
      String? title})
      : _store = initializedStore,
        _firebase = firebaseWrapper ?? FirebaseWrapper(),
        _config = config,
        _title = title ?? 'Title Not Set',
        _initialActions = [],
        super(key: key) {
    addPageTransforms<T>(mainPage, pageTransforms ?? []);
  }

  AppWidget(
      {Key? key,
      required T initialState,
      required Widget mainPage,
      List<ReduxAction>? initialActions,
      List<ReduxAction>? onSignInActions,
      List<Reducer<T>>? reducers,
      List<Middleware<T>>? middlewares,
      List<PageDataTransforms>? pageTransforms,
      FirebaseWrapper? firebaseWrapper,
      RedFireConfig? config,
      String? title})
      : _firebase = firebaseWrapper ?? FirebaseWrapper(),
        _config = config,
        _title = title ?? 'Title Not Set',
        _initialActions = initialActions ?? [],
        super(key: key) {
    addPageTransforms<T>(mainPage, pageTransforms ?? []);
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
      _initializeFlutterFire(options: widget._config?.firebase);
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
              home: StoreConnector<T, IList<PageData>>(
                distinct: true,
                converter: (store) => store.state.pages,
                builder: (context, pages) => Navigator(
                    pages: pages.toPages<T>(),
                    onPopPage: (route, dynamic result) {
                      if (!route.didPop(result)) {
                        return false;
                      }

                      if (route.isCurrent) {
                        widget._store.dispatch(const RemoveCurrentPageAction());
                      }

                      return true;
                    }),
              ),
            );
          }),
    );
  }
}
