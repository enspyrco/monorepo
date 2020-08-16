// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_auth_step;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreAuthStep> _$storeAuthStepSerializer =
    new _$StoreAuthStepSerializer();

class _$StoreAuthStepSerializer implements StructuredSerializer<StoreAuthStep> {
  @override
  final Iterable<Type> types = const [StoreAuthStep, _$StoreAuthStep];
  @override
  final String wireName = 'StoreAuthStep';

  @override
  Iterable<Object> serialize(Serializers serializers, StoreAuthStep object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'step',
      serializers.serialize(object.step,
          specifiedType: const FullType(AuthStep)),
    ];

    return result;
  }

  @override
  StoreAuthStep deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreAuthStepBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'step':
          result.step = serializers.deserialize(value,
              specifiedType: const FullType(AuthStep)) as AuthStep;
          break;
      }
    }

    return result.build();
  }
}

class _$StoreAuthStep extends StoreAuthStep {
  @override
  final AuthStep step;

  factory _$StoreAuthStep([void Function(StoreAuthStepBuilder) updates]) =>
      (new StoreAuthStepBuilder()..update(updates)).build();

  _$StoreAuthStep._({this.step}) : super._() {
    if (step == null) {
      throw new BuiltValueNullFieldError('StoreAuthStep', 'step');
    }
  }

  @override
  StoreAuthStep rebuild(void Function(StoreAuthStepBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreAuthStepBuilder toBuilder() => new StoreAuthStepBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreAuthStep && step == other.step;
  }

  @override
  int get hashCode {
    return $jf($jc(0, step.hashCode));
  }
}

class StoreAuthStepBuilder
    implements Builder<StoreAuthStep, StoreAuthStepBuilder> {
  _$StoreAuthStep _$v;

  AuthStep _step;
  AuthStep get step => _$this._step;
  set step(AuthStep step) => _$this._step = step;

  StoreAuthStepBuilder();

  StoreAuthStepBuilder get _$this {
    if (_$v != null) {
      _step = _$v.step;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreAuthStep other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StoreAuthStep;
  }

  @override
  void update(void Function(StoreAuthStepBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreAuthStep build() {
    final _$result = _$v ?? new _$StoreAuthStep._(step: step);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
