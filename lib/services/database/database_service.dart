import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/flireator/flireator.dart';

abstract class DatabaseService {
  Stream<ReduxAction> get storeStream;
  Future<Flireator> retrieveFlireatorData(String userId);
  // Future<void> offerUserInfo(UserData userData);
  // Future<void> offerCredential(
  //     String userId, String providerId, CredentialInfo credential);
  Future<String> retrieveStoredToken(String userId);
}
