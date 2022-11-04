import 'package:flutter/material.dart';

import 'astro_base.dart';

void main() async {
  await astroInitialization();
  runApp(const MaterialApp(home: AstroBase()));
}

// void main() => runApp(AppWidget<AppState>(
//       pageTransforms: <dynamic>{},
//       homePage: const HomePage(),
//     ));
