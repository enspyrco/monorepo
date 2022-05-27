import 'package:flutter/material.dart';
import 'package:git_vis/visualisation/visualisation_painter.dart';

import '../git/object_database.dart';
import '../git_objects/commit_tree.dart';
import 'area_visual.dart';
import 'game_loop.dart';

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
    if (mounted) _treeVisual?.update(dt);
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
