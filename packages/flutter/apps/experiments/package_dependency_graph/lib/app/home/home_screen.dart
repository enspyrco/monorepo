import 'package:flutter/material.dart';
import 'package:package_dependency_graph/app/home/dependency_graph_painter.dart';

import 'app_bar/basic_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(),
      body: CustomPaint(
        painter: DependencyGraphPainter(),
        child: Center(
          child: Text(
            'Once upon a time...',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
