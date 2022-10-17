import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'astro_base.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  initializeAstro();

  runApp(const MaterialApp(home: AstroBase()));
}
