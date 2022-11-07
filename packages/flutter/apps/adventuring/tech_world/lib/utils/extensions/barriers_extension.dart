import 'package:flutter/painting.dart';

import '../../game/background/barriers.dart';

extension BarriersExtension on Barriers {
  List<Offset> toOffsets() => Barriers.positions
      .map<Offset>(
          (position) => Offset(position.x.toDouble(), position.y.toDouble()))
      .toList();
}
