import 'package:vector_math/vector_math_64.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

extension ListOfVector2sExtension on List<Vector2> {
  List<Double2> toDouble2s() => [for (var v in this) Double2(v.x, v.y)];
}
