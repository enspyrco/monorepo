import 'package:redux/redux.dart';
import 'package:the_process/actions/navigation/remove_current_page_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

/// Remove the current page from the stack, unless the stack is only one page
class RemoveCurrentPageReducer
    extends TypedReducer<AppState, RemoveCurrentPageAction> {
  RemoveCurrentPageReducer()
      : super((state, action) =>
            state.copyWith(pagesData: state.pagesData.removeLast()));
}
