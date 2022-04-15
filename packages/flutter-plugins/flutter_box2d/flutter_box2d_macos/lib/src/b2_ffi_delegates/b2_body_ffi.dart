part of '../b2_ffi_delegates.dart';

typedef CreateFixtureNt = Pointer<Void> Function(
    Pointer<Void>, Pointer<Void>, Float);
typedef CreateFixtureDt = Pointer<Void> Function(
    Pointer<Void>, Pointer<Void>, double);

typedef SetAwakeNt = Void Function(Pointer<Void>, Bool);
typedef SetAwakeDt = void Function(Pointer<Void>, bool);

typedef SetEnabledNt = Void Function(Pointer<Void>, Bool);
typedef SetEnabledDt = void Function(Pointer<Void>, bool);

typedef SetLinearVelocityNt = Void Function(Pointer<Void>, Pointer<Void>);
typedef SetLinearVelocityDt = void Function(Pointer<Void>, Pointer<Void>);

typedef SetTransformNt = Void Function(Pointer<Void>, Pointer<Void>, Float);
typedef SetTransformDt = void Function(Pointer<Void>, Pointer<Void>, double);

typedef GetPosition = Pointer<Void> Function(Pointer<Void>);

typedef GetLinearVelocity = Pointer<Void> Function(Pointer<Void>);

class B2BodyFfi implements B2BodyPlatform {
  final Pointer<Void> _self;

  B2BodyFfi._(Pointer<Void> ptr) : _self = ptr;

  // b2Fixture* dart_bind_b2Body_CreateFixture_2(b2Body* self, b2Shape* shape, float density)
  static final _createFixture =
      _symbols.lookupFunction<CreateFixtureNt, CreateFixtureDt>(
          'dart_bind_b2Body_CreateFixture_2');

  @override
  B2FixtureFfi createFixture2(B2ShapeFfi shape, double density) =>
      B2FixtureFfi._(_createFixture(_self, shape._self, density));

  // b2Vec2* dart_bind_b2Body_GetLinearVelocity_0(b2Body* self)
  static final _getLinearVelocity =
      _symbols.lookupFunction<GetLinearVelocity, GetLinearVelocity>(
          'dart_bind_b2Body_GetLinearVelocity_0');

  @override
  B2Vec2Platform getLinearVelocity() => B2Vec2Ffi._(_getLinearVelocity(_self));

  // b2Vec2* dart_bind_b2Body_GetPosition_0(b2Body* self)
  static final _getPosition = _symbols.lookupFunction<GetPosition, GetPosition>(
      'dart_bind_b2Body_GetPosition_0');

  @override
  B2Vec2Platform getPosition() => B2Vec2Ffi._(_getPosition(_self));

  // C: void fn(b2Body* self, bool flag)
  static final _setAwake = _symbols
      .lookupFunction<SetAwakeNt, SetAwakeDt>('dart_bind_b2Body_SetAwake_1');

  @override
  void setAwake(bool flag) => _setAwake(_self, flag);

  // void fn(b2Body* self, bool flag)
  static final _setEnabled =
      _symbols.lookupFunction<SetEnabledNt, SetEnabledDt>(
          'dart_bind_b2Body_SetEnabled_1');

  @override
  void setEnabled(bool flag) => _setEnabled(_self, flag);

  // void fn(b2Body* self, const b2Vec2* v)
  static final _setLinearVelocity =
      _symbols.lookupFunction<SetLinearVelocityNt, SetLinearVelocityDt>(
          'dart_bind_b2Body_SetLinearVelocity_1');

  @override
  void setLinearVelocity(B2Vec2Ffi v) => _setLinearVelocity(_self, v._self);

  // void fn(b2Body* self, const b2Vec2* position, float angle)
  static final _setTransform =
      _symbols.lookupFunction<SetTransformNt, SetTransformDt>(
          'dart_bind_b2Body_SetTransform_2');

  @override
  void setTransform(B2Vec2Ffi position, double angle) =>
      _setTransform(_self, position._self, angle);
}
