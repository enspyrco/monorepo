import 'package:astro/astro.dart';

import '../state/user_state.dart';

class UpdateUserState<T extends RootState> extends DockingMission<T> {
  UpdateUserState(this.user);

  final UserState user;

  @override
  T dockingInstructions(T state) {
    return (state as dynamic).copyWith(user: user);
  }

  @override
  toJson({int? parentId}) => {
        'name_': 'Update User State',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId,
        'state_': <String, dynamic>{'user': user.toJson()}
      };
}
