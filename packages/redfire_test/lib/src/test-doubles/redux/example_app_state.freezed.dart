// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'example_app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExampleAppState _$ExampleAppStateFromJson(Map<String, dynamic> json) {
  return _ExampleAppState.fromJson(json);
}

/// @nodoc
class _$ExampleAppStateTearOff {
  const _$ExampleAppStateTearOff();

  _ExampleAppState call(
      {@PageDataConverter() required IList<PageData> pages,
      required IList<ProblemInfo> problems,
      required Settings settings,
      required AuthState auth,
      ProfileData? profile}) {
    return _ExampleAppState(
      pages: pages,
      problems: problems,
      settings: settings,
      auth: auth,
      profile: profile,
    );
  }

  ExampleAppState fromJson(Map<String, Object?> json) {
    return ExampleAppState.fromJson(json);
  }
}

/// @nodoc
const $ExampleAppState = _$ExampleAppStateTearOff();

/// @nodoc
mixin _$ExampleAppState {
  @PageDataConverter()
  IList<PageData> get pages => throw _privateConstructorUsedError;
  IList<ProblemInfo> get problems => throw _privateConstructorUsedError;
  Settings get settings => throw _privateConstructorUsedError;
  AuthState get auth => throw _privateConstructorUsedError;
  ProfileData? get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExampleAppStateCopyWith<ExampleAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleAppStateCopyWith<$Res> {
  factory $ExampleAppStateCopyWith(
          ExampleAppState value, $Res Function(ExampleAppState) then) =
      _$ExampleAppStateCopyWithImpl<$Res>;
  $Res call(
      {@PageDataConverter() IList<PageData> pages,
      IList<ProblemInfo> problems,
      Settings settings,
      AuthState auth,
      ProfileData? profile});

  $SettingsCopyWith<$Res> get settings;
  $AuthStateCopyWith<$Res> get auth;
  $ProfileDataCopyWith<$Res>? get profile;
}

/// @nodoc
class _$ExampleAppStateCopyWithImpl<$Res>
    implements $ExampleAppStateCopyWith<$Res> {
  _$ExampleAppStateCopyWithImpl(this._value, this._then);

  final ExampleAppState _value;
  // ignore: unused_field
  final $Res Function(ExampleAppState) _then;

  @override
  $Res call({
    Object? pages = freezed,
    Object? problems = freezed,
    Object? settings = freezed,
    Object? auth = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as IList<PageData>,
      problems: problems == freezed
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as IList<ProblemInfo>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthState,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileData?,
    ));
  }

  @override
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }

  @override
  $AuthStateCopyWith<$Res> get auth {
    return $AuthStateCopyWith<$Res>(_value.auth, (value) {
      return _then(_value.copyWith(auth: value));
    });
  }

  @override
  $ProfileDataCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileDataCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc
abstract class _$ExampleAppStateCopyWith<$Res>
    implements $ExampleAppStateCopyWith<$Res> {
  factory _$ExampleAppStateCopyWith(
          _ExampleAppState value, $Res Function(_ExampleAppState) then) =
      __$ExampleAppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@PageDataConverter() IList<PageData> pages,
      IList<ProblemInfo> problems,
      Settings settings,
      AuthState auth,
      ProfileData? profile});

  @override
  $SettingsCopyWith<$Res> get settings;
  @override
  $AuthStateCopyWith<$Res> get auth;
  @override
  $ProfileDataCopyWith<$Res>? get profile;
}

/// @nodoc
class __$ExampleAppStateCopyWithImpl<$Res>
    extends _$ExampleAppStateCopyWithImpl<$Res>
    implements _$ExampleAppStateCopyWith<$Res> {
  __$ExampleAppStateCopyWithImpl(
      _ExampleAppState _value, $Res Function(_ExampleAppState) _then)
      : super(_value, (v) => _then(v as _ExampleAppState));

  @override
  _ExampleAppState get _value => super._value as _ExampleAppState;

  @override
  $Res call({
    Object? pages = freezed,
    Object? problems = freezed,
    Object? settings = freezed,
    Object? auth = freezed,
    Object? profile = freezed,
  }) {
    return _then(_ExampleAppState(
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as IList<PageData>,
      problems: problems == freezed
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as IList<ProblemInfo>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthState,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExampleAppState implements _ExampleAppState {
  _$_ExampleAppState(
      {@PageDataConverter() required this.pages,
      required this.problems,
      required this.settings,
      required this.auth,
      this.profile});

  factory _$_ExampleAppState.fromJson(Map<String, dynamic> json) =>
      _$$_ExampleAppStateFromJson(json);

  @override
  @PageDataConverter()
  final IList<PageData> pages;
  @override
  final IList<ProblemInfo> problems;
  @override
  final Settings settings;
  @override
  final AuthState auth;
  @override
  final ProfileData? profile;

  @override
  String toString() {
    return 'ExampleAppState(pages: $pages, problems: $problems, settings: $settings, auth: $auth, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExampleAppState &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.problems, problems) ||
                other.problems == problems) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pages, problems, settings, auth, profile);

  @JsonKey(ignore: true)
  @override
  _$ExampleAppStateCopyWith<_ExampleAppState> get copyWith =>
      __$ExampleAppStateCopyWithImpl<_ExampleAppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExampleAppStateToJson(this);
  }
}

abstract class _ExampleAppState implements ExampleAppState {
  factory _ExampleAppState(
      {@PageDataConverter() required IList<PageData> pages,
      required IList<ProblemInfo> problems,
      required Settings settings,
      required AuthState auth,
      ProfileData? profile}) = _$_ExampleAppState;

  factory _ExampleAppState.fromJson(Map<String, dynamic> json) =
      _$_ExampleAppState.fromJson;

  @override
  @PageDataConverter()
  IList<PageData> get pages;
  @override
  IList<ProblemInfo> get problems;
  @override
  Settings get settings;
  @override
  AuthState get auth;
  @override
  ProfileData? get profile;
  @override
  @JsonKey(ignore: true)
  _$ExampleAppStateCopyWith<_ExampleAppState> get copyWith =>
      throw _privateConstructorUsedError;
}
