import 'package:flutter/material.dart';

import '../git/git_objects/commit_tree.dart';
import '../git/object_database.dart';
import 'game_loop/game_loop.dart';
import 'visual_objects/area_visual.dart';
import 'visual_objects/commit_tree_visual.dart';
import 'visualisation_painter.dart';

class VisualisationWidget extends StatefulWidget {
  const VisualisationWidget({Key? key}) : super(key: key);

  @override
  State<VisualisationWidget> createState() => _VisualisationWidgetState();
}

class _VisualisationWidgetState extends State<VisualisationWidget>
    with SingleTickerProviderStateMixin {
  final CommitTree _tree =
      CommitTree.walkAndParse(branches: ObjectDatabase.getBranches());
  late final GameLoop _gameLoop;
  CommitTreeVisual? _treeVisual;

  @override
  void initState() {
    super.initState();
    _gameLoop = GameLoop(onTick: update);
  }

  void update(double dt) {
    if (mounted) _treeVisual?.moveForwardInTimeBy(dt);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Create the area visual - the space the tree lives in.
      var area = AreaVisual(constraints.maxWidth, constraints.maxHeight,
          const Color.fromARGB(170, 9, 116, 165));
      _treeVisual = _tree.createVisual(area);

      return CustomPaint(
          painter: VisualisationPainter(
              area: area,
              tree: _treeVisual!,
              notifiyRepaint: _gameLoop.tickNotifier));
    });
  }

  @override
  void dispose() {
    _gameLoop.dispose();
    super.dispose();
  }
}
