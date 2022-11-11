import 'package:astro_types/core_types.dart';

import '../app/state/app_state.dart';
import '../models/class_box.dart';
import '../models/domain_object.dart';

class SetDomainObjects extends LandingMission<AppState> {
  const SetDomainObjects(this.objects);

  final Set<DomainObject> objects;

  @override
  AppState landingInstructions(AppState state) {
    return state.copyWith(classBoxes: {...objects.cast<ClassBox>()});
  }

  @override
  toJson() => {
        'name_': 'SetDomainObjects',
        'state_': {
          'objects': [for (var object in objects) object.toJson()]
        }
      };
}
