import 'package:flutter/material.dart';

import 'game_loop.dart';
import 'game_world.dart';
import 'game_world_painter.dart';

class GameWidget extends StatefulWidget {
  const GameWidget(GameWorld gameWorld, {Key? key})
      : _gameWorld = gameWorld,
        super(key: key);

  final GameWorld _gameWorld;

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget>
    with SingleTickerProviderStateMixin {
  late final GameLoop _gameLoop;

  @override
  void initState() {
    super.initState();
    _gameLoop = GameLoop(onTick: update);
  }

  void update(double dt) {
    if (mounted) widget._gameWorld.update(dt);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return CustomPaint(
          painter: GameWorldPainter(widget._gameWorld,
              notifiyRepaint: _gameLoop.tickNotifier));
    });
  }

  @override
  void dispose() {
    _gameLoop.dispose();
    super.dispose();
  }
}
