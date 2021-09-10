// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'announce_presence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnouncePresence _$AnnouncePresenceFromJson(Map<String, dynamic> json) {
  return _AnnouncePresence.fromJson(json);
}

/// @nodoc
class _$AnnouncePresenceTearOff {
  const _$AnnouncePresenceTearOff();

  _AnnouncePresence call(String userId, {String type = 'announce_presence'}) {
    return _AnnouncePresence(
      userId,
      type: type,
    );
  }

  AnnouncePresence fromJson(Map<String, Object> json) {
    return AnnouncePresence.fromJson(json);
  }
}

/// @nodoc
const $AnnouncePresence = _$AnnouncePresenceTearOff();

/// @nodoc
mixin _$AnnouncePresence {
  String get userId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncePresenceCopyWith<AnnouncePresence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncePresenceCopyWith<$Res> {
  factory $AnnouncePresenceCopyWith(
          AnnouncePresence value, $Res Function(AnnouncePresence) then) =
      _$AnnouncePresenceCopyWithImpl<$Res>;
  $Res call({String userId, String type});
}

/// @nodoc
class _$AnnouncePresenceCopyWithImpl<$Res>
    implements $AnnouncePresenceCopyWith<$Res> {
  _$AnnouncePresenceCopyWithImpl(this._value, this._then);

  final AnnouncePresence _value;
  // ignore: unused_field
  final $Res Function(AnnouncePresence) _then;

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
abstract class _$AnnouncePresenceCopyWith<$Res>
    implements $AnnouncePresenceCopyWith<$Res> {
  factory _$AnnouncePresenceCopyWith(
          _AnnouncePresence value, $Res Function(_AnnouncePresence) then) =
      __$AnnouncePresenceCopyWithImpl<$Res>;
  @override
  $Res call({String userId, String type});
}

/// @nodoc
class __$AnnouncePresenceCopyWithImpl<$Res>
    extends _$AnnouncePresenceCopyWithImpl<$Res>
    implements _$AnnouncePresenceCopyWith<$Res> {
  __$AnnouncePresenceCopyWithImpl(
      _AnnouncePresence _value, $Res Function(_AnnouncePresence) _then)
      : super(_value, (v) => _then(v as _AnnouncePresence));

  @override
  _AnnouncePresence get _value => super._value as _AnnouncePresence;

  @override
  $Res call({
    Object? userId = freezed,
    Object? type = freezed,
  }) {
    return _then(_AnnouncePresence(
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
class _$_AnnouncePresence implements _AnnouncePresence {
  _$_AnnouncePresence(this.userId, {this.type = 'announce_presence'});

  factory _$_AnnouncePresence.fromJson(Map<String, dynamic> json) =>
      _$$_AnnouncePresenceFromJson(json);

  @override
  final String userId;
  @JsonKey(defaultValue: 'announce_presence')
  @override
  final String type;

  @override
  String toString() {
    return 'AnnouncePresence(userId: $userId, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AnnouncePresence &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$AnnouncePresenceCopyWith<_AnnouncePresence> get copyWith =>
      __$AnnouncePresenceCopyWithImpl<_AnnouncePresence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnouncePresenceToJson(this);
  }
}

abstract class _AnnouncePresence implements AnnouncePresence {
  factory _AnnouncePresence(String userId, {String type}) = _$_AnnouncePresence;

  factory _AnnouncePresence.fromJson(Map<String, dynamic> json) =
      _$_AnnouncePresence.fromJson;

  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnnouncePresenceCopyWith<_AnnouncePresence> get copyWith =>
      throw _privateConstructorUsedError;
}
