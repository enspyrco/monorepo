import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/auth/user_data.dart';

abstract class DatabaseService {
  Stream<ReduxAction> get storeStream;
  Future<void> updateUserInfo(UserData userData, String token);
  Future<String> retrieveStoredToken(String userId);
}
