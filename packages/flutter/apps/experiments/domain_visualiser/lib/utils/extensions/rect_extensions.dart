import 'package:flutter/painting.dart';
import 'package:uuid/uuid.dart';

import '../../models/class_box.dart';

extension RectExtension on Rect {
  ClassBox toNewClassBox() => ClassBox(
        id: const Uuid().v1(),
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        instanceMethods: {},
        instanceVariables: {},
        staticMethods: {},
        staticVariables: {},
      );
}
