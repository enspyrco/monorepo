import 'package:redux/redux.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/reducers/auth/sign_out.dart';
import 'package:the_process/reducers/auth/store_auth_step.dart';
import 'package:the_process/reducers/auth/store_auth_user_data.dart';
import 'package:the_process/reducers/navigation/push_page.dart';
import 'package:the_process/reducers/navigation/remove_current_page.dart';
import 'package:the_process/reducers/navigation/store_nav_bar_selection.dart';
import 'package:the_process/reducers/problems/add_problem.dart';
import 'package:the_process/reducers/problems/remove_problem.dart';
import 'package:the_process/reducers/profile/store_profile_data.dart';
import 'package:the_process/reducers/sections/create_section.dart';
import 'package:the_process/reducers/sections/update_new_section_v_m.dart';
import 'package:the_process/reducers/settings/update_settings.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer =
    combineReducers<AppState>(<AppState Function(AppState, dynamic)>[
  // Auth
  StoreAuthUserDataReducer(),
  StoreAuthStepReducer(),
  SignOutReducer(),
  // Navigation
  PushPageReducer(),
  RemoveCurrentPageReducer(),
  StoreNavBarSelectionReducer(),
  // Problems
  AddProblemReducer(),
  RemoveProblemReducer(),
  // Profile
  StoreProfileDataReducer(),
  // Sections
  CreateSectionReducer(),
  UpdateNewSectionVMReducer(),
  // Settings
  UpdateSettingsReducer(),
]);
