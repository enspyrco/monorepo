import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeUser extends Fake implements User {
  final String _displayName;
  final String _email;
  final bool _emailVerified;
  final bool _isAnonymous;
  final UserMetadata _metadata;
  final String _phoneNumber;
  final String _photoURL;
  final List<UserInfo> _providerData;
  final String _refreshToken;
  final String _tenantId;
  final String _uid;

  FakeUser(
      {String displayName,
      String email,
      bool emailVerified,
      bool isAnonymous,
      UserMetadata metadata,
      String phoneNumber,
      String photoURL,
      List<UserInfo> providerData,
      String refreshToken,
      String tenantId,
      String uid})
      : _displayName = displayName,
        _email = email,
        _emailVerified = emailVerified,
        _isAnonymous = isAnonymous,
        _metadata = metadata,
        _phoneNumber = phoneNumber,
        _photoURL = photoURL,
        _providerData = providerData,
        _refreshToken = refreshToken,
        _tenantId = tenantId,
        _uid = uid;

  @override
  String get displayName => _displayName;

  @override
  String get email => _email;

  @override
  bool get emailVerified => _emailVerified;

  @override
  bool get isAnonymous => _isAnonymous;

  @override
  UserMetadata get metadata => _metadata;

  @override
  String get phoneNumber => _phoneNumber;

  @override
  String get photoURL => _photoURL;

  @override
  List<UserInfo> get providerData => _providerData;

  @override
  String get refreshToken => _refreshToken;

  @override
  String get tenantId => _tenantId;

  @override
  String get uid => _uid;
}
