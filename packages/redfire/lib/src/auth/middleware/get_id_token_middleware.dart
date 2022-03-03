import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';
import '../../utils/red_fire_locator.dart';
import '../actions/get_id_token_action.dart';
import '../actions/set_id_token_result_action.dart';
import '../extensions/id_token_result_extension.dart';

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
