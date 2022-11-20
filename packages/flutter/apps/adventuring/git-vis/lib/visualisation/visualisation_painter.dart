import 'package:flutter/material.dart';

import '../git/git_objects/commit_tree.dart';
import 'visual_objects/area_visual.dart';

class VisualisationPainter extends CustomPainter {
  VisualisationPainter(
      {required AreaVisual area,
      required CommitTreeVisual tree,
      required ChangeNotifier notifiyRepaint})
      : _area = area,
        _tree = tree,
        super(repaint: notifiyRepaint);

  final AreaVisual _area;
  final CommitTreeVisual _tree;

  @override
  void paint(Canvas canvas, Size size) {
    // draw a background
    _area.paintOnto(canvas);

    _tree.paintOnto(canvas);
  }

  @override
  bool shouldRepaint(VisualisationPainter oldDelegate) => false;
}
