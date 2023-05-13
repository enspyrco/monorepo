import 'package:googleapis_auth/auth_io.dart';

class Locate {
  const Locate();

  static AutoRefreshingAuthClient? _client;

  static AutoRefreshingAuthClient get client => (_client == null)
      ? throw 'You attempted to locate the client before it has been provided.\n'
          'Make sure to call a `provideFirestore` function before using the Locate.client getter.'
      : _client!;

  /// Set client and firestore, if not already
  void provide({required AutoRefreshingAuthClient client}) {
    _client ??= client;
  }
}
