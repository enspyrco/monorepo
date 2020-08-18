import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/auth/user_data.dart';
import 'package:flireator/models/flireator/credential_info.dart';

abstract class DatabaseService {
  Stream<ReduxAction> get storeStream;
  Future<void> offerUserInfo(UserData userData);
  Future<void> offerCredential(
      String userId, String providerId, CredentialInfo credential);
  Future<String> retrieveStoredToken(String userId);
}
