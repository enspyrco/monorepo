import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:redfire/widgets.dart';
import 'package:tech_world/redux/app_state.dart';
import 'package:tech_world/tech_world_game.dart';

class MainPage extends StatelessWidget {
  const MainPage({required TechWorldGame game, Key? key})
      : _game = game,
        super(key: key);

  final TechWorldGame _game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [AccountButton<AppState>()],
      ),
      body: Stack(
        children: [
          GameWidget(game: _game),
        ],
      ),
    );
  }
}
