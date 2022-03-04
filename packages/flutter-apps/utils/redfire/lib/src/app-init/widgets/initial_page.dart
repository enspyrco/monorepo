import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterfire_ui/auth.dart';

import '../../../types.dart';
import '../../auth/utils/login_configs.dart';

class InitialPage<T extends RedFireState> extends StatelessWidget {
  const InitialPage(Widget homePage, ISet<LoginConfig> logins, {Key? key})
      : _homePage = homePage,
        _logins = logins,
        super(key: key);
  final Widget _homePage;
  final ISet<LoginConfig> _logins;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<T, AuthUserData?>(
      distinct: true,
      converter: (store) => store.state.auth.userData,
      builder: (context, userData) {
        // User is not signed in
        if (userData == null) {
          return SignInScreen(
              providerConfigs: _logins
                  .map((element) => element.toFlutterFireConfig())
                  .toList());
        }

        // Render the application if authenticated
        return _homePage;
      },
    );
  }
}
