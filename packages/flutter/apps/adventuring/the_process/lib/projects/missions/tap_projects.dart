import 'dart:async';

import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../app/state/app_state.dart';
import '../models/project_state.dart';
import 'set_projects.dart';

StreamSubscription<List<Document>>? _subscription;

class TapProjects extends AwayMission<AppState> {
  const TapProjects({required String? organisationId, bool turnOff = false})
      : _organisationId = organisationId,
        _turnOff = turnOff;

  final String? _organisationId;
  final bool _turnOff;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    await _subscription?.cancel();
    if (_turnOff) return;

    // tap the database at the appropriate location...
    var service = locate<FirestoreService>();
    final changes = service.tapIntoCollection(
        at: 'projects/the-process/projects',
        where: 'organisationIds',
        arrayContains: _organisationId);

    // ... and direct the stream to the store.
    _subscription = changes.listen(
      (documents) {
        var models = documents
            .map<ProjectState>(
                (document) => ProjectState.fromDocument(document))
            .toSet();
        missionControl.land(SetProjects(models));
      },
      onError: (Object error, StackTrace trace) =>
          CreateErrorReport(error, trace),
    );
  }

  @override
  toJson() => {
        'name_': 'TapProjects',
        'state_': {
          'organisationId': _organisationId,
          'turnOff': _turnOff,
        },
      };
}
