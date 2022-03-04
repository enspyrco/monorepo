// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'other_player_ids_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtherPlayerIdsMessage _$OtherPlayerIdsMessageFromJson(
    Map<String, dynamic> json) {
  return _OtherPlayerIdsMessage.fromJson(json);
}

/// @nodoc
class _$OtherPlayerIdsMessageTearOff {
  const _$OtherPlayerIdsMessageTearOff();

  _OtherPlayerIdsMessage call(
      {String type = OtherPlayerIdsMessage.jsonType,
      required ISet<String> ids}) {
    return _OtherPlayerIdsMessage(
      type: type,
      ids: ids,
    );
  }

  OtherPlayerIdsMessage fromJson(Map<String, Object?> json) {
    return OtherPlayerIdsMessage.fromJson(json);
  }
}

/// @nodoc
const $OtherPlayerIdsMessage = _$OtherPlayerIdsMessageTearOff();

/// @nodoc
mixin _$OtherPlayerIdsMessage {
  String get type => throw _privateConstructorUsedError;
  ISet<String> get ids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtherPlayerIdsMessageCopyWith<OtherPlayerIdsMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherPlayerIdsMessageCopyWith<$Res> {
  factory $OtherPlayerIdsMessageCopyWith(OtherPlayerIdsMessage value,
          $Res Function(OtherPlayerIdsMessage) then) =
      _$OtherPlayerIdsMessageCopyWithImpl<$Res>;
  $Res call({String type, ISet<String> ids});
}

/// @nodoc
class _$OtherPlayerIdsMessageCopyWithImpl<$Res>
    implements $OtherPlayerIdsMessageCopyWith<$Res> {
  _$OtherPlayerIdsMessageCopyWithImpl(this._value, this._then);

  final OtherPlayerIdsMessage _value;
  // ignore: unused_field
  final $Res Function(OtherPlayerIdsMessage) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? ids = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as ISet<String>,
    ));
  }
}

/// @nodoc
abstract class _$OtherPlayerIdsMessageCopyWith<$Res>
    implements $OtherPlayerIdsMessageCopyWith<$Res> {
  factory _$OtherPlayerIdsMessageCopyWith(_OtherPlayerIdsMessage value,
          $Res Function(_OtherPlayerIdsMessage) then) =
      __$OtherPlayerIdsMessageCopyWithImpl<$Res>;
  @override
  $Res call({String type, ISet<String> ids});
}

/// @nodoc
class __$OtherPlayerIdsMessageCopyWithImpl<$Res>
    extends _$OtherPlayerIdsMessageCopyWithImpl<$Res>
    implements _$OtherPlayerIdsMessageCopyWith<$Res> {
  __$OtherPlayerIdsMessageCopyWithImpl(_OtherPlayerIdsMessage _value,
      $Res Function(_OtherPlayerIdsMessage) _then)
      : super(_value, (v) => _then(v as _OtherPlayerIdsMessage));

  @override
  _OtherPlayerIdsMessage get _value => super._value as _OtherPlayerIdsMessage;

  @override
  $Res call({
    Object? type = freezed,
    Object? ids = freezed,
  }) {
    return _then(_OtherPlayerIdsMessage(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as ISet<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtherPlayerIdsMessage implements _OtherPlayerIdsMessage {
  _$_OtherPlayerIdsMessage(
      {this.type = OtherPlayerIdsMessage.jsonType, required this.ids});

  factory _$_OtherPlayerIdsMessage.fromJson(Map<String, dynamic> json) =>
      _$$_OtherPlayerIdsMessageFromJson(json);

  @JsonKey()
  @override
  final String type;
  @override
  final ISet<String> ids;

  @override
  String toString() {
    return 'OtherPlayerIdsMessage(type: $type, ids: $ids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OtherPlayerIdsMessage &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.ids, ids));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(ids));

  @JsonKey(ignore: true)
  @override
  _$OtherPlayerIdsMessageCopyWith<_OtherPlayerIdsMessage> get copyWith =>
      __$OtherPlayerIdsMessageCopyWithImpl<_OtherPlayerIdsMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtherPlayerIdsMessageToJson(this);
  }
}

abstract class _OtherPlayerIdsMessage implements OtherPlayerIdsMessage {
  factory _OtherPlayerIdsMessage({String type, required ISet<String> ids}) =
      _$_OtherPlayerIdsMessage;

  factory _OtherPlayerIdsMessage.fromJson(Map<String, dynamic> json) =
      _$_OtherPlayerIdsMessage.fromJson;

  @override
  String get type;
  @override
  ISet<String> get ids;
  @override
  @JsonKey(ignore: true)
  _$OtherPlayerIdsMessageCopyWith<_OtherPlayerIdsMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
