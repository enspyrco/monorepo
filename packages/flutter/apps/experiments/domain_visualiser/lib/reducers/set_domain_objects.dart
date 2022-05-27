import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redux/redux.dart';

import '../actions/set_domain_objects_action.dart';
import '../app_state.dart';
import '../models/class_box.dart';

class SetDomainObjectsReducer
    extends TypedReducer<AppState, SetDomainObjectsAction> {
  SetDomainObjectsReducer()
      : super((state, action) => state.copyWith(
            classBoxes: action.objects.cast<ClassBox>().toISet()));
}
