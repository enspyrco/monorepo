part of '../b2_ffi_delegates.dart';

typedef NtSetAsBox = Void Function(Pointer<Void>, Float, Float);
typedef DtSetAsBox = void Function(Pointer<Void>, double, double);

typedef NtGetType = Int32 Function(Pointer<Void>);
typedef DtGetType = int Function(Pointer<Void>);

class B2PolygonShapeFfi implements B2PolygonShapeDelegate, B2ShapeFfi {
  @override
  final Pointer<Void> _self;

  B2PolygonShapeFfi()
      : _self = _symbols.lookupFunction<EmptyConstructor, EmptyConstructor>(
            'dart_bind_b2PolygonShape_b2PolygonShape_0')();

  // void dart_bind_b2PolygonShape_SetAsBox_2(b2PolygonShape* self, float hx, float hy)
  static final _setAsBox = _symbols.lookupFunction<NtSetAsBox, DtSetAsBox>(
      'dart_bind_b2PolygonShape_SetAsBox_2');

  @override
  void setAsBox(double hx, double hy) => _setAsBox(_self, hx, hy);

  // int dart_bind_b2PolygonShape_GetType_0(b2PolygonShape* self) {
  static final _getType = _symbols.lookupFunction<NtGetType, DtGetType>(
      'dart_bind_b2PolygonShape_GetType_0');

  @override
  int getType() => _getType(_self);
}
