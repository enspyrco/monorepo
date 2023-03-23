import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../bindings/generated_bindings.dart';

class B2Vec2 {
  B2Vec2(double x, double y) : _nativeB2Vec2 = malloc<b2Vec2>() {
    _nativeB2Vec2.ref.x = x;
    _nativeB2Vec2.ref.y = y;
  }

  final Pointer<b2Vec2> _nativeB2Vec2;

  void dispose() {
    calloc.free(_nativeB2Vec2);
  }
}
