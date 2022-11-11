import 'dart:async';

import 'package:astro_locator/astro_locator.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

import '../app/state/app_state.dart';
import '../networking/services/networking_service.dart';
import '../utils/extensions/list_of_vector2s_extension.dart';
import 'components/map_component.dart';
import 'components/player_component.dart';

bool _paused = false;
int departureTime = 0;

class TechWorldGame extends FlameGame with KeyboardEvents, TapDetector {
  TechWorldGame({
    required Stream<AppState> appStateChanges,
  }) : _appStateChanges = appStateChanges;

  // We listen to each state change & check the parts we care about.
  final Stream<AppState> _appStateChanges;
  var _oldState = AppState.initial;

  // Components that are used to draw the scene.
  PlayerComponent? _player;
  String? _userId;
  final Map<String, PlayerComponent> _otherPlayers = {};
  final _map = MapComponent();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(_map);

    // Create a character at the origin for player1.
    _player = await PlayerComponent.create('bald.png', start: Position(0, 0));
    add(_player!);

    // TODO: add try/catch blocks and onError callback
    _appStateChanges.listen((state) {
      if (_userId != state.auth.user.uid) {
        _userId = state.auth.user.uid;
      }

      if (_oldState.game.otherPlayerIds != state.game.otherPlayerIds) {
        var removeSet =
            _oldState.game.otherPlayerIds.difference(state.game.otherPlayerIds);
        var addSet =
            state.game.otherPlayerIds.difference(_oldState.game.otherPlayerIds);

        for (var id in removeSet) {
          // remove from the local map of players and from the game
          var component = _otherPlayers.remove(id);
          if (component != null) remove(component);
        }

        for (var id in addSet) {
          PlayerComponent.create('beard.png', start: Position(0, 0))
              .then((player) {
            // TODO: should we use onDetach or similar to avoid accessing bad memory?
            _otherPlayers[id] = player;
            add(player);
          });
        }
      }

      if (_oldState.game.playerPaths != state.game.playerPaths) {
        // get the set of ids corresponding to new player paths
        var newPaths = {...state.game.playerPaths.entries}
            .difference({..._oldState.game.playerPaths.entries});
        // add movement effects to all relevant player components
        // for (var path in newPaths) {
        //   _otherPlayers[path.key]!.moveOnPath(
        //       points: state.game.playerPaths[path.key]!.toVector2s(),
        //       speed: 300);
        // }
      }

      _oldState = state;
    });
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event.isShiftPressed) {
      _togglePausedState();
    } else {}
    return KeyEventResult.handled;
  }

  void _togglePausedState() =>
      (_paused = !_paused) ? pauseEngine() : resumeEngine();

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);

    // guard statement
    if (_userId == null) return;

    var bigPathLocations =
        _map.createPath(start: _player!.position, end: info.eventPosition.game);

    departureTime = DateTime.now().millisecondsSinceEpoch;
    final message = PlayerPathMessage(
        userId: _userId!, points: bigPathLocations.toDouble2s().toIList());
    locate<NetworkingService>().publish(message);

    // _player!.moveOnPath(points: bigPathLocations, speed: 300);
  }

  @override
  Color backgroundColor() => const Color(0xFF222222);
}
