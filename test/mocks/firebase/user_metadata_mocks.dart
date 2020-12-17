import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeUserMetada extends Fake implements UserMetadata {
  final int _creationTimestamp;
  final int _lastSignInTime;

  FakeUserMetada({int creationTimestamp, int lastSignInTime})
      : _creationTimestamp = creationTimestamp,
        _lastSignInTime = lastSignInTime;

  /// When this account was created as dictated by the server clock.
  @override
  DateTime get creationTime => _creationTimestamp == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(_creationTimestamp);

  /// When the user last signed in as dictated by the server clock.
  ///
  /// This is only accurate up to a granularity of 2 minutes for consecutive
  /// sign-in attempts.
  @override
  DateTime get lastSignInTime => _lastSignInTime == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(_lastSignInTime);
}
