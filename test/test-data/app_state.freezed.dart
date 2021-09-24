// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call(
      {required IList<RedFirePage> redFirePages,
      required IList<ProblemInfo> problems,
      required Settings settings,
      required AuthStepEnum authStep,
      required AuthUserData? authUserData}) {
    return _AppState(
      redFirePages: redFirePages,
      problems: problems,
      settings: settings,
      authStep: authStep,
      authUserData: authUserData,
    );
  }

  AppState fromJson(Map<String, Object> json) {
    return AppState.fromJson(json);
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  IList<RedFirePage> get redFirePages => throw _privateConstructorUsedError;
  IList<ProblemInfo> get problems => throw _privateConstructorUsedError;
  Settings get settings => throw _privateConstructorUsedError;
  AuthStepEnum get authStep => throw _privateConstructorUsedError;
  AuthUserData? get authUserData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {IList<RedFirePage> redFirePages,
      IList<ProblemInfo> problems,
      Settings settings,
      AuthStepEnum authStep,
      AuthUserData? authUserData});

  $SettingsCopyWith<$Res> get settings;
  $AuthUserDataCopyWith<$Res>? get authUserData;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? redFirePages = freezed,
    Object? problems = freezed,
    Object? settings = freezed,
    Object? authStep = freezed,
    Object? authUserData = freezed,
  }) {
    return _then(_value.copyWith(
      redFirePages: redFirePages == freezed
          ? _value.redFirePages
          : redFirePages // ignore: cast_nullable_to_non_nullable
              as IList<RedFirePage>,
      problems: problems == freezed
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as IList<ProblemInfo>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      authStep: authStep == freezed
          ? _value.authStep
          : authStep // ignore: cast_nullable_to_non_nullable
              as AuthStepEnum,
      authUserData: authUserData == freezed
          ? _value.authUserData
          : authUserData // ignore: cast_nullable_to_non_nullable
              as AuthUserData?,
    ));
  }

  @override
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }

  @override
  $AuthUserDataCopyWith<$Res>? get authUserData {
    if (_value.authUserData == null) {
      return null;
    }

    return $AuthUserDataCopyWith<$Res>(_value.authUserData!, (value) {
      return _then(_value.copyWith(authUserData: value));
    });
  }
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {IList<RedFirePage> redFirePages,
      IList<ProblemInfo> problems,
      Settings settings,
      AuthStepEnum authStep,
      AuthUserData? authUserData});

  @override
  $SettingsCopyWith<$Res> get settings;
  @override
  $AuthUserDataCopyWith<$Res>? get authUserData;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object? redFirePages = freezed,
    Object? problems = freezed,
    Object? settings = freezed,
    Object? authStep = freezed,
    Object? authUserData = freezed,
  }) {
    return _then(_AppState(
      redFirePages: redFirePages == freezed
          ? _value.redFirePages
          : redFirePages // ignore: cast_nullable_to_non_nullable
              as IList<RedFirePage>,
      problems: problems == freezed
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as IList<ProblemInfo>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      authStep: authStep == freezed
          ? _value.authStep
          : authStep // ignore: cast_nullable_to_non_nullable
              as AuthStepEnum,
      authUserData: authUserData == freezed
          ? _value.authUserData
          : authUserData // ignore: cast_nullable_to_non_nullable
              as AuthUserData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppState implements _AppState {
  _$_AppState(
      {required this.redFirePages,
      required this.problems,
      required this.settings,
      required this.authStep,
      required this.authUserData});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$_$_AppStateFromJson(json);

  @override
  final IList<RedFirePage> redFirePages;
  @override
  final IList<ProblemInfo> problems;
  @override
  final Settings settings;
  @override
  final AuthStepEnum authStep;
  @override
  final AuthUserData? authUserData;

  @override
  String toString() {
    return 'AppState(redFirePages: $redFirePages, problems: $problems, settings: $settings, authStep: $authStep, authUserData: $authUserData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.redFirePages, redFirePages) ||
                const DeepCollectionEquality()
                    .equals(other.redFirePages, redFirePages)) &&
            (identical(other.problems, problems) ||
                const DeepCollectionEquality()
                    .equals(other.problems, problems)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)) &&
            (identical(other.authStep, authStep) ||
                const DeepCollectionEquality()
                    .equals(other.authStep, authStep)) &&
            (identical(other.authUserData, authUserData) ||
                const DeepCollectionEquality()
                    .equals(other.authUserData, authUserData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(redFirePages) ^
      const DeepCollectionEquality().hash(problems) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(authStep) ^
      const DeepCollectionEquality().hash(authUserData);

  @JsonKey(ignore: true)
  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppStateToJson(this);
  }
}

abstract class _AppState implements AppState {
  factory _AppState(
      {required IList<RedFirePage> redFirePages,
      required IList<ProblemInfo> problems,
      required Settings settings,
      required AuthStepEnum authStep,
      required AuthUserData? authUserData}) = _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  IList<RedFirePage> get redFirePages => throw _privateConstructorUsedError;
  @override
  IList<ProblemInfo> get problems => throw _privateConstructorUsedError;
  @override
  Settings get settings => throw _privateConstructorUsedError;
  @override
  AuthStepEnum get authStep => throw _privateConstructorUsedError;
  @override
  AuthUserData? get authUserData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppStateCopyWith<_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
