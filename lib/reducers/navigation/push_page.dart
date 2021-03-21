import 'package:redux/redux.dart';
import 'package:the_process/actions/navigation/push_page_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

class PushPageReducer extends TypedReducer<AppState, PushPageAction> {
  PushPageReducer()
      : super((state, action) =>
            state.copyWith(pagesData: state.pagesData.add(action.data)));
}
