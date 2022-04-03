part of '../b2_ffi_delegates.dart';

typedef B2Vec2CtrN = Pointer<Void> Function(Float, Float);
typedef B2Vec2Ctr = Pointer<Void> Function(double, double);

typedef LengthFnN = Float Function(Pointer<Void>);
typedef LengthFn = double Function(Pointer<Void>);

typedef XFnN = Float Function(Pointer<Void>);
typedef XFn = double Function(Pointer<Void>);

class B2Vec2Ffi implements B2Vec2Delegate {
  final Pointer<Void> _self;

  static final _ctr = _symbols
      .lookup<NativeFunction<B2Vec2CtrN>>('dart_bind_b2Vec2_b2Vec2_2')
      .asFunction<B2Vec2Ctr>();

  B2Vec2Ffi._(Pointer<Void> ptr) : _self = ptr;

  B2Vec2Ffi(double x, double y) : _self = _ctr(x, y);

  static final _length =
      _symbols.lookupFunction<LengthFnN, LengthFn>('dart_bind_b2Vec2_Length_0');

  @override
  double get length => _length(_self);

  static final _x =
      _symbols.lookupFunction<XFnN, XFn>('dart_bind_b2Vec2_get_x_0');

  @override
  double get x => _x(_self);

  static final _y =
      _symbols.lookupFunction<XFnN, XFn>('dart_bind_b2Vec2_get_y_0');

  @override
  double get y => _y(_self);
}
