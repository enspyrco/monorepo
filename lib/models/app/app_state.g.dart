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
      'navSelection',
      serializers.serialize(object.navSelection,
          specifiedType: const FullType(NavSelection)),
      'signInStep',
      serializers.serialize(object.signInStep,
          specifiedType: const FullType(SignInStep)),
    ];
    if (object.displayProblem != null) {
      result
        ..add('displayProblem')
        ..add(serializers.serialize(object.displayProblem,
            specifiedType: const FullType(Problem)));
    }
    if (object.authData != null) {
      result
        ..add('authData')
        ..add(serializers.serialize(object.authData,
            specifiedType: const FullType(AuthData)));
    }
    if (object.flireator != null) {
      result
        ..add('flireator')
        ..add(serializers.serialize(object.flireator,
            specifiedType: const FullType(Flireator)));
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
        case 'navSelection':
          result.navSelection = serializers.deserialize(value,
              specifiedType: const FullType(NavSelection)) as NavSelection;
          break;
        case 'signInStep':
          result.signInStep = serializers.deserialize(value,
              specifiedType: const FullType(SignInStep)) as SignInStep;
          break;
        case 'authData':
          result.authData.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthData)) as AuthData);
          break;
        case 'flireator':
          result.flireator.replace(serializers.deserialize(value,
              specifiedType: const FullType(Flireator)) as Flireator);
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
  final NavSelection navSelection;
  @override
  final SignInStep signInStep;
  @override
  final AuthData authData;
  @override
  final Flireator flireator;
  @override
  final String gitHubToken;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.problems,
      this.displayProblem,
      this.settings,
      this.navSelection,
      this.signInStep,
      this.authData,
      this.flireator,
      this.gitHubToken})
      : super._() {
    if (problems == null) {
      throw new BuiltValueNullFieldError('AppState', 'problems');
    }
    if (settings == null) {
      throw new BuiltValueNullFieldError('AppState', 'settings');
    }
    if (navSelection == null) {
      throw new BuiltValueNullFieldError('AppState', 'navSelection');
    }
    if (signInStep == null) {
      throw new BuiltValueNullFieldError('AppState', 'signInStep');
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
        navSelection == other.navSelection &&
        signInStep == other.signInStep &&
        authData == other.authData &&
        flireator == other.flireator &&
        gitHubToken == other.gitHubToken;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, problems.hashCode),
                                displayProblem.hashCode),
                            settings.hashCode),
                        navSelection.hashCode),
                    signInStep.hashCode),
                authData.hashCode),
            flireator.hashCode),
        gitHubToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('problems', problems)
          ..add('displayProblem', displayProblem)
          ..add('settings', settings)
          ..add('navSelection', navSelection)
          ..add('signInStep', signInStep)
          ..add('authData', authData)
          ..add('flireator', flireator)
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

  NavSelection _navSelection;
  NavSelection get navSelection => _$this._navSelection;
  set navSelection(NavSelection navSelection) =>
      _$this._navSelection = navSelection;

  SignInStep _signInStep;
  SignInStep get signInStep => _$this._signInStep;
  set signInStep(SignInStep signInStep) => _$this._signInStep = signInStep;

  AuthDataBuilder _authData;
  AuthDataBuilder get authData => _$this._authData ??= new AuthDataBuilder();
  set authData(AuthDataBuilder authData) => _$this._authData = authData;

  FlireatorBuilder _flireator;
  FlireatorBuilder get flireator =>
      _$this._flireator ??= new FlireatorBuilder();
  set flireator(FlireatorBuilder flireator) => _$this._flireator = flireator;

  String _gitHubToken;
  String get gitHubToken => _$this._gitHubToken;
  set gitHubToken(String gitHubToken) => _$this._gitHubToken = gitHubToken;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _problems = _$v.problems?.toBuilder();
      _displayProblem = _$v.displayProblem?.toBuilder();
      _settings = _$v.settings?.toBuilder();
      _navSelection = _$v.navSelection;
      _signInStep = _$v.signInStep;
      _authData = _$v.authData?.toBuilder();
      _flireator = _$v.flireator?.toBuilder();
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
              navSelection: navSelection,
              signInStep: signInStep,
              authData: _authData?.build(),
              flireator: _flireator?.build(),
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

        _$failedField = 'authData';
        _authData?.build();
        _$failedField = 'flireator';
        _flireator?.build();
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
