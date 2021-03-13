import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flireator/actions/app/plumb_services.dart';
import 'package:flireator/actions/auth/connect_auth_state_to_store.dart';
import 'package:flireator/actions/auth/sign_in_with_apple.dart';
import 'package:flireator/actions/auth/sign_out.dart';
import 'package:flireator/actions/auth/store_auth_data.dart';
import 'package:flireator/actions/auth/store_git_hub_token.dart';
import 'package:flireator/actions/auth/store_sign_in_step.dart';
import 'package:flireator/actions/navigation/launch_url.dart';
import 'package:flireator/actions/problems/display_problem.dart';
import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/enums/navigation/nav_selection.dart';
import 'package:flireator/enums/themes/brightness_mode.dart';
import 'package:flireator/enums/themes/theme_brightness.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/models/app/settings.dart';
import 'package:flireator/models/auth/auth_data.dart';
import 'package:flireator/models/auth/auth_provider_data.dart';
import 'package:flireator/models/credentials/credential_info.dart';
import 'package:flireator/models/flireator/config_options.dart';
import 'package:flireator/models/flireator/flireator.dart';
import 'package:flireator/models/git_hub/git_hub_repository.dart';
import 'package:flireator/models/git_hub/git_hub_user.dart';
import 'package:flireator/models/problems/problem.dart';
import 'package:flireator/models/themes/theme_colors.dart';
import 'package:flireator/models/themes/theme_set.dart';

part 'serializers.g.dart';

/// Once per app, define a top level "Serializer" to gather together
/// all the generated serializers.
///
/// Collection of generated serializers for the AdventuresIn app
@SerializersFor([
  AuthData,
  AuthProviderData,
  AppState,
  BrightnessMode,
  ConfigOptions,
  ConnectAuthStateToStore,
  CredentialInfo,
  DisplayProblem,
  Flireator,
  GitHubRepository,
  GitHubUser,
  LaunchURL,
  NavSelection,
  PlumbServices,
  Problem,
  Settings,
  SignInStep,
  SignInWithApple,
  SignOut,
  StoreAuthData,
  StoreGitHubToken,
  StoreSignInStep,
  ThemeBrightness,
  ThemeColors,
  ThemeSet,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
