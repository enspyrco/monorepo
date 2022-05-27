import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

import 'background/barriers.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
class GameState with _$GameState, ReduxState {
  static const String className = 'GameState';

  const GameState._();
  factory GameState(
      {required Barriers barriers,
      required ISet<String> otherPlayerIds,
      required IMap<String, IList<Double2>> playerPaths}) = _GameState;

  factory GameState.init() => GameState(
        barriers: Barriers(),
        otherPlayerIds: ISet(const {}),
        playerPaths: IMap<String, IList<Double2>>(),
      );

  factory GameState.fromJson(Map<String, Object?> json) =>
      _$GameStateFromJson(json);

  @override
  String get typeName => className;
}
