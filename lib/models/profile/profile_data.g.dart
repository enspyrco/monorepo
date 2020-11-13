// GENERATED CODE - DO NOT MODIFY BY HAND

part of profile_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileData> _$profileDataSerializer = new _$ProfileDataSerializer();

class _$ProfileDataSerializer implements StructuredSerializer<ProfileData> {
  @override
  final Iterable<Type> types = const [ProfileData, _$ProfileData];
  @override
  final String wireName = 'ProfileData';

  @override
  Iterable<Object> serialize(Serializers serializers, ProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
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
    if (object.firstName != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.lastName != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(object.lastName,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ProfileData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
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
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileData extends ProfileData {
  @override
  final String id;
  @override
  final String displayName;
  @override
  final String photoURL;
  @override
  final String firstName;
  @override
  final String lastName;

  factory _$ProfileData([void Function(ProfileDataBuilder) updates]) =>
      (new ProfileDataBuilder()..update(updates)).build();

  _$ProfileData._(
      {this.id, this.displayName, this.photoURL, this.firstName, this.lastName})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ProfileData', 'id');
    }
  }

  @override
  ProfileData rebuild(void Function(ProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileDataBuilder toBuilder() => new ProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileData &&
        id == other.id &&
        displayName == other.displayName &&
        photoURL == other.photoURL &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), displayName.hashCode),
                photoURL.hashCode),
            firstName.hashCode),
        lastName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileData')
          ..add('id', id)
          ..add('displayName', displayName)
          ..add('photoURL', photoURL)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class ProfileDataBuilder implements Builder<ProfileData, ProfileDataBuilder> {
  _$ProfileData _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoURL;
  String get photoURL => _$this._photoURL;
  set photoURL(String photoURL) => _$this._photoURL = photoURL;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  ProfileDataBuilder();

  ProfileDataBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _displayName = _$v.displayName;
      _photoURL = _$v.photoURL;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileData;
  }

  @override
  void update(void Function(ProfileDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileData build() {
    final _$result = _$v ??
        new _$ProfileData._(
            id: id,
            displayName: displayName,
            photoURL: photoURL,
            firstName: firstName,
            lastName: lastName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
