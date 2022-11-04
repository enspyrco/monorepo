import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

class OnAuthStateChange<S extends AstroState> {
  OnAuthStateChange({
    List<AwayMission<S>>? launchOnSignedIn,
    List<LandingMission<S>>? landOnSignedIn,
    List<AwayMission<S>>? launchOnSignedOut,
    List<LandingMission<S>>? landOnSignedOut,
  })  : _launchOnSignedIn = launchOnSignedIn ?? [],
        _landOnSignedIn = landOnSignedIn ?? [],
        _launchOnSignedOut = launchOnSignedOut ?? [],
        _landOnSignedOut = landOnSignedOut ?? [];

  final List<AwayMission<S>> _launchOnSignedIn;
  final List<LandingMission<S>> _landOnSignedIn;
  final List<AwayMission<S>> _launchOnSignedOut;
  final List<LandingMission<S>> _landOnSignedOut;

  List<AwayMission<S>> get launchOnSignedIn => _launchOnSignedIn;
  List<LandingMission<S>> get landOnSignedIn => _landOnSignedIn;
  List<AwayMission<S>> get launchOnSignedOut => _launchOnSignedOut;
  List<LandingMission<S>> get landOnSignedOut => _landOnSignedOut;

  void add(
      {List<AwayMission<S>>? launchOnSignedIn,
      List<LandingMission<S>>? landingMissions,
      List<AwayMission<S>>? launchOnSignedOut,
      List<LandingMission<S>>? landOnSignedOut}) {
    _launchOnSignedIn.addAll(launchOnSignedIn ?? []);
    _landOnSignedIn.addAll(landingMissions ?? []);
    _launchOnSignedOut.addAll(launchOnSignedOut ?? []);
    _landOnSignedOut.addAll(landOnSignedOut ?? []);
  }
}
