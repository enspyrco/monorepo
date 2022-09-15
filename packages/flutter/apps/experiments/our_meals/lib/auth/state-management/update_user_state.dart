import 'package:redaux/redaux.dart';

import '../../app/state/app_state.dart';
import '../state/user_state.dart';

class UpdateUserState extends SyncAction<AppState> {
  UpdateUserState(this.user);

  final UserState user;

  @override
  AppState reduce(state) => state.copyWith(user: user);

  @override
  toJson({int? parentId}) => {
        'name_': 'Update User State',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId,
        'state_': <String, dynamic>{'user': user.toJson()}
      };
}
