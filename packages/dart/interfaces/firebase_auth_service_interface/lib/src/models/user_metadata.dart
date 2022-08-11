/// Copied from: firebase_auth_platform_interface-6.5.2/lib/src/user_metadata.dart
/// TODO: Check if this works for the REST Client too

/// Interface representing a user's metadata.
class UserMetadata {
  UserMetadata(this._creationTimestamp, this._lastSignInTime);

  final int? _creationTimestamp;
  final int? _lastSignInTime;

  /// When this account was created as dictated by the server clock.
  DateTime? get creationTime => _creationTimestamp == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(_creationTimestamp!);

  /// When the user last signed in as dictated by the server clock.
  ///
  /// This is only accurate up to a granularity of 2 minutes for consecutive
  /// sign-in attempts.
  DateTime? get lastSignInTime => _lastSignInTime == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(_lastSignInTime!);

  @override
  String toString() {
    return 'UserMetadata(creationTime: ${creationTime.toString()}, lastSignInTime: ${lastSignInTime.toString()})';
  }
}
