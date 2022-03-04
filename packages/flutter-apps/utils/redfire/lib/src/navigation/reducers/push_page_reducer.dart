import 'package:redux/redux.dart';

import '../../../actions.dart';
import '../../../types.dart';

class PushPageReducer<T extends RedFireState>
    extends TypedReducer<T, PushPageAction> {
  PushPageReducer()
      : super((state, action) => (state as dynamic)
            .copyWith(pages: state.pages.add(action.page)) as T);
}
