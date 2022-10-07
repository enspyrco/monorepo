library astro_navigation;

import 'package:flutter/material.dart';

mixin NavigationState {
  abstract List<PagePrecursor> pagePrecursors;
}

mixin PagePrecursor {
  MaterialPage toPage();
}
