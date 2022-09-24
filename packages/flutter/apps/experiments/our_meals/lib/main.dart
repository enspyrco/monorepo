import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_meals/firebase_options.dart';

import 'astro_base.dart';
import 'home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  initAstroPlugins();

  runApp(const AstroBase(child: HomeScreen()));
}
