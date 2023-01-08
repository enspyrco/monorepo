library astro_auth;

import 'astro_auth.dart';

export 'src/missions/bind_auth_state.dart';
export 'src/missions/sign_out.dart';
export 'src/routes/auth-gate/auth_gate_page_state.dart';
export 'src/routes/auth-gate/auth_gate_screen.dart';
export 'src/routes/sign-in/sign_in_page_state.dart';
export 'src/routes/sign-in/sign_in_screen.dart';
export 'src/utils/app_init.dart';
export 'src/utils/on_auth_state_change.dart';
export 'src/widgets/avatar_menu_button/avatar_menu_button.dart';
export 'src/widgets/avatar_menu_button/menu_option.dart';

/// Factory methods for creating AuthState objects
class AstroAuth {
  static GeneratedDefaultAuthState initialState() =>
      GeneratedDefaultAuthState(user: DefaultUserState.initial);
}
