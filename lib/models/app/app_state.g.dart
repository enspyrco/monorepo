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
          specifiedType: const FullType(List, const [const FullType(Problem)])),
      'authStep',
      serializers.serialize(object.authStep,
          specifiedType: const FullType(AuthStep)),
    ];

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
          result.problems = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(Problem)]))
              as List<Problem>;
          break;
        case 'authStep':
          result.authStep = serializers.deserialize(value,
              specifiedType: const FullType(AuthStep)) as AuthStep;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final List<Problem> problems;
  @override
  final AuthStep authStep;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.problems, this.authStep}) : super._() {
    if (problems == null) {
      throw new BuiltValueNullFieldError('AppState', 'problems');
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
        authStep == other.authStep;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, problems.hashCode), authStep.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('problems', problems)
          ..add('authStep', authStep))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  List<Problem> _problems;
  List<Problem> get problems => _$this._problems;
  set problems(List<Problem> problems) => _$this._problems = problems;

  AuthStep _authStep;
  AuthStep get authStep => _$this._authStep;
  set authStep(AuthStep authStep) => _$this._authStep = authStep;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _problems = _$v.problems;
      _authStep = _$v.authStep;
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
    final _$result =
        _$v ?? new _$AppState._(problems: problems, authStep: authStep);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
