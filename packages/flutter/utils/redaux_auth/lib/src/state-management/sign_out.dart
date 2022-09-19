import 'package:json_types/json_types.dart';
import 'package:locator/locator.dart';
import 'package:redaux/redaux.dart';

import '../services/firebase_auth_service.dart';

class SignOut<T extends RootState> extends AsyncAction<T> {
  @override
  Future<void> leave(Store<T> store) async {
    var service = locate<FirebaseAuthService>();
    await service.signOut();
  }

  @override
  JsonMap toJson({int? parentId}) => {
        'name_': 'Sign Out',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parentId,
        'state_': <String, dynamic>{}
      };
}
