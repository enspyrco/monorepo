import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:firebase_auth_service_flutterfire/user_auth_state_flutterfire.dart';

class UpdateUserState<T extends AstroState> extends LandingMission<T> {
  const UpdateUserState(this.user);

  final UserAuthStateFlutterfire user;

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
