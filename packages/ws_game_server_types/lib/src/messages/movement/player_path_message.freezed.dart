// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_path_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerPathMessage _$PlayerPathMessageFromJson(Map<String, dynamic> json) {
  return _PlayerPathMessage.fromJson(json);
}

/// @nodoc
class _$PlayerPathMessageTearOff {
  const _$PlayerPathMessageTearOff();

  _PlayerPathMessage call(
      {String type = PlayerPathMessage.jsonType,
      required String userId,
      required IList<Double2> points}) {
    return _PlayerPathMessage(
      type: type,
      userId: userId,
      points: points,
    );
  }

  PlayerPathMessage fromJson(Map<String, Object?> json) {
    return PlayerPathMessage.fromJson(json);
  }
}

/// @nodoc
const $PlayerPathMessage = _$PlayerPathMessageTearOff();

/// @nodoc
mixin _$PlayerPathMessage {
  String get type => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  IList<Double2> get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerPathMessageCopyWith<PlayerPathMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerPathMessageCopyWith<$Res> {
  factory $PlayerPathMessageCopyWith(
          PlayerPathMessage value, $Res Function(PlayerPathMessage) then) =
      _$PlayerPathMessageCopyWithImpl<$Res>;
  $Res call({String type, String userId, IList<Double2> points});
}

/// @nodoc
class _$PlayerPathMessageCopyWithImpl<$Res>
    implements $PlayerPathMessageCopyWith<$Res> {
  _$PlayerPathMessageCopyWithImpl(this._value, this._then);

  final PlayerPathMessage _value;
  // ignore: unused_field
  final $Res Function(PlayerPathMessage) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? userId = freezed,
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as IList<Double2>,
    ));
  }
}

/// @nodoc
abstract class _$PlayerPathMessageCopyWith<$Res>
    implements $PlayerPathMessageCopyWith<$Res> {
  factory _$PlayerPathMessageCopyWith(
          _PlayerPathMessage value, $Res Function(_PlayerPathMessage) then) =
      __$PlayerPathMessageCopyWithImpl<$Res>;
  @override
  $Res call({String type, String userId, IList<Double2> points});
}

/// @nodoc
class __$PlayerPathMessageCopyWithImpl<$Res>
    extends _$PlayerPathMessageCopyWithImpl<$Res>
    implements _$PlayerPathMessageCopyWith<$Res> {
  __$PlayerPathMessageCopyWithImpl(
      _PlayerPathMessage _value, $Res Function(_PlayerPathMessage) _then)
      : super(_value, (v) => _then(v as _PlayerPathMessage));

  @override
  _PlayerPathMessage get _value => super._value as _PlayerPathMessage;

  @override
  $Res call({
    Object? type = freezed,
    Object? userId = freezed,
    Object? points = freezed,
  }) {
    return _then(_PlayerPathMessage(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as IList<Double2>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayerPathMessage implements _PlayerPathMessage {
  _$_PlayerPathMessage(
      {this.type = PlayerPathMessage.jsonType,
      required this.userId,
      required this.points});

  factory _$_PlayerPathMessage.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerPathMessageFromJson(json);

  @JsonKey()
  @override
  final String type;
  @override
  final String userId;
  @override
  final IList<Double2> points;

  @override
  String toString() {
    return 'PlayerPathMessage(type: $type, userId: $userId, points: $points)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerPathMessage &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.points, points));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(points));

  @JsonKey(ignore: true)
  @override
  _$PlayerPathMessageCopyWith<_PlayerPathMessage> get copyWith =>
      __$PlayerPathMessageCopyWithImpl<_PlayerPathMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerPathMessageToJson(this);
  }
}

abstract class _PlayerPathMessage implements PlayerPathMessage {
  factory _PlayerPathMessage(
      {String type,
      required String userId,
      required IList<Double2> points}) = _$_PlayerPathMessage;

  factory _PlayerPathMessage.fromJson(Map<String, dynamic> json) =
      _$_PlayerPathMessage.fromJson;

  @override
  String get type;
  @override
  String get userId;
  @override
  IList<Double2> get points;
  @override
  @JsonKey(ignore: true)
  _$PlayerPathMessageCopyWith<_PlayerPathMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
