import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

import '../state/user_state.dart';

class UpdateUserState<T extends AstroState> extends LandingMission<T> {
  UpdateUserState(this.user);

  final UserState user;

  @override
  T landingInstructions(T state) {
    return (state as dynamic).copyWith(auth: AuthState(user: user));
  }

  @override
  toJson() => {
        'name_': 'Update User State',
        'state_': <String, dynamic>{'user': user.toJson()}
      };
}
