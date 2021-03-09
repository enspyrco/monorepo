import 'package:redux/redux.dart';
import 'package:the_process/actions/sections/store_sections_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

class StoreSectionsReducer extends TypedReducer<AppState, StoreSectionsAction> {
  StoreSectionsReducer()
      : super((state, action) => state.copyWith.sections(list: action.list));
}
