import 'package:astro_types/state_types.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

class Barriers implements AstroState {
  const Barriers();

  /// TODO: make the fromJson do something once we figure out how Barriers will work.
  factory Barriers.fromJson(Map<String, dynamic> json) => const Barriers();

  static const List<Double2> positions = [
    Double2(5, 2),
    Double2(5, 3),
    Double2(5, 4),
    Double2(5, 5),
    Double2(5, 6),
    Double2(5, 7),
    Double2(5, 8),
    Double2(5, 9),
    Double2(7, 7),
    Double2(7, 8),
    Double2(6, 8),
    Double2(1, 0),
    Double2(1, 1),
    Double2(1, 2),
    Double2(1, 3),
    Double2(1, 4),
    Double2(1, 5),
    Double2(1, 6),
    Double2(1, 7),
    Double2(1, 8),
  ];

  @override
  AstroState copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  toJson() => {
        'positions': Barriers.positions,
      };
}
