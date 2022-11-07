import 'package:astro_types/state_types.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

import 'background/barriers.dart';

class GameState implements AstroState {
  GameState({
    required this.barriers,
    required this.otherPlayerIds,
    required this.playerPaths,
  });

  final Barriers barriers;
  final Set<String> otherPlayerIds;
  final Map<String, List<Double2>> playerPaths;

  static GameState get initial => GameState(
        barriers: const Barriers(),
        otherPlayerIds: <String>{},
        playerPaths: <String, List<Double2>>{},
      );

  @override
  GameState copyWith({
    Barriers? barriers,
    Set<String>? otherPlayerIds,
    Map<String, List<Double2>>? playerPaths,
  }) =>
      GameState(
        barriers: barriers ?? this.barriers,
        otherPlayerIds: otherPlayerIds ?? this.otherPlayerIds,
        playerPaths: playerPaths ?? this.playerPaths,
      );

  @override
  toJson() => {
        'barriers': barriers.toJson(),
        'otherPlayerIds': [...otherPlayerIds],
        'playerPaths': playerPaths,
      };
}
