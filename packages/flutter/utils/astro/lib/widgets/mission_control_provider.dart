import 'package:flutter/widgets.dart';

import '../core/mission_control.dart';
import '../core/root_state.dart';
import 'errors/mission_control_provider_not_found.dart';

class MissionControlProvider<S extends RootState> extends InheritedWidget {
  final MissionControl<S> _missionControl;

  const MissionControlProvider({
    Key? key,
    required MissionControl<S> missionControl,
    required Widget child,
  })  : _missionControl = missionControl,
        super(key: key, child: child);

  static MissionControl<S> of<S extends RootState>(BuildContext context,
      {bool listen = true}) {
    final provider = (listen
        ? context
            .dependOnInheritedWidgetOfExactType<MissionControlProvider<S>>()
        : context
            .getElementForInheritedWidgetOfExactType<
                MissionControlProvider<S>>()
            ?.widget) as MissionControlProvider<S>?;

    if (provider == null) throw MissionControlProviderNotFound<S>();

    return provider._missionControl;
  }

  @override
  bool updateShouldNotify(MissionControlProvider<S> oldWidget) =>
      _missionControl != oldWidget._missionControl;
}
