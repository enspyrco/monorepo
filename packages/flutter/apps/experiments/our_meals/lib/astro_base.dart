import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_widgets/widgets/mission_control_provider.dart';
import 'package:astro_widgets/widgets/on_state_change_builder.dart';
import 'package:flutter/material.dart';

import 'app/state/app_state.dart';

final _onMissionStartSystemCheck = OnMissionStartSystemCheck<AppState>();
final _missionControl = MissionControl<AppState>(
    state: AppState.initial, systemChecks: [_onMissionStartSystemCheck]);

void initAstroPlugins() {
  astroAuthInit();
}

class AstroBase extends StatelessWidget {
  const AstroBase({required Widget child, Key? key})
      : _child = child,
        super(key: key);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

    return MissionControlProvider(
      missionControl: _missionControl,
      child: MaterialApp(
        home: Row(
          children: [
            if (const bool.fromEnvironment('IN-APP-INSPECTOR'))
              Expanded(
                flex: 1,
                child: Material(
                  child:
                      AstroInspectorScreen(_onMissionStartSystemCheck.stream),
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
                  return _child;
                },
                onInit: (missionControl) =>
                    missionControl.launch(BindAuthState<AppState>()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
