import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/app-init/redfire_initial_actions.dart';
import 'package:redfire/src/app-init/widgets/initializing_error_page.dart';
import 'package:redfire/src/app-init/widgets/initializing_indicator.dart';
import 'package:redfire/src/auth/widgets/auth/auth_page.dart';
import 'package:redfire/src/navigation/actions/remove_current_page_action.dart';
import 'package:redfire/src/navigation/extensions/red_fire_page_list_extensions.dart';
import 'package:redfire/src/navigation/models/red_fire_page.dart';
import 'package:redfire/src/platform/plugins/wrappers/firebase_wrapper.dart';
import 'package:redfire/src/redux/redux_bundle.dart';
import 'package:redfire/src/settings/extensions/brightness_mode_enum_extensions.dart';
import 'package:redfire/src/settings/extensions/theme_set_extensions.dart';
import 'package:redfire/src/settings/models/settings.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redux/redux.dart';

class AppWidget<T extends RedFireState> extends StatefulWidget {
  final FirebaseWrapper _firebase;
  final T _initialState;
  final List<ReduxAction> _initialActions;
  final List<Reducer<T>> _reducers;
  final List<Middleware<T>> _middlewares;
  final Widget _mainPage;
  final String _title;

  AppWidget(
      {FirebaseWrapper? firebase,
      required T initialState,
      List<ReduxAction>? initialActions,
      List<Reducer<T>>? reducers,
      List<Middleware<T>>? middlewares,
      required Widget mainPage,
      String? title})
      : _firebase = firebase ?? FirebaseWrapper(),
        _initialState = initialState,
        _initialActions = initialActions ?? [],
        _reducers = reducers ?? [],
        _middlewares = middlewares ?? [],
        _mainPage = mainPage,
        _title = title ?? 'Title Not Set';

  @override
  _AppWidgetState<T> createState() => _AppWidgetState<T>();
}

class _AppWidgetState<T extends RedFireState> extends State<AppWidget<T>> {
  late ReduxBundle<T> _redux;
  late Store<T> _store;
  dynamic _error;
  bool _initializedFirebase = false;
  bool _initializedRedux = false;

  @override
  void initState() {
    super.initState();
    try {
      initializeFlutterFire();
    } catch (e) {
      setState(() => _error = e);
    }
  }

  void initializeFlutterFire() async {
    // firebase must be initialised first so createStore() can run
    await widget._firebase.init();
    setState(() => _initializedFirebase = true);

    // use the injected redux bundle if there is one or create one
    _redux = ReduxBundle<T>(widget._reducers, widget._middlewares);
    // create the redux store and run any extra operations
    _store = await _redux.createStore(widget._initialState);
    setState(() => _initializedRedux = true);

    for (final action in [
      ...widget._initialActions,
      ...redfireInitialActions
    ]) {
      _store.dispatch(action);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return InitializingErrorPage(_error, StackTrace.current);
    }

    // Show a loader until FlutterFire is initialized
    if (!_initializedFirebase || !_initializedRedux) {
      return InitializingIndicator(_initializedFirebase, _initializedRedux);
    }

    return StoreProvider<T>(
      store: _store,
      child: StoreConnector<T, Settings>(
          distinct: true,
          converter: (store) => store.state.settings,
          builder: (context, settings) {
            return MaterialApp(
              title: widget._title,
              theme: settings.lightTheme.data,
              darkTheme: settings.darkTheme.data,
              themeMode: settings.brightnessMode.theme,
              home: StoreConnector<T, IList<RedFirePage>>(
                distinct: true,
                converter: (store) => store.state.pages,
                builder: (context, redFirePages) => Navigator(
                    pages: redFirePages.toMaterialPages<T>(
                        AuthPage<T>(), widget._mainPage),
                    onPopPage: (route, dynamic result) {
                      if (!route.didPop(result)) {
                        return false;
                      }

                      if (route.isCurrent) {
                        _store.dispatch(RemoveCurrentPageAction());
                      }

                      return true;
                    }),
              ),
            );
          }),
    );
  }
}
