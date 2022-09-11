import 'dart:async';

import 'package:locator/locator.dart';
import 'package:redaux/redaux.dart';

import '../../app/state/app_state.dart';
import '../services/firebase_auth_service.dart';
import '../state/user_state.dart';
import 'update_user_state.dart';

class BindAuthState extends AsyncAction<AppState> {
  @override
  Middleware<AppState> get middleware => _BindAuthStateMiddleware.instance;

  @override
  toJson({int? parentId}) => {
        'name_': 'Bind Auth State',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parentId,
        'state_': <String, dynamic>{}
      };
}

/// A file private singleton, allowing each [BindAuthState] action to return
/// the appropriate Middleware.
class _BindAuthStateMiddleware extends Middleware<AppState> {
  @override
  void call(store, action) {
    var service = locate<FirebaseAuthService>();

    subscription = service.tapIntoAuthState().listen(
        (user) => store.dispatch(UpdateUserState(user)..parent = action));
  }

  StreamSubscription<UserState>? subscription;

  static final instance = _BindAuthStateMiddleware();
}
