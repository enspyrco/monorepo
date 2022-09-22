import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_widgets/astro_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_meals/firebase_options.dart';
import 'package:our_meals/home/home_screen.dart';

import 'app/state/app_state.dart';

final _events = EmitMissionEvents<AppState>();
final _store =
    MissionControl<AppState>(state: AppState.initial, systemChecks: [_events]);

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

    return MissionControlProvider(
      missionControl: _store,
      child: MaterialApp(
        home: Row(
          children: [
            Expanded(
              flex: 1,
              child: Material(
                child: AstroInspectorScreen(_events.onDispatch),
              ),
            ),
            Expanded(
              flex: 1,
              child: OnStateChangeBuilder<AppState, SignedInState>(
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
