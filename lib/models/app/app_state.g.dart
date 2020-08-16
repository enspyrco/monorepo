// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'problems',
      serializers.serialize(object.problems,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Problem)])),
      'settings',
      serializers.serialize(object.settings,
          specifiedType: const FullType(Settings)),
      'authStep',
      serializers.serialize(object.authStep,
          specifiedType: const FullType(AuthStep)),
    ];
    if (object.displayProblem != null) {
      result
        ..add('displayProblem')
        ..add(serializers.serialize(object.displayProblem,
            specifiedType: const FullType(Problem)));
    }
    if (object.userData != null) {
      result
        ..add('userData')
        ..add(serializers.serialize(object.userData,
            specifiedType: const FullType(UserData)));
    }
    if (object.gitHubToken != null) {
      result
        ..add('gitHubToken')
        ..add(serializers.serialize(object.gitHubToken,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'problems':
          result.problems.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Problem)]))
              as BuiltList<Object>);
          break;
        case 'displayProblem':
          result.displayProblem.replace(serializers.deserialize(value,
              specifiedType: const FullType(Problem)) as Problem);
          break;
        case 'settings':
          result.settings.replace(serializers.deserialize(value,
              specifiedType: const FullType(Settings)) as Settings);
          break;
        case 'authStep':
          result.authStep = serializers.deserialize(value,
              specifiedType: const FullType(AuthStep)) as AuthStep;
          break;
        case 'userData':
          result.userData.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserData)) as UserData);
          break;
        case 'gitHubToken':
          result.gitHubToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<Problem> problems;
  @override
  final Problem displayProblem;
  @override
  final Settings settings;
  @override
  final AuthStep authStep;
  @override
  final UserData userData;
  @override
  final String gitHubToken;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.problems,
      this.displayProblem,
      this.settings,
      this.authStep,
      this.userData,
      this.gitHubToken})
      : super._() {
    if (problems == null) {
      throw new BuiltValueNullFieldError('AppState', 'problems');
    }
    if (settings == null) {
      throw new BuiltValueNullFieldError('AppState', 'settings');
    }
    if (authStep == null) {
      throw new BuiltValueNullFieldError('AppState', 'authStep');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        problems == other.problems &&
        displayProblem == other.displayProblem &&
        settings == other.settings &&
        authStep == other.authStep &&
        userData == other.userData &&
        gitHubToken == other.gitHubToken;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, problems.hashCode), displayProblem.hashCode),
                    settings.hashCode),
                authStep.hashCode),
            userData.hashCode),
        gitHubToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('problems', problems)
          ..add('displayProblem', displayProblem)
          ..add('settings', settings)
          ..add('authStep', authStep)
          ..add('userData', userData)
          ..add('gitHubToken', gitHubToken))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<Problem> _problems;
  ListBuilder<Problem> get problems =>
      _$this._problems ??= new ListBuilder<Problem>();
  set problems(ListBuilder<Problem> problems) => _$this._problems = problems;

  ProblemBuilder _displayProblem;
  ProblemBuilder get displayProblem =>
      _$this._displayProblem ??= new ProblemBuilder();
  set displayProblem(ProblemBuilder displayProblem) =>
      _$this._displayProblem = displayProblem;

  SettingsBuilder _settings;
  SettingsBuilder get settings => _$this._settings ??= new SettingsBuilder();
  set settings(SettingsBuilder settings) => _$this._settings = settings;

  AuthStep _authStep;
  AuthStep get authStep => _$this._authStep;
  set authStep(AuthStep authStep) => _$this._authStep = authStep;

  UserDataBuilder _userData;
  UserDataBuilder get userData => _$this._userData ??= new UserDataBuilder();
  set userData(UserDataBuilder userData) => _$this._userData = userData;

  String _gitHubToken;
  String get gitHubToken => _$this._gitHubToken;
  set gitHubToken(String gitHubToken) => _$this._gitHubToken = gitHubToken;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _problems = _$v.problems?.toBuilder();
      _displayProblem = _$v.displayProblem?.toBuilder();
      _settings = _$v.settings?.toBuilder();
      _authStep = _$v.authStep;
      _userData = _$v.userData?.toBuilder();
      _gitHubToken = _$v.gitHubToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              problems: problems.build(),
              displayProblem: _displayProblem?.build(),
              settings: settings.build(),
              authStep: authStep,
              userData: _userData?.build(),
              gitHubToken: gitHubToken);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'problems';
        problems.build();
        _$failedField = 'displayProblem';
        _displayProblem?.build();
        _$failedField = 'settings';
        settings.build();

        _$failedField = 'userData';
        _userData?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
