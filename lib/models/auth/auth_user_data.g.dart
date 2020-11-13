// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_user_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthUserData> _$authUserDataSerializer =
    new _$AuthUserDataSerializer();

class _$AuthUserDataSerializer implements StructuredSerializer<AuthUserData> {
  @override
  final Iterable<Type> types = const [AuthUserData, _$AuthUserData];
  @override
  final String wireName = 'AuthUserData';

  @override
  Iterable<Object> serialize(Serializers serializers, AuthUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'lastSignedInOn',
      serializers.serialize(object.lastSignedInOn,
          specifiedType: const FullType(DateTime)),
      'isAnonymous',
      serializers.serialize(object.isAnonymous,
          specifiedType: const FullType(bool)),
      'emailVerified',
      serializers.serialize(object.emailVerified,
          specifiedType: const FullType(bool)),
      'providers',
      serializers.serialize(object.providers,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AuthProviderData)])),
    ];
    if (object.displayName != null) {
      result
        ..add('displayName')
        ..add(serializers.serialize(object.displayName,
            specifiedType: const FullType(String)));
    }
    if (object.photoURL != null) {
      result
        ..add('photoURL')
        ..add(serializers.serialize(object.photoURL,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.phoneNumber != null) {
      result
        ..add('phoneNumber')
        ..add(serializers.serialize(object.phoneNumber,
            specifiedType: const FullType(String)));
    }
    if (object.createdOn != null) {
      result
        ..add('createdOn')
        ..add(serializers.serialize(object.createdOn,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  AuthUserData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthUserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoURL':
          result.photoURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdOn':
          result.createdOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'lastSignedInOn':
          result.lastSignedInOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'isAnonymous':
          result.isAnonymous = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'emailVerified':
          result.emailVerified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'providers':
          result.providers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AuthProviderData)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$AuthUserData extends AuthUserData {
  @override
  final String uid;
  @override
  final String displayName;
  @override
  final String photoURL;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final DateTime createdOn;
  @override
  final DateTime lastSignedInOn;
  @override
  final bool isAnonymous;
  @override
  final bool emailVerified;
  @override
  final BuiltList<AuthProviderData> providers;
  bool __hasGitHub;

  factory _$AuthUserData([void Function(AuthUserDataBuilder) updates]) =>
      (new AuthUserDataBuilder()..update(updates)).build();

  _$AuthUserData._(
      {this.uid,
      this.displayName,
      this.photoURL,
      this.email,
      this.phoneNumber,
      this.createdOn,
      this.lastSignedInOn,
      this.isAnonymous,
      this.emailVerified,
      this.providers})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('AuthUserData', 'uid');
    }
    if (lastSignedInOn == null) {
      throw new BuiltValueNullFieldError('AuthUserData', 'lastSignedInOn');
    }
    if (isAnonymous == null) {
      throw new BuiltValueNullFieldError('AuthUserData', 'isAnonymous');
    }
    if (emailVerified == null) {
      throw new BuiltValueNullFieldError('AuthUserData', 'emailVerified');
    }
    if (providers == null) {
      throw new BuiltValueNullFieldError('AuthUserData', 'providers');
    }
  }

  @override
  bool get hasGitHub => __hasGitHub ??= super.hasGitHub;

  @override
  AuthUserData rebuild(void Function(AuthUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthUserDataBuilder toBuilder() => new AuthUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthUserData &&
        uid == other.uid &&
        displayName == other.displayName &&
        photoURL == other.photoURL &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        createdOn == other.createdOn &&
        lastSignedInOn == other.lastSignedInOn &&
        isAnonymous == other.isAnonymous &&
        emailVerified == other.emailVerified &&
        providers == other.providers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, uid.hashCode),
                                        displayName.hashCode),
                                    photoURL.hashCode),
                                email.hashCode),
                            phoneNumber.hashCode),
                        createdOn.hashCode),
                    lastSignedInOn.hashCode),
                isAnonymous.hashCode),
            emailVerified.hashCode),
        providers.hashCode));
  }
}

class AuthUserDataBuilder
    implements Builder<AuthUserData, AuthUserDataBuilder> {
  _$AuthUserData _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoURL;
  String get photoURL => _$this._photoURL;
  set photoURL(String photoURL) => _$this._photoURL = photoURL;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  DateTime _createdOn;
  DateTime get createdOn => _$this._createdOn;
  set createdOn(DateTime createdOn) => _$this._createdOn = createdOn;

  DateTime _lastSignedInOn;
  DateTime get lastSignedInOn => _$this._lastSignedInOn;
  set lastSignedInOn(DateTime lastSignedInOn) =>
      _$this._lastSignedInOn = lastSignedInOn;

  bool _isAnonymous;
  bool get isAnonymous => _$this._isAnonymous;
  set isAnonymous(bool isAnonymous) => _$this._isAnonymous = isAnonymous;

  bool _emailVerified;
  bool get emailVerified => _$this._emailVerified;
  set emailVerified(bool emailVerified) =>
      _$this._emailVerified = emailVerified;

  ListBuilder<AuthProviderData> _providers;
  ListBuilder<AuthProviderData> get providers =>
      _$this._providers ??= new ListBuilder<AuthProviderData>();
  set providers(ListBuilder<AuthProviderData> providers) =>
      _$this._providers = providers;

  AuthUserDataBuilder();

  AuthUserDataBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _displayName = _$v.displayName;
      _photoURL = _$v.photoURL;
      _email = _$v.email;
      _phoneNumber = _$v.phoneNumber;
      _createdOn = _$v.createdOn;
      _lastSignedInOn = _$v.lastSignedInOn;
      _isAnonymous = _$v.isAnonymous;
      _emailVerified = _$v.emailVerified;
      _providers = _$v.providers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthUserData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthUserData;
  }

  @override
  void update(void Function(AuthUserDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthUserData build() {
    _$AuthUserData _$result;
    try {
      _$result = _$v ??
          new _$AuthUserData._(
              uid: uid,
              displayName: displayName,
              photoURL: photoURL,
              email: email,
              phoneNumber: phoneNumber,
              createdOn: createdOn,
              lastSignedInOn: lastSignedInOn,
              isAnonymous: isAnonymous,
              emailVerified: emailVerified,
              providers: providers.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'providers';
        providers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
