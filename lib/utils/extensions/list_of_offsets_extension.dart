import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

extension ListOfOffsetsExtension on List<Offset> {
  IList<Double2> toDouble2s() =>
      map<Double2>((offset) => Double2(offset.dx, offset.dy)).toIList();
}
