import 'package:locator/locator.dart';
import 'package:our_meals/auth/services/firebase_auth_service.dart';
import 'package:redaux/redaux.dart';

import '../../app/state/app_state.dart';

class SignOut extends AsyncAction<AppState> {
  @override
  Middleware<AppState> get middleware => _SignOutMiddleware.instance;

  @override
  toJson() => {
        'name_': 'Sign Out',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parentId
      };
}

class _SignOutMiddleware extends Middleware<AppState> {
  @override
  void call(store, covariant SignOut action) async {
    var service = locate<FirebaseAuthService>();
    service.signOut();
  }

  static final instance = _SignOutMiddleware();
}
