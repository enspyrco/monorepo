import 'package:redux/redux.dart';

import '../../../actions.dart';
import '../../../types.dart';

/// Remove the current page from the stack, unless the stack is only one page
class RemoveCurrentPageReducer<T extends RedFireState>
    extends TypedReducer<T, RemoveCurrentPageAction> {
  RemoveCurrentPageReducer()
      : super((state, action) =>
            (state as dynamic).copyWith(pages: state.pages.removeLast()) as T);
}
