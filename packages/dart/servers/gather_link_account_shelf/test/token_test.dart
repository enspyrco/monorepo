import 'package:gather_link_account_shelf/services/locate.dart';
import 'package:test/test.dart';

void main() {
  test('Minted token has the right shape', () async {
    Locate().asyncProvideDefaultFirebaseAdmin();
    final firebaseAdmin = Locate.firebaseAdmin;

    final String token = await firebaseAdmin
        .mintToken(uid: 'gatherId', developerClaims: {'gather-nonce': 'nonce'});

    print(token);

    expect(token.split('.').length, 3);
  }, skip: true);
}
