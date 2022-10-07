import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:flutter/widgets.dart';

import 'errors/mission_control_provider_not_found.dart';

class MissionControlProvider<S extends AstroState> extends InheritedWidget {
  const MissionControlProvider({
    Key? key,
    required MissionControl<S> missionControl,
    required Widget child,
  })  : _missionControl = missionControl,
        super(key: key, child: child);

  /// Like the [AppState], [MissionControl] is immutable
  final MissionControl<S> _missionControl;

  static MissionControl<S> of<S extends AstroState>(BuildContext context,
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
