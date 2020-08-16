// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserData> _$userDataSerializer = new _$UserDataSerializer();

class _$UserDataSerializer implements StructuredSerializer<UserData> {
  @override
  final Iterable<Type> types = const [UserData, _$UserData];
  @override
  final String wireName = 'UserData';

  @override
  Iterable<Object> serialize(Serializers serializers, UserData object,
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
      'isEmailVerified',
      serializers.serialize(object.isEmailVerified,
          specifiedType: const FullType(bool)),
      'providers',
      serializers.serialize(object.providers,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AuthProviderData)])),
    ];
    if (object.providerId != null) {
      result
        ..add('providerId')
        ..add(serializers.serialize(object.providerId,
            specifiedType: const FullType(String)));
    }
    if (object.displayName != null) {
      result
        ..add('displayName')
        ..add(serializers.serialize(object.displayName,
            specifiedType: const FullType(String)));
    }
    if (object.photoUrl != null) {
      result
        ..add('photoUrl')
        ..add(serializers.serialize(object.photoUrl,
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
  UserData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDataBuilder();

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
        case 'providerId':
          result.providerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
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
        case 'isEmailVerified':
          result.isEmailVerified = serializers.deserialize(value,
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

class _$UserData extends UserData {
  @override
  final String uid;
  @override
  final String providerId;
  @override
  final String displayName;
  @override
  final String photoUrl;
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
  final bool isEmailVerified;
  @override
  final BuiltList<AuthProviderData> providers;
  bool __hasGitHub;

  factory _$UserData([void Function(UserDataBuilder) updates]) =>
      (new UserDataBuilder()..update(updates)).build();

  _$UserData._(
      {this.uid,
      this.providerId,
      this.displayName,
      this.photoUrl,
      this.email,
      this.phoneNumber,
      this.createdOn,
      this.lastSignedInOn,
      this.isAnonymous,
      this.isEmailVerified,
      this.providers})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('UserData', 'uid');
    }
    if (lastSignedInOn == null) {
      throw new BuiltValueNullFieldError('UserData', 'lastSignedInOn');
    }
    if (isAnonymous == null) {
      throw new BuiltValueNullFieldError('UserData', 'isAnonymous');
    }
    if (isEmailVerified == null) {
      throw new BuiltValueNullFieldError('UserData', 'isEmailVerified');
    }
    if (providers == null) {
      throw new BuiltValueNullFieldError('UserData', 'providers');
    }
  }

  @override
  bool get hasGitHub => __hasGitHub ??= super.hasGitHub;

  @override
  UserData rebuild(void Function(UserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataBuilder toBuilder() => new UserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserData &&
        uid == other.uid &&
        providerId == other.providerId &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        createdOn == other.createdOn &&
        lastSignedInOn == other.lastSignedInOn &&
        isAnonymous == other.isAnonymous &&
        isEmailVerified == other.isEmailVerified &&
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
                                    $jc(
                                        $jc($jc(0, uid.hashCode),
                                            providerId.hashCode),
                                        displayName.hashCode),
                                    photoUrl.hashCode),
                                email.hashCode),
                            phoneNumber.hashCode),
                        createdOn.hashCode),
                    lastSignedInOn.hashCode),
                isAnonymous.hashCode),
            isEmailVerified.hashCode),
        providers.hashCode));
  }
}

class UserDataBuilder implements Builder<UserData, UserDataBuilder> {
  _$UserData _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _providerId;
  String get providerId => _$this._providerId;
  set providerId(String providerId) => _$this._providerId = providerId;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

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

  bool _isEmailVerified;
  bool get isEmailVerified => _$this._isEmailVerified;
  set isEmailVerified(bool isEmailVerified) =>
      _$this._isEmailVerified = isEmailVerified;

  ListBuilder<AuthProviderData> _providers;
  ListBuilder<AuthProviderData> get providers =>
      _$this._providers ??= new ListBuilder<AuthProviderData>();
  set providers(ListBuilder<AuthProviderData> providers) =>
      _$this._providers = providers;

  UserDataBuilder();

  UserDataBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _providerId = _$v.providerId;
      _displayName = _$v.displayName;
      _photoUrl = _$v.photoUrl;
      _email = _$v.email;
      _phoneNumber = _$v.phoneNumber;
      _createdOn = _$v.createdOn;
      _lastSignedInOn = _$v.lastSignedInOn;
      _isAnonymous = _$v.isAnonymous;
      _isEmailVerified = _$v.isEmailVerified;
      _providers = _$v.providers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserData;
  }

  @override
  void update(void Function(UserDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserData build() {
    _$UserData _$result;
    try {
      _$result = _$v ??
          new _$UserData._(
              uid: uid,
              providerId: providerId,
              displayName: displayName,
              photoUrl: photoUrl,
              email: email,
              phoneNumber: phoneNumber,
              createdOn: createdOn,
              lastSignedInOn: lastSignedInOn,
              isAnonymous: isAnonymous,
              isEmailVerified: isEmailVerified,
              providers: providers.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'providers';
        providers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
