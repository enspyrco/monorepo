import 'dart:ffi';

// import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';
import 'delegates.dart';

final DynamicLibrary _symbols = DynamicLibrary.process();

typedef EmptyConstructor = Pointer<Void> Function();

class B2Vec2FfiAdapter implements B2Vec2Platform {

	final Pointer<Void> _self;
	B2Vec2FfiAdapter._(Pointer<Void> self) : _self = self;

	static final _ctr0 = _symbols.lookup<NativeFunction<Pointer<Void> Function()>>('dart_bind_b2Vec2_b2Vec2_0').asFunction<Pointer<Void> Function()>();

	B2Vec2FfiAdapter() : _self = _ctr0();

	static final _ctr2 = _symbols.lookup<NativeFunction<Pointer<Void> Function(Float, Float)>>('dart_bind_b2Vec2_b2Vec2_2').asFunction<Pointer<Void> Function(double, double)>();

	B2Vec2FfiAdapter.from2(double x, double y) : _self = _ctr2(x, y);

	static final _setZero = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>)>>('dart_bind_b2Vec2_SetZero_0').asFunction<void Function(Pointer<Void>)>();

	@override
	void setZero() => _setZero(_self);

	static final _set = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Float, Float)>>('dart_bind_b2Vec2_Set_2').asFunction<void Function(Pointer<Void>, double, double)>();

	@override
	void set(double x, double y) => _set(_self, x, y);

	static final _op_add = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2Vec2_op_add_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();

	@override
	void op_add(B2Vec2FfiAdapter v) => _op_add(_self, v._self);

	static final _op_sub = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Pointer<Void>)>>('dart_bind_b2Vec2_op_sub_1').asFunction<void Function(Pointer<Void>, Pointer<Void>)>();

	@override
	void op_sub(B2Vec2FfiAdapter v) => _op_sub(_self, v._self);

	static final _op_mul = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>('dart_bind_b2Vec2_op_mul_1').asFunction<void Function(Pointer<Void>, double)>();

	@override
	void op_mul(double s) => _op_mul(_self, s);

	static final _length = _symbols.lookup<NativeFunction<Float Function(Pointer<Void>)>>('dart_bind_b2Vec2_Length_0').asFunction<double Function(Pointer<Void>)>();

	@override
	double length() => _length(_self);

	static final _lengthSquared = _symbols.lookup<NativeFunction<Float Function(Pointer<Void>)>>('dart_bind_b2Vec2_LengthSquared_0').asFunction<double Function(Pointer<Void>)>();

	@override
	double lengthSquared() => _lengthSquared(_self);

	static final _normalize = _symbols.lookup<NativeFunction<Float Function(Pointer<Void>)>>('dart_bind_b2Vec2_Normalize_0').asFunction<double Function(Pointer<Void>)>();

	@override
	double normalize() => _normalize(_self);

	static final _isValid = _symbols.lookup<NativeFunction<Bool Function(Pointer<Void>)>>('dart_bind_b2Vec2_IsValid_0').asFunction<bool Function(Pointer<Void>)>();

	@override
	bool isValid() => _isValid(_self);

	static final _skew = _symbols.lookup<NativeFunction<Pointer<Void> Function(Pointer<Void>)>>('dart_bind_b2Vec2_Skew_0').asFunction<Pointer<Void> Function(Pointer<Void>)>();

	@override
	B2Vec2FfiAdapter skew() => B2Vec2FfiAdapter._(_skew(_self));

	static final _set_x = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>('dart_bind_b2Vec2_set_x_1').asFunction<void Function(Pointer<Void>, double)>();

	@override
	void set x(double arg0) => _set_x(_self, arg0);

	static final _set_y = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>, Float)>>('dart_bind_b2Vec2_set_y_1').asFunction<void Function(Pointer<Void>, double)>();

	@override
	void set y(double arg0) => _set_y(_self, arg0);

	static final ___destroy__ = _symbols.lookup<NativeFunction<Void Function(Pointer<Void>)>>('dart_bind_b2Vec2___destroy___0').asFunction<void Function(Pointer<Void>)>();

	@override
	void dispose() => ___destroy__(_self);

}
