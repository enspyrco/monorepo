import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

import 'user_info_fake.dart';
import 'user_metadata_fake.dart';

class UserFake extends Fake implements User {
  final String? _displayName;
  final String? _email;
  final bool? _emailVerified;
  final bool? _isAnonymous;
  final UserMetadata? _metadata;
  final String? _phoneNumber;
  final String? _photoURL;
  final List<UserInfo>? _providerData;
  final String? _refreshToken;
  final String? _tenantId;
  final String? _uid;

  UserFake(
      {String? displayName,
      String? email,
      bool? emailVerified,
      bool? isAnonymous,
      UserMetadata? metadata,
      String? phoneNumber,
      String? photoURL,
      List<UserInfo>? providerData,
      String? refreshToken,
      String? tenantId,
      String? uid})
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
  String get displayName => _displayName ?? 'displayName';

  @override
  String get email => _email ?? 'email';

  @override
  bool get emailVerified => _emailVerified ?? false;

  @override
  bool get isAnonymous => _isAnonymous ?? false;

  @override
  UserMetadata get metadata =>
      _metadata ??
      UserMetadataFake(creationTimestamp: 1000, lastSignInTime: 1000);

  @override
  String get phoneNumber => _phoneNumber ?? 'phoneNumber';

  @override
  String get photoURL => _photoURL ?? 'photoURL';

  @override
  List<UserInfo> get providerData => _providerData ?? [UserInfoFake()];

  @override
  String get refreshToken => _refreshToken ?? 'refreshToken';

  @override
  String get tenantId => _tenantId ?? 'tentantId';

  @override
  String get uid => _uid ?? 'uid';
}
