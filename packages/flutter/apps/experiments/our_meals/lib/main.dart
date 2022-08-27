import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:locator/locator.dart';
import 'package:our_meals/auth/state_management/bind_auth_state.dart';
import 'package:our_meals/auth/widgets/sign_in_screen.dart';
import 'package:our_meals/firebase_options.dart';
import 'package:our_meals/home/home_screen.dart';
import 'package:redaux/redaux.dart';
import 'package:redaux_widgets/redaux_widget.dart';
import 'package:redux_devtools_screen/redux_devtools_screen.dart';
import 'package:split_view/split_view.dart';

import 'app/state/app_state.dart';
import 'auth/services/firebase_auth_service.dart';
import 'auth/state/user_state.dart';

final _store = Store<AppState>(state: AppState.initial);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Locator.add<FirebaseAuthService>(FirebaseAuthService(FirebaseAuth.instance));

  runApp(const AuthGate());
}

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

    return StoreProvider(
      store: _store,
      child: MaterialApp(
          home: SplitView(
        viewMode: SplitViewMode.Horizontal,
        children: [
          Material(child: ReduxDevToolsScreen(_store.dispatchEvents)),
          StateStreamBuilder<AppState, SignedInState>(
            transformer: (state) => state.user.signedIn,
            builder: (context, signedIn) {
              if (signedIn == SignedInState.checking ||
                  signedIn == SignedInState.notSignedIn) {
                return SignInScreen(signedIn, platform);
              }
              return const HomeScreen();
            },
            onInit: (store) => store.dispatch(BindAuthState()),
          ),
        ],
      )),
    );
  }
}
