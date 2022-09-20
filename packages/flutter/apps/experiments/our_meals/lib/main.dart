import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_dev_tools_screen/astro_dev_tools_screen.dart';
import 'package:astro_widgets/astro_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_meals/firebase_options.dart';
import 'package:our_meals/home/home_screen.dart';

import 'app/state/app_state.dart';

final _events = EmitDispatchEvents<AppState>();
final _store =
    Store<AppState>(state: AppState.initial, systemChecks: [_events]);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  authInit();

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
        home: Row(
          children: [
            Expanded(
              flex: 1,
              child: Material(
                child: AstroDevToolsScreen(_events.onDispatch),
              ),
            ),
            Expanded(
              flex: 1,
              child: StateStreamBuilder<AppState, SignedInState>(
                transformer: (state) => state.user.signedIn,
                builder: (context, signedIn) {
                  if (signedIn == SignedInState.checking ||
                      signedIn == SignedInState.notSignedIn) {
                    return SignInScreen<AppState>(signedIn, platform);
                  }
                  return const HomeScreen();
                },
                onInit: (store) => store.launch(BindAuthState<AppState>()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
