import 'package:a_star_algorithm/a_star_algorithm.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart' as constants;
import '../../utils/extensions/barriers_extension.dart';
import '../../utils/extensions/offset_extension.dart';
import '../../utils/extensions/vector2_extension.dart';
import '../background/barriers.dart';

class MapComponent extends Component {
  MapComponent({Barriers? barriers})
      : _barriers = barriers ?? const Barriers() {
    _barrierOffsets = _barriers.toOffsets();
    // Convert the unit sized barriers to Rects of size 64
    _barrierRects = Barriers.positions
        .map((position) => Rect.fromPoints(
            Offset(position.x * constants.squareSize,
                position.y * constants.squareSize),
            Offset((position.x + 1) * constants.squareSize,
                (position.y + 1) * constants.squareSize)))
        .toList();
  }

  final Barriers _barriers;
  late List<Offset> _barrierOffsets;
  late List<Rect> _barrierRects;
  List<Offset> _pathLocations = [];

  final _linePaint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.round;

  // Returns the path locations in 'big' space
  // The AStar function takes locations in 'unit space' and we are using a grid
  // of 64x64 squares ('big space').
  //
  // The AStar algorithm works backwards so starts at the 'end' ie the clicked
  // location.
  List<Vector2> createPath({required Vector2 start, required Vector2 end}) {
    _pathLocations = AStar(
      rows: 10,
      columns: 10,
      start: end.inUnits.toOffset(),
      end: start.inUnits.toOffset(),
      barriers: _barrierOffsets,
    ).findThePath().toList()
      ..insert(0, start.inUnits.toOffset())
      ..add(end.inUnits.toOffset()); //

    return _pathLocations
        .map<Vector2>((offset) => (offset).toVector2() * 64)
        .toList();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // draw the path squares
    for (final pathLocation in _pathLocations) {
      canvas.drawRect(pathLocation.toRect64(), Paint()..color = Colors.blue);
    }

    //Draw the selected square.
    if (_pathLocations.isNotEmpty) {
      canvas.drawRect(
          _pathLocations.last.toRect64(), Paint()..color = Colors.lightGreen);
    }

    // draw the grid
    for (double i = 0; i <= constants.gridHeight; i += constants.squareSize) {
      canvas.drawLine(Offset(0, i), Offset(constants.gridWidth, i), _linePaint);
    }
    for (double i = 0; i <= constants.gridWidth; i += constants.squareSize) {
      canvas.drawLine(
          Offset(i, 0), Offset(i, constants.gridHeight), _linePaint);
    }

    // draw the barrier squares
    for (final barrierRect in _barrierRects) {
      canvas.drawRect(barrierRect, Paint()..color = Colors.red);
    }
  }
}
