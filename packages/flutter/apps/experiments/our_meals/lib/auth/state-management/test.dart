import 'package:redaux/redaux.dart';

import '../../app/state/app_state.dart';

class Test extends SyncAction<AppState> {
  @override
  AppState reduce(state) => state.copyWith();

  @override
  toJson({int? parentId}) =>
      {'name_': 'Test', 'type_': 'sync', 'id_': hashCode, 'parent_': parentId};
}
