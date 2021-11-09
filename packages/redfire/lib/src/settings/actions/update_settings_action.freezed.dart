// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_settings_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateSettingsAction _$UpdateSettingsActionFromJson(Map<String, dynamic> json) {
  return _UpdateSettingsAction.fromJson(json);
}

/// @nodoc
class _$UpdateSettingsActionTearOff {
  const _$UpdateSettingsActionTearOff();

  _UpdateSettingsAction call({required PlatformsEnum platform}) {
    return _UpdateSettingsAction(
      platform: platform,
    );
  }

  UpdateSettingsAction fromJson(Map<String, Object?> json) {
    return UpdateSettingsAction.fromJson(json);
  }
}

/// @nodoc
const $UpdateSettingsAction = _$UpdateSettingsActionTearOff();

/// @nodoc
mixin _$UpdateSettingsAction {
  PlatformsEnum get platform => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateSettingsActionCopyWith<UpdateSettingsAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSettingsActionCopyWith<$Res> {
  factory $UpdateSettingsActionCopyWith(UpdateSettingsAction value,
          $Res Function(UpdateSettingsAction) then) =
      _$UpdateSettingsActionCopyWithImpl<$Res>;
  $Res call({PlatformsEnum platform});
}

/// @nodoc
class _$UpdateSettingsActionCopyWithImpl<$Res>
    implements $UpdateSettingsActionCopyWith<$Res> {
  _$UpdateSettingsActionCopyWithImpl(this._value, this._then);

  final UpdateSettingsAction _value;
  // ignore: unused_field
  final $Res Function(UpdateSettingsAction) _then;

  @override
  $Res call({
    Object? platform = freezed,
  }) {
    return _then(_value.copyWith(
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformsEnum,
    ));
  }
}

/// @nodoc
abstract class _$UpdateSettingsActionCopyWith<$Res>
    implements $UpdateSettingsActionCopyWith<$Res> {
  factory _$UpdateSettingsActionCopyWith(_UpdateSettingsAction value,
          $Res Function(_UpdateSettingsAction) then) =
      __$UpdateSettingsActionCopyWithImpl<$Res>;
  @override
  $Res call({PlatformsEnum platform});
}

/// @nodoc
class __$UpdateSettingsActionCopyWithImpl<$Res>
    extends _$UpdateSettingsActionCopyWithImpl<$Res>
    implements _$UpdateSettingsActionCopyWith<$Res> {
  __$UpdateSettingsActionCopyWithImpl(
      _UpdateSettingsAction _value, $Res Function(_UpdateSettingsAction) _then)
      : super(_value, (v) => _then(v as _UpdateSettingsAction));

  @override
  _UpdateSettingsAction get _value => super._value as _UpdateSettingsAction;

  @override
  $Res call({
    Object? platform = freezed,
  }) {
    return _then(_UpdateSettingsAction(
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformsEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateSettingsAction implements _UpdateSettingsAction {
  _$_UpdateSettingsAction({required this.platform});

  factory _$_UpdateSettingsAction.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateSettingsActionFromJson(json);

  @override
  final PlatformsEnum platform;

  @override
  String toString() {
    return 'UpdateSettingsAction(platform: $platform)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateSettingsAction &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, platform);

  @JsonKey(ignore: true)
  @override
  _$UpdateSettingsActionCopyWith<_UpdateSettingsAction> get copyWith =>
      __$UpdateSettingsActionCopyWithImpl<_UpdateSettingsAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateSettingsActionToJson(this);
  }
}

abstract class _UpdateSettingsAction implements UpdateSettingsAction {
  factory _UpdateSettingsAction({required PlatformsEnum platform}) =
      _$_UpdateSettingsAction;

  factory _UpdateSettingsAction.fromJson(Map<String, dynamic> json) =
      _$_UpdateSettingsAction.fromJson;

  @override
  PlatformsEnum get platform;
  @override
  @JsonKey(ignore: true)
  _$UpdateSettingsActionCopyWith<_UpdateSettingsAction> get copyWith =>
      throw _privateConstructorUsedError;
}
