import 'package:draw_badge/badge_widget.dart';
import 'package:flutter/material.dart' hide FlutterLogoDecoration;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: BadgeWidget(),
      ),
    );
  }
}
