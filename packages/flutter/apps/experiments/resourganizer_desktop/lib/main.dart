import 'package:flutter/material.dart';
import 'package:resourganizer_desktop/astro_base.dart';

void main() async {
  await astroInitialization();
  runApp(const MaterialApp(home: AstroBase()));
}
