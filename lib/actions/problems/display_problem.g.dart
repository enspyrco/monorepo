// GENERATED CODE - DO NOT MODIFY BY HAND

part of display_problem;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DisplayProblem> _$displayProblemSerializer =
    new _$DisplayProblemSerializer();

class _$DisplayProblemSerializer
    implements StructuredSerializer<DisplayProblem> {
  @override
  final Iterable<Type> types = const [DisplayProblem, _$DisplayProblem];
  @override
  final String wireName = 'DisplayProblem';

  @override
  Iterable<Object> serialize(Serializers serializers, DisplayProblem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'problem',
      serializers.serialize(object.problem,
          specifiedType: const FullType(Problem)),
    ];

    return result;
  }

  @override
  DisplayProblem deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DisplayProblemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'problem':
          result.problem.replace(serializers.deserialize(value,
              specifiedType: const FullType(Problem)) as Problem);
          break;
      }
    }

    return result.build();
  }
}

class _$DisplayProblem extends DisplayProblem {
  @override
  final Problem problem;

  factory _$DisplayProblem([void Function(DisplayProblemBuilder) updates]) =>
      (new DisplayProblemBuilder()..update(updates)).build();

  _$DisplayProblem._({this.problem}) : super._() {
    if (problem == null) {
      throw new BuiltValueNullFieldError('DisplayProblem', 'problem');
    }
  }

  @override
  DisplayProblem rebuild(void Function(DisplayProblemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DisplayProblemBuilder toBuilder() =>
      new DisplayProblemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DisplayProblem && problem == other.problem;
  }

  @override
  int get hashCode {
    return $jf($jc(0, problem.hashCode));
  }
}

class DisplayProblemBuilder
    implements Builder<DisplayProblem, DisplayProblemBuilder> {
  _$DisplayProblem _$v;

  ProblemBuilder _problem;
  ProblemBuilder get problem => _$this._problem ??= new ProblemBuilder();
  set problem(ProblemBuilder problem) => _$this._problem = problem;

  DisplayProblemBuilder();

  DisplayProblemBuilder get _$this {
    if (_$v != null) {
      _problem = _$v.problem?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DisplayProblem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DisplayProblem;
  }

  @override
  void update(void Function(DisplayProblemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DisplayProblem build() {
    _$DisplayProblem _$result;
    try {
      _$result = _$v ?? new _$DisplayProblem._(problem: problem.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'problem';
        problem.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DisplayProblem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
