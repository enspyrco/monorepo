import 'package:astro_types/core_types.dart';
import 'package:http/http.dart' as http;

import '../../app/state/app_state.dart';
import 'update_sections_v_m.dart';

final http.Client _client = http.Client();

class CreateSection extends AwayMission<AppState> {
  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    final queryParameters = {'name': missionControl.state.sections.newName};
    final uri = Uri.https(
        'section-creation-v6exb2sdca-uc.a.run.app', '', queryParameters);
    final response = await _client.post(uri);
    if (response.statusCode != 200) {
      throw '${response.statusCode} : ${response.reasonPhrase}';
    }

    missionControl.land(UpdateSectionsVM(creatingNewSection: true));
  }

  @override
  toJson() => {
        'name_': 'CreateSection',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parent?.hashCode
      };
}
