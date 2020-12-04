import 'package:redux/redux.dart';
import 'package:the_process/actions/sections/store_sections.dart';
import 'package:the_process/models/app_state/app_state.dart';

class StoreSectionsReducer extends TypedReducer<AppState, StoreSections> {
  StoreSectionsReducer()
      : super((state, action) =>
            state.rebuild((b) => b..sections.list.replace(action.list)));
}
