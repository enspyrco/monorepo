import 'package:redux/redux.dart';
import 'package:the_process/actions/navigation/push_page.dart';
import 'package:the_process/models/app_state/app_state.dart';

class PushPageReducer extends TypedReducer<AppState, PushPage> {
  PushPageReducer()
      : super((state, action) =>
            state.rebuild((b) => b..pagesData.add(action.data)));
}
