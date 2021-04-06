import 'package:googleapis_auth/auth_io.dart';
import 'package:test/fake.dart';

///
class FakeAutoRefreshingAuthClient extends Fake
    implements AutoRefreshingAuthClient {
  final AccessCredentials _credentials;

  FakeAutoRefreshingAuthClient({AccessCredentials? credentials})
      : _credentials = credentials ??
            AccessCredentials(
                AccessToken(
                    'type', 'data', DateTime.parse('1969-07-20 20:18:04Z')),
                'refreshToken',
                ['scopes']) {
    ;
  }

  @override
  AccessCredentials get credentials => _credentials;
}
