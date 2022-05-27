import 'package:flutter/material.dart';

import 'game_world.dart';

class GameWorldPainter extends CustomPainter {
  GameWorldPainter(GameWorld gameWorld,
      {required ChangeNotifier notifiyRepaint})
      : _gameWorld = gameWorld,
        super(repaint: notifiyRepaint);

  final GameWorld _gameWorld;

  @override
  void paint(Canvas canvas, Size size) {
    _gameWorld.paintOn(canvas);
  }

  @override
  bool shouldRepaint(GameWorldPainter oldDelegate) => false;
}
