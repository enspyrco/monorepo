import 'dart:async';

import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../app/state/app_state.dart';
import '../models/domain_object.dart';
import 'set_domain_objects.dart';

StreamSubscription<List<Document>>? _subscription;

class TapDomainObjects extends AwayMission<AppState> {
  const TapDomainObjects({this.turnOff = false});

  final bool turnOff;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    var service = locate<FirestoreService>();

    await _subscription?.cancel();
    if (turnOff) return;

    final changes = service.tapIntoCollection(at: 'domain-objects');

    // ... and direct the stream to the store.
    _subscription = changes.listen((jsonList) {
      try {
        var models = jsonList
            .map<DomainObject>(
              (jsonItem) => DomainObject.fromJson(jsonItem.fields),
            )
            .toSet();
        missionControl.land(SetDomainObjects(models));
      } catch (error, trace) {
        missionControl.land(CreateErrorReport(error, trace));
      }
    }, onError: (Object error, StackTrace trace) {
      missionControl.land(CreateErrorReport(error, trace));
    });
  }

  @override
  toJson() => {
        'name_': 'TapDomainObjects',
        'state_': {'turnOff': turnOff}
      };
}
