import 'package:astro_types/auth_types.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

class UpdateUserAuthState<T extends AstroState> extends LandingMission<T> {
  const UpdateUserAuthState(this.user);

  final UserAuthState user;

  @override
  T landingInstructions(T state) {
    return (state as dynamic)
        .copyWith(auth: (state as dynamic).auth.copyWith(user: user));
  }

  @override
  toJson() => {
        'name_': 'Update User State',
        'state_': <String, dynamic>{'user': user.toJson()}
      };
}
