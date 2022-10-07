import 'package:astro_navigation/profile/profile_page.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:flutter/material.dart';

import '../astro_navigation.dart';

class ProfilePagePrecursor<T extends AstroState>
    with PagePrecursor, AstroState {
  @override
  ProfilePagePrecursor<T> copyWith() => this;

  @override
  toJson() => {'name': 'ProfileRouteCore'};

  @override
  MaterialPage toPage() => const ProfilePage();
}
