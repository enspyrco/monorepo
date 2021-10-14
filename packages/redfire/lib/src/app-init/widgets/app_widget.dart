import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/app-init/widgets/initializing_error_page.dart';
import 'package:redfire/src/app-init/widgets/initializing_indicator.dart';
import 'package:redfire/src/navigation/actions/remove_current_page_action.dart';
import 'package:redfire/src/navigation/extensions/page_data_list_extension.dart';
import 'package:redfire/src/navigation/models/page_data.dart';
import 'package:redfire/src/platform/plugins/wrappers/firebase_wrapper.dart';
import 'package:redfire/src/redux/redfire_middleware.dart';
import 'package:redfire/src/redux/redfire_reducers.dart';
import 'package:redfire/src/settings/extensions/brightness_mode_enum_extensions.dart';
import 'package:redfire/src/settings/extensions/theme_set_extensions.dart';
import 'package:redfire/src/settings/models/settings.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redux/redux.dart';

import '../../redux/extensions/reducers_list_extension.dart';
import '../redfire_initial_actions.dart';

class AppWidget<T extends RedFireState> extends StatefulWidget {
  late final Store<T> _store;
  final FirebaseWrapper _firebase;
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
      String? title})
      : _store = initializedStore,
        _firebase = firebaseWrapper ?? FirebaseWrapper(),
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
      List<Reducer<T>>? reducers,
      List<Middleware<T>>? middlewares,
      List<PageDataTransforms>? pageTransforms,
      FirebaseWrapper? firebaseWrapper,
      String? title})
      : _firebase = firebaseWrapper ?? FirebaseWrapper(),
        _title = title ?? 'Title Not Set',
        _initialActions = initialActions ?? [],
        super(key: key) {
    addPageTransforms<T>(mainPage, pageTransforms ?? []);
    // create the redux store, combining any provided reducers and middleware
    _store = Store<T>((redfireReducers<T>() + (reducers ?? [])).combine(),
        initialState: initialState,
        middleware: [...redfireMiddleware(), ...(middlewares ?? [])]);
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
      _initializeFlutterFire();
    } catch (e) {
      setState(() => _error = e);
    }
  }

  void _initializeFlutterFire() async {
    // firebase must be initialised first so createStore() can run
    await widget._firebase.init();

    // Dispatch any actions that were passed in.
    for (final action in [
      ...(widget._initialActions),
      ...redfireInitialActions
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
                        widget._store.dispatch(RemoveCurrentPageAction());
                      }

                      return true;
                    }),
              ),
            );
          }),
    );
  }
}
