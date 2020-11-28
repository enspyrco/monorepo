import 'package:redux/redux.dart';
import 'package:the_process/actions/sections/create_section.dart';
import 'package:the_process/models/app_state/app_state.dart';

class CreateSectionReducer extends TypedReducer<AppState, CreateSection> {
  CreateSectionReducer()
      : super((state, action) =>
            state.rebuild((b) => b..sectionsVM.creatingSection = true));
}
