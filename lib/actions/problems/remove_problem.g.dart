// GENERATED CODE - DO NOT MODIFY BY HAND

part of remove_problem;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RemoveProblem> _$removeProblemSerializer =
    new _$RemoveProblemSerializer();

class _$RemoveProblemSerializer implements StructuredSerializer<RemoveProblem> {
  @override
  final Iterable<Type> types = const [RemoveProblem, _$RemoveProblem];
  @override
  final String wireName = 'RemoveProblem';

  @override
  Iterable<Object> serialize(Serializers serializers, RemoveProblem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'problem',
      serializers.serialize(object.problem,
          specifiedType: const FullType(Problem)),
    ];

    return result;
  }

  @override
  RemoveProblem deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RemoveProblemBuilder();

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

class _$RemoveProblem extends RemoveProblem {
  @override
  final Problem problem;

  factory _$RemoveProblem([void Function(RemoveProblemBuilder) updates]) =>
      (new RemoveProblemBuilder()..update(updates)).build();

  _$RemoveProblem._({this.problem}) : super._() {
    if (problem == null) {
      throw new BuiltValueNullFieldError('RemoveProblem', 'problem');
    }
  }

  @override
  RemoveProblem rebuild(void Function(RemoveProblemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveProblemBuilder toBuilder() => new RemoveProblemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveProblem && problem == other.problem;
  }

  @override
  int get hashCode {
    return $jf($jc(0, problem.hashCode));
  }
}

class RemoveProblemBuilder
    implements Builder<RemoveProblem, RemoveProblemBuilder> {
  _$RemoveProblem _$v;

  ProblemBuilder _problem;
  ProblemBuilder get problem => _$this._problem ??= new ProblemBuilder();
  set problem(ProblemBuilder problem) => _$this._problem = problem;

  RemoveProblemBuilder();

  RemoveProblemBuilder get _$this {
    if (_$v != null) {
      _problem = _$v.problem?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoveProblem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoveProblem;
  }

  @override
  void update(void Function(RemoveProblemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoveProblem build() {
    _$RemoveProblem _$result;
    try {
      _$result = _$v ?? new _$RemoveProblem._(problem: problem.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'problem';
        problem.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RemoveProblem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
