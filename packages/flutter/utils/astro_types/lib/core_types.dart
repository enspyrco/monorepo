library astro_types;

import 'package:flutter/material.dart';

import 'json_types.dart';
import 'navigation_types.dart';
import 'state_types.dart';

/// All missions must extend either [AwayMission] or [LandingMission], which
/// both inherit from [Mission].
abstract class Mission {
  const Mission();
  JsonMap toJson();
}

abstract class LandingMission<T extends AstroState> extends Mission {
  const LandingMission();
  T landingInstructions(T state);
}

abstract class AwayMission<T extends AstroState> extends Mission {
  const AwayMission();
  Future<void> flightPlan(MissionControl<T> missionControl);
}

///
abstract class MissionControl<T extends AstroState> {
  T get state;
  void land(LandingMission<T> mission);
  Future<void> launch(AwayMission<T> mission);
  Stream<T> get onStateChange;
}

/// [SystemCheck]s in astro are are called for every [Mission] - before
/// [AwayMission.flightPlan] is called and after [LandingMission.landingInstructions]
/// is called.
///
/// An [AwayMission] involves calling an async function ([AwayMission.flightPlan]),
/// and we don’t know when that function will return, but we want to be able to
/// do things when we first start the mission, so we run the [SystemCheck] first
/// in [MissionControl.launch].
///
/// On the other hand, we always want to know what the new state is *after* a
/// [LandingMission.landingInstructions] has run so we run the [SystemCheck]
/// last in [MissionControl.land].
///
/// When multiple system checks are added to [MissionControl], they are called
/// in the order they were added to the [MissionControl.systemChecks] list.
abstract class SystemCheck<S extends AstroState> {
  const SystemCheck();
  void call(MissionControl<S> missionControl, Mission mission);
}

abstract class AstroProvider<S extends AstroState> {}

abstract class SystemChecks {
  abstract final List<SystemCheck> preLaunch;
  abstract final List<SystemCheck> postLaunch;
  abstract final List<SystemCheck> preLand;
  abstract final List<SystemCheck> postLand;
}

/// We setup navigation by adding a [PageGenerator] to the [Locator], that will be
/// used to turn a [PageState] from [AppState.navigation.stack] into a [Page]
/// that the [Navigator] will use to display a screen.
abstract class PageGenerator {
  void add(
      {required Type type,
      required MaterialPage Function(PageState) generator});

  MaterialPage applyTo(PageState state);
}
