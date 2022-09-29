import 'package:astro/astro.dart';

import '../state/user_state.dart';

class UpdateUserState<T extends RootState> extends LandingMission<T> {
  UpdateUserState(this.user);

  final UserState user;

  @override
  T landingInstructions(T state) {
    return (state as dynamic).copyWith(user: user);
  }

  @override
  toJson() => {
        'name_': 'Update User State',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': <String, dynamic>{'user': user.toJson()}
      };
}
