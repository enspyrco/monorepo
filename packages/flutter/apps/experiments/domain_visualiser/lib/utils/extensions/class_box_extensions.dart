import 'package:flutter/painting.dart';

import '../../models/class_box.dart';

extension ClassBoxExtension on ClassBox {
  Rect get rect => Rect.fromLTRB(left, top, right, bottom);
}
