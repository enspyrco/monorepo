import 'package:flutter/material.dart';

import 'astro_base.dart';

// initialActions: const [TapOrganisationsAction()],
// homePage: const HomeScreen(),
void main() async {
  await astroInitialization();
  runApp(const MaterialApp(home: AstroBase()));
}
