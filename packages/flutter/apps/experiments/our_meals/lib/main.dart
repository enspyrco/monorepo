import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_meals/firebase_options.dart';
import 'package:our_meals/home/home_screen.dart';
import 'package:redaux/redaux.dart';
import 'package:redaux_auth/redaux_auth.dart';
import 'package:redaux_dev_tools_screen/redaux_dev_tools_screen.dart';
import 'package:redaux_widgets/redaux_widget.dart';

import 'app/state/app_state.dart';

final _eventsEndware = EmitDispatchEventsEndware<AppState>();
final _store =
    Store<AppState>(state: AppState.initial, endWares: [_eventsEndware]);

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
                child: RedauxDevToolsScreen(_eventsEndware.dispatchEvents),
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
                onInit: (store) => store.dispatch(BindAuthState<AppState>()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
