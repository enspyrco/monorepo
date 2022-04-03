part of '../b2_ffi_delegates.dart';

class B2ShapeFfi implements B2ShapeDelegate {
  final Pointer<Void> _self;

  B2ShapeFfi._(Pointer<Void> ptr) : _self = ptr;
}
