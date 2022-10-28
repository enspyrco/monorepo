import 'dart:async';

import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../app/state/app_state.dart';
import '../../projects/models/section_model.dart';
import 'set_sections.dart';

StreamSubscription<List<Document>>? _subscription;

class TapSections extends AwayMission<AppState> {
  TapSections({bool turnOff = false}) : _turnOff = turnOff;

  final bool _turnOff;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    _subscription?.cancel();
    if (_turnOff) return;

    var service = locate<FirestoreService>();

    // Convert json from the database to an action that handles the data,
    // storing in the app state.
    _subscription =
        service.tapIntoCollection(at: 'sections').listen((documents) {
      missionControl.land(SetSections(
          list: documents
              .map((document) => SectionModel.fromJson(document.fields))
              .toList()));
    }, onError: (error) => throw error);
  }

  @override
  toJson() => {
        'name_': 'TapSections',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': {'turnOff': _turnOff},
      };
}
