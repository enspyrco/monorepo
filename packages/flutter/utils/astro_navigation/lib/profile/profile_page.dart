import 'package:astro_navigation/profile/profile_screen.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:flutter/material.dart';

import '../transitions/my_transition.dart';

class ProfilePage<T extends AstroState> extends MaterialPage {
  const ProfilePage({super.child = const ProfileScreen()});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, inAnimation, outAnimation) {
        return MyTransition(
          animation: inAnimation,
          child: ProfileScreen<T>(),
        );
      },
    );
  }
}
