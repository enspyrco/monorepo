import 'package:flutter/material.dart';
import 'package:flutter_box2d/flutter_box2d.dart';

extension B2Vec2Extensions on B2Vec2 {
  Offset toOffSet() => Offset(x, y);
}
