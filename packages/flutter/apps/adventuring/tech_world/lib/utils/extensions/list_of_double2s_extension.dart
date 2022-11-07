import 'package:vector_math/vector_math_64.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

extension ListOfDouble2sExtension on List<Double2> {
  List<Vector2> toVector2s() =>
      map<Vector2>((d) => Vector2(d.x.toDouble(), d.y.toDouble())).toList();
}
