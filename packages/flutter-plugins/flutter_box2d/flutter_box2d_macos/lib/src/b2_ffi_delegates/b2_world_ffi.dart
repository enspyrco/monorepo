part of '../b2_ffi_delegates.dart';

typedef WorldConstructor = Pointer<Void> Function(Pointer<Void>);

typedef NtStep = Void Function(Pointer<Void>, Float, Int32, Int32);
typedef DtStep = void Function(Pointer<Void>, double, int, int);

typedef CeateBodyFn = Pointer<Void> Function(Pointer<Void>, Pointer<Void>);

class B2WorldFfi implements B2WorldPlatform {
  final Pointer<Void> _self;

  // C: b2World* fn(const b2Vec2* gravity)
  static final _ctr =
      _symbols.lookupFunction<WorldConstructor, WorldConstructor>(
          'dart_bind_b2World_b2World_1');

  B2WorldFfi(B2Vec2Ffi vec) : _self = _ctr(vec._self);

  /// C: b2Body* fn(b2World* self, const b2BodyDef* def)
  static final _createBody = _symbols.lookupFunction<CeateBodyFn, CeateBodyFn>(
      'dart_bind_b2World_CreateBody_1');

  @override
  B2BodyPlatform createBody(B2BodyDefFfi def) =>
      B2BodyFfi._(_createBody(_self, def._self));

  /// C: void fn(b2World* self, float timeStep, int velocityIterations, int positionIterations)
  static final _step =
      _symbols.lookupFunction<NtStep, DtStep>('dart_bind_b2World_Step_3');

  @override
  void step(double timeStep, int velocityIterations, int positionIterations) {
    _step(_self, timeStep, velocityIterations, positionIterations);
  }
}
