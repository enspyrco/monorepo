import 'package:astro/astro.dart';
import 'package:flutter/material.dart';
import 'package:package_dependency_graph/app/home/dependency_graph_painter.dart';

import '../../shared/models/package.dart';
import '../state/app_state.dart';
import 'app_bar/basic_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, Set<Package>>(
      transformer: (state) => state.packages,
      builder: (context, packages) {
        return Scaffold(
          appBar: BasicAppBar(packages: packages),
          body: CustomPaint(
            painter: DependencyGraphPainter(packages),
            child: Container(),
          ),
        );
      },
    );
  }
}
