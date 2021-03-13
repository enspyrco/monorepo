import 'package:flireator/actions/flireator/store_flireator.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreFlireatorReducer extends TypedReducer<AppState, StoreFlireator> {
  StoreFlireatorReducer()
      : super((state, action) =>
            state.rebuild((b) => b..flireator.replace(action.flireator)));
}
