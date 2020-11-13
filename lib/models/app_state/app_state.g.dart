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
      'authStep',
      serializers.serialize(object.authStep,
          specifiedType: const FullType(AuthStep)),
      'pagesData',
      serializers.serialize(object.pagesData,
          specifiedType:
              const FullType(BuiltList, const [const FullType(PageData)])),
      'navSelection',
      serializers.serialize(object.navSelection,
          specifiedType: const FullType(NavBarSelection)),
      'problems',
      serializers.serialize(object.problems,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Problem)])),
      'profileData',
      serializers.serialize(object.profileData,
          specifiedType: const FullType(ProfileData)),
      'settings',
      serializers.serialize(object.settings,
          specifiedType: const FullType(Settings)),
    ];
    if (object.teamMember != null) {
      result
        ..add('teamMember')
        ..add(serializers.serialize(object.teamMember,
            specifiedType: const FullType(TeamMember)));
    }
    if (object.authUserData != null) {
      result
        ..add('authUserData')
        ..add(serializers.serialize(object.authUserData,
            specifiedType: const FullType(AuthUserData)));
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
        case 'teamMember':
          result.teamMember.replace(serializers.deserialize(value,
              specifiedType: const FullType(TeamMember)) as TeamMember);
          break;
        case 'authStep':
          result.authStep = serializers.deserialize(value,
              specifiedType: const FullType(AuthStep)) as AuthStep;
          break;
        case 'authUserData':
          result.authUserData.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthUserData)) as AuthUserData);
          break;
        case 'pagesData':
          result.pagesData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PageData)]))
              as BuiltList<Object>);
          break;
        case 'navSelection':
          result.navSelection = serializers.deserialize(value,
                  specifiedType: const FullType(NavBarSelection))
              as NavBarSelection;
          break;
        case 'problems':
          result.problems.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Problem)]))
              as BuiltList<Object>);
          break;
        case 'profileData':
          result.profileData.replace(serializers.deserialize(value,
              specifiedType: const FullType(ProfileData)) as ProfileData);
          break;
        case 'settings':
          result.settings.replace(serializers.deserialize(value,
              specifiedType: const FullType(Settings)) as Settings);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final TeamMember teamMember;
  @override
  final AuthStep authStep;
  @override
  final AuthUserData authUserData;
  @override
  final BuiltList<PageData> pagesData;
  @override
  final NavBarSelection navSelection;
  @override
  final BuiltList<Problem> problems;
  @override
  final ProfileData profileData;
  @override
  final Settings settings;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.teamMember,
      this.authStep,
      this.authUserData,
      this.pagesData,
      this.navSelection,
      this.problems,
      this.profileData,
      this.settings})
      : super._() {
    if (authStep == null) {
      throw new BuiltValueNullFieldError('AppState', 'authStep');
    }
    if (pagesData == null) {
      throw new BuiltValueNullFieldError('AppState', 'pagesData');
    }
    if (navSelection == null) {
      throw new BuiltValueNullFieldError('AppState', 'navSelection');
    }
    if (problems == null) {
      throw new BuiltValueNullFieldError('AppState', 'problems');
    }
    if (profileData == null) {
      throw new BuiltValueNullFieldError('AppState', 'profileData');
    }
    if (settings == null) {
      throw new BuiltValueNullFieldError('AppState', 'settings');
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
        teamMember == other.teamMember &&
        authStep == other.authStep &&
        authUserData == other.authUserData &&
        pagesData == other.pagesData &&
        navSelection == other.navSelection &&
        problems == other.problems &&
        profileData == other.profileData &&
        settings == other.settings;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, teamMember.hashCode), authStep.hashCode),
                            authUserData.hashCode),
                        pagesData.hashCode),
                    navSelection.hashCode),
                problems.hashCode),
            profileData.hashCode),
        settings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('teamMember', teamMember)
          ..add('authStep', authStep)
          ..add('authUserData', authUserData)
          ..add('pagesData', pagesData)
          ..add('navSelection', navSelection)
          ..add('problems', problems)
          ..add('profileData', profileData)
          ..add('settings', settings))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  TeamMemberBuilder _teamMember;
  TeamMemberBuilder get teamMember =>
      _$this._teamMember ??= new TeamMemberBuilder();
  set teamMember(TeamMemberBuilder teamMember) =>
      _$this._teamMember = teamMember;

  AuthStep _authStep;
  AuthStep get authStep => _$this._authStep;
  set authStep(AuthStep authStep) => _$this._authStep = authStep;

  AuthUserDataBuilder _authUserData;
  AuthUserDataBuilder get authUserData =>
      _$this._authUserData ??= new AuthUserDataBuilder();
  set authUserData(AuthUserDataBuilder authUserData) =>
      _$this._authUserData = authUserData;

  ListBuilder<PageData> _pagesData;
  ListBuilder<PageData> get pagesData =>
      _$this._pagesData ??= new ListBuilder<PageData>();
  set pagesData(ListBuilder<PageData> pagesData) =>
      _$this._pagesData = pagesData;

  NavBarSelection _navSelection;
  NavBarSelection get navSelection => _$this._navSelection;
  set navSelection(NavBarSelection navSelection) =>
      _$this._navSelection = navSelection;

  ListBuilder<Problem> _problems;
  ListBuilder<Problem> get problems =>
      _$this._problems ??= new ListBuilder<Problem>();
  set problems(ListBuilder<Problem> problems) => _$this._problems = problems;

  ProfileDataBuilder _profileData;
  ProfileDataBuilder get profileData =>
      _$this._profileData ??= new ProfileDataBuilder();
  set profileData(ProfileDataBuilder profileData) =>
      _$this._profileData = profileData;

  SettingsBuilder _settings;
  SettingsBuilder get settings => _$this._settings ??= new SettingsBuilder();
  set settings(SettingsBuilder settings) => _$this._settings = settings;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _teamMember = _$v.teamMember?.toBuilder();
      _authStep = _$v.authStep;
      _authUserData = _$v.authUserData?.toBuilder();
      _pagesData = _$v.pagesData?.toBuilder();
      _navSelection = _$v.navSelection;
      _problems = _$v.problems?.toBuilder();
      _profileData = _$v.profileData?.toBuilder();
      _settings = _$v.settings?.toBuilder();
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
              teamMember: _teamMember?.build(),
              authStep: authStep,
              authUserData: _authUserData?.build(),
              pagesData: pagesData.build(),
              navSelection: navSelection,
              problems: problems.build(),
              profileData: profileData.build(),
              settings: settings.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'teamMember';
        _teamMember?.build();

        _$failedField = 'authUserData';
        _authUserData?.build();
        _$failedField = 'pagesData';
        pagesData.build();

        _$failedField = 'problems';
        problems.build();
        _$failedField = 'profileData';
        profileData.build();
        _$failedField = 'settings';
        settings.build();
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
