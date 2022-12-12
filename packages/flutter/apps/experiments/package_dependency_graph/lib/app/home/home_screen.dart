import 'package:astro/astro.dart';
import 'package:flutter/material.dart';
import 'package:package_dependency_graph/app/home/dependency_graph_painter.dart';

import '../../shared/models/dependency.dart';
import '../state/app_state.dart';
import 'app_bar/basic_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, List<Dependency>>(
      transformer: (state) => state.dependencies,
      builder: (context, dependencies) {
        return Scaffold(
          appBar: BasicAppBar(dependencies: dependencies),
          body: CustomPaint(
            painter: DependencyGraphPainter(dependencies),
            child: Container(),
          ),
        );
      },
    );
  }
}
