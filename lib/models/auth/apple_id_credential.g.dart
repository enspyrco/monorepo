// GENERATED CODE - DO NOT MODIFY BY HAND

part of apple_id_credential;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppleIdCredential> _$appleIdCredentialSerializer =
    new _$AppleIdCredentialSerializer();

class _$AppleIdCredentialSerializer
    implements StructuredSerializer<AppleIdCredential> {
  @override
  final Iterable<Type> types = const [AppleIdCredential, _$AppleIdCredential];
  @override
  final String wireName = 'AppleIdCredential';

  @override
  Iterable<Object> serialize(Serializers serializers, AppleIdCredential object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'authorizationCode',
      serializers.serialize(object.authorizationCode,
          specifiedType: const FullType(String)),
    ];
    if (object.userIdentifier != null) {
      result
        ..add('userIdentifier')
        ..add(serializers.serialize(object.userIdentifier,
            specifiedType: const FullType(String)));
    }
    if (object.givenName != null) {
      result
        ..add('givenName')
        ..add(serializers.serialize(object.givenName,
            specifiedType: const FullType(String)));
    }
    if (object.familyName != null) {
      result
        ..add('familyName')
        ..add(serializers.serialize(object.familyName,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.identityToken != null) {
      result
        ..add('identityToken')
        ..add(serializers.serialize(object.identityToken,
            specifiedType: const FullType(String)));
    }
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AppleIdCredential deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppleIdCredentialBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userIdentifier':
          result.userIdentifier = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'givenName':
          result.givenName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'familyName':
          result.familyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authorizationCode':
          result.authorizationCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'identityToken':
          result.identityToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppleIdCredential extends AppleIdCredential {
  @override
  final String userIdentifier;
  @override
  final String givenName;
  @override
  final String familyName;
  @override
  final String email;
  @override
  final String authorizationCode;
  @override
  final String identityToken;
  @override
  final String state;

  factory _$AppleIdCredential(
          [void Function(AppleIdCredentialBuilder) updates]) =>
      (new AppleIdCredentialBuilder()..update(updates)).build();

  _$AppleIdCredential._(
      {this.userIdentifier,
      this.givenName,
      this.familyName,
      this.email,
      this.authorizationCode,
      this.identityToken,
      this.state})
      : super._() {
    if (authorizationCode == null) {
      throw new BuiltValueNullFieldError(
          'AppleIdCredential', 'authorizationCode');
    }
  }

  @override
  AppleIdCredential rebuild(void Function(AppleIdCredentialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppleIdCredentialBuilder toBuilder() =>
      new AppleIdCredentialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppleIdCredential &&
        userIdentifier == other.userIdentifier &&
        givenName == other.givenName &&
        familyName == other.familyName &&
        email == other.email &&
        authorizationCode == other.authorizationCode &&
        identityToken == other.identityToken &&
        state == other.state;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, userIdentifier.hashCode),
                            givenName.hashCode),
                        familyName.hashCode),
                    email.hashCode),
                authorizationCode.hashCode),
            identityToken.hashCode),
        state.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppleIdCredential')
          ..add('userIdentifier', userIdentifier)
          ..add('givenName', givenName)
          ..add('familyName', familyName)
          ..add('email', email)
          ..add('authorizationCode', authorizationCode)
          ..add('identityToken', identityToken)
          ..add('state', state))
        .toString();
  }
}

class AppleIdCredentialBuilder
    implements Builder<AppleIdCredential, AppleIdCredentialBuilder> {
  _$AppleIdCredential _$v;

  String _userIdentifier;
  String get userIdentifier => _$this._userIdentifier;
  set userIdentifier(String userIdentifier) =>
      _$this._userIdentifier = userIdentifier;

  String _givenName;
  String get givenName => _$this._givenName;
  set givenName(String givenName) => _$this._givenName = givenName;

  String _familyName;
  String get familyName => _$this._familyName;
  set familyName(String familyName) => _$this._familyName = familyName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _authorizationCode;
  String get authorizationCode => _$this._authorizationCode;
  set authorizationCode(String authorizationCode) =>
      _$this._authorizationCode = authorizationCode;

  String _identityToken;
  String get identityToken => _$this._identityToken;
  set identityToken(String identityToken) =>
      _$this._identityToken = identityToken;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  AppleIdCredentialBuilder();

  AppleIdCredentialBuilder get _$this {
    if (_$v != null) {
      _userIdentifier = _$v.userIdentifier;
      _givenName = _$v.givenName;
      _familyName = _$v.familyName;
      _email = _$v.email;
      _authorizationCode = _$v.authorizationCode;
      _identityToken = _$v.identityToken;
      _state = _$v.state;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppleIdCredential other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppleIdCredential;
  }

  @override
  void update(void Function(AppleIdCredentialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppleIdCredential build() {
    final _$result = _$v ??
        new _$AppleIdCredential._(
            userIdentifier: userIdentifier,
            givenName: givenName,
            familyName: familyName,
            email: email,
            authorizationCode: authorizationCode,
            identityToken: identityToken,
            state: state);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
