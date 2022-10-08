import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resourganizer_desktop/astro_base.dart';

import 'example_drop_target.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  initializeAstro();

  runApp(const AstroBase(child: ExampleDragTarget()));
}
