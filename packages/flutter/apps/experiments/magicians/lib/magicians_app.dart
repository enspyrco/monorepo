import 'package:flutter/material.dart';

import 'main_screen.dart';

class MagiciansApp extends StatelessWidget {
  const MagiciansApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
