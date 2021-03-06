import 'package:flutter/material.dart';

import '../git_objects/commit_tree.dart';
import 'area_visual.dart';

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
    _area.drawOnTo(canvas);

    _tree.drawOnTo(canvas);
  }

  @override
  bool shouldRepaint(VisualisationPainter oldDelegate) => false;
}
