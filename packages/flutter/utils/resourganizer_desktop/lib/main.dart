import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:redaux/redaux.dart';
import 'package:redaux_auth/redaux_auth.dart';
import 'package:redaux_dev_tools_screen/redaux_dev_tools_screen.dart';
import 'package:redaux_widgets/widgets/state_stream_builder.dart';
import 'package:redaux_widgets/widgets/store_provider.dart';

import 'app_state.dart';
import 'example_drop_target.dart';
import 'firebase_options.dart';

final _emitEvents = EmitDispatchEvents<AppState>();
final _store =
    Store<AppState>(state: AppState.initial, systemChecks: [_emitEvents]);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  authInit();

  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

    return StoreProvider(
      store: _store,
      child: MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: RedauxDevToolsScreen(_emitEvents.onDispatch),
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
                    return const ExampleDragTarget();
                  },
                  onInit: (store) => store.launch(BindAuthState<AppState>()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}