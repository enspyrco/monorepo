import 'package:redfire/src/auth/actions/get_id_token_action.dart';
import 'package:redfire/src/auth/actions/set_id_token_result_action.dart';
import 'package:redfire/src/auth/extensions/id_token_result_extension.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';

class GetIdTokenMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, GetIdTokenAction> {
  GetIdTokenMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getAuthService();
            var result = await service.getIdTokenResult()!;
            store.dispatch(SetIdTokenResultAction(result.toModel()));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
