import 'package:flireator/actions/flireator/store_flireator_action.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreFlireatorReducer
    extends TypedReducer<AppState, StoreFlireatorAction> {
  StoreFlireatorReducer()
      : super((state, action) => state.copyWith(flireator: action.flireator));
}
