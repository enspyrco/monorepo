import 'dart:ffi' as ffi;

class Box2DLibrary {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  Box2DLibrary(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  Box2DLibrary.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<b2Vec2> b2Vec2_0() {
    return __b2Vec2_0();
  }

  late final __b2Vec2_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<b2Vec2> Function()>>('_b2Vec2_0');
  late final __b2Vec2_0 =
      __b2Vec2_0Ptr.asFunction<ffi.Pointer<b2Vec2> Function()>();

  ffi.Pointer<b2Vec2> b2Vec2_ctr_2(double x, double y) {
    return __b2Vec2_ctr_2(x, y);
  }

  late final __b2Vec2_ctr_2Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<b2Vec2> Function(ffi.Float, ffi.Float)>>('_b2Vec2_ctr_2');
  late final __b2Vec2_ctr_2 = __b2Vec2_ctr_2Ptr
      .asFunction<ffi.Pointer<b2Vec2> Function(double, double)>();

  double b2Vec2_Length_0(
    ffi.Pointer<b2Vec2> self,
  ) {
    return _b2Vec2_Length_0(
      self,
    );
  }

  late final _b2Vec2_Length_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Float Function(ffi.Pointer<b2Vec2>)>>(
          'b2Vec2_Length_0');
  late final _b2Vec2_Length_0 =
      _b2Vec2_Length_0Ptr.asFunction<double Function(ffi.Pointer<b2Vec2>)>();
}

/// A 2D column vector.
class b2Vec2 extends ffi.Struct {
  @ffi.Float()
  external double x;

  @ffi.Float()
  external double y;
}
