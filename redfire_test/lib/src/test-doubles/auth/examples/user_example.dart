import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

/// Uses
class UserExample {
  static User get basicFake => _FakeUser();
  static User get emptyFake => _FakeUserNull();
}

/// A [User] with all null members and empty list for
class _FakeUserNull extends Fake implements User {
  @override
  String? get displayName => null;
  @override
  String? get email => null;
  @override
  String? get photoURL => null;
  @override
  List<UserInfo> get providerData => [];
}

class _FakeUser extends Fake implements User {
  @override
  String get uid => 'uid';
  @override
  String get displayName => 'name';
  @override
  String get email => 'email';
  @override
  String get photoURL => 'url';
  @override
  List<UserInfo> providerData = [];
}
