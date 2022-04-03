part of '../b2_ffi_delegates.dart';

typedef NtSetPosition = Void Function(Pointer<Void>, Pointer<Void>);
typedef DtSetPosition = void Function(Pointer<Void>, Pointer<Void>);

typedef NtSetType = Void Function(Pointer<Void>, Int32);
typedef DtSetType = void Function(Pointer<Void>, int);

class B2BodyDefFfi implements B2BodyDefDelegate {
  final Pointer<Void> _self;

  B2BodyDefFfi()
      : _self = _symbols.lookupFunction<EmptyConstructor, EmptyConstructor>(
            'dart_bind_b2BodyDef_b2BodyDef_0')();

  Pointer<Void> get ptr => _self;

  // C++ glue: void dart_bind_b2BodyDef_set_position_1(b2BodyDef* self, b2Vec2* arg0)
  static final _setPosition =
      _symbols.lookupFunction<NtSetPosition, DtSetPosition>(
          'dart_bind_b2BodyDef_set_position_1');

  @override
  void setPosition(B2Vec2Ffi position) => _setPosition(_self, position._self);

  // C++ glue: void dart_bind_b2BodyDef_set_type_1(b2BodyDef* self, b2BodyType arg0)
  static final _setType = _symbols
      .lookupFunction<NtSetType, DtSetType>('dart_bind_b2BodyDef_set_type_1');

  @override
  void setType(int arg) => _setType(_self, arg);
}
