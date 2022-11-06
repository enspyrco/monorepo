import 'package:flutter/widgets.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

extension ListOfOffsetsExtension on List<Offset> {
  List<Double2> toDouble2s() =>
      [for (var offset in this) Double2(offset.dx, offset.dy)];
}
