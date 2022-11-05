import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

import '../state/default_auth_state.dart';
import '../state/default_user_state.dart';

class UpdateUserState<T extends AstroState> extends LandingMission<T> {
  const UpdateUserState(this.user);

  final DefaultUserState user;

  @override
  T landingInstructions(T state) {
    return (state as dynamic).copyWith(auth: DefaultAuthState(user: user));
  }

  @override
  toJson() => {
        'name_': 'Update User State',
        'state_': <String, dynamic>{'user': user.toJson()}
      };
}
