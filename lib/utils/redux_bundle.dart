import 'package:flireator/middleware/app_middleware.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/reducers/app_reducer.dart';
import 'package:flireator/utils/services_bundle.dart';
import 'package:redux/redux.dart';

class ReduxBundle {
  /// The redux store
  final Store<AppState> _store;

  /// Create the redux store
  ReduxBundle(ServicesBundle services,
      {List<Middleware> extraMiddlewares = const []})
      : _store = Store<AppState>(appReducer,
            initialState: AppState.init(),
            middleware: [
              ...createAppMiddleware(
                  authService: services.auth,
                  databaseService: services.database,
                  platformService: services.platform,
                  navigationService: services.navigation),
              ...extraMiddlewares,
            ]);

  Store<AppState> get store => _store;
}
