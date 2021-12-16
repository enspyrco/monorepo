// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'present_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PresentMessage _$PresentMessageFromJson(Map<String, dynamic> json) {
  return _PresentMessage.fromJson(json);
}

/// @nodoc
class _$PresentMessageTearOff {
  const _$PresentMessageTearOff();

  _PresentMessage call(String userId, {String type = PresentMessage.jsonType}) {
    return _PresentMessage(
      userId,
      type: type,
    );
  }

  PresentMessage fromJson(Map<String, Object?> json) {
    return PresentMessage.fromJson(json);
  }
}

/// @nodoc
const $PresentMessage = _$PresentMessageTearOff();

/// @nodoc
mixin _$PresentMessage {
  String get userId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PresentMessageCopyWith<PresentMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresentMessageCopyWith<$Res> {
  factory $PresentMessageCopyWith(
          PresentMessage value, $Res Function(PresentMessage) then) =
      _$PresentMessageCopyWithImpl<$Res>;
  $Res call({String userId, String type});
}

/// @nodoc
class _$PresentMessageCopyWithImpl<$Res>
    implements $PresentMessageCopyWith<$Res> {
  _$PresentMessageCopyWithImpl(this._value, this._then);

  final PresentMessage _value;
  // ignore: unused_field
  final $Res Function(PresentMessage) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PresentMessageCopyWith<$Res>
    implements $PresentMessageCopyWith<$Res> {
  factory _$PresentMessageCopyWith(
          _PresentMessage value, $Res Function(_PresentMessage) then) =
      __$PresentMessageCopyWithImpl<$Res>;
  @override
  $Res call({String userId, String type});
}

/// @nodoc
class __$PresentMessageCopyWithImpl<$Res>
    extends _$PresentMessageCopyWithImpl<$Res>
    implements _$PresentMessageCopyWith<$Res> {
  __$PresentMessageCopyWithImpl(
      _PresentMessage _value, $Res Function(_PresentMessage) _then)
      : super(_value, (v) => _then(v as _PresentMessage));

  @override
  _PresentMessage get _value => super._value as _PresentMessage;

  @override
  $Res call({
    Object? userId = freezed,
    Object? type = freezed,
  }) {
    return _then(_PresentMessage(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PresentMessage implements _PresentMessage {
  _$_PresentMessage(this.userId, {this.type = PresentMessage.jsonType});

  factory _$_PresentMessage.fromJson(Map<String, dynamic> json) =>
      _$$_PresentMessageFromJson(json);

  @override
  final String userId;
  @JsonKey()
  @override
  final String type;

  @override
  String toString() {
    return 'PresentMessage(userId: $userId, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PresentMessage &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$PresentMessageCopyWith<_PresentMessage> get copyWith =>
      __$PresentMessageCopyWithImpl<_PresentMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PresentMessageToJson(this);
  }
}

abstract class _PresentMessage implements PresentMessage {
  factory _PresentMessage(String userId, {String type}) = _$_PresentMessage;

  factory _PresentMessage.fromJson(Map<String, dynamic> json) =
      _$_PresentMessage.fromJson;

  @override
  String get userId;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$PresentMessageCopyWith<_PresentMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
