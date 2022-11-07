import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';

class LaunchUrl extends AwayMission<AppState> {
  const LaunchUrl({required this.url});

  final String url;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {}

  @override
  toJson() => {
        'name_': 'LaunchUrl',
        'state_': {'url': url}
      };
}
