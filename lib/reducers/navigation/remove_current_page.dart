import 'package:redux/redux.dart';
import 'package:the_process/actions/navigation/remove_current_page.dart';
import 'package:the_process/models/app_state/app_state.dart';

/// Remove the current page from the stack, unless the stack is only one page
class RemoveCurrentPageReducer
    extends TypedReducer<AppState, RemoveCurrentPage> {
  RemoveCurrentPageReducer()
      : super((state, action) => (state.pagesData.length > 1)
            ? state.rebuild((b) => b..pagesData.removeLast())
            : state);
}
