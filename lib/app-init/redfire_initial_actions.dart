import 'package:redfire/auth/actions/observe_auth_state_action.dart';
import 'package:redfire/settings/actions/detect_platform_action.dart';

final redfireInitialActions = [
  ObserveAuthStateAction(),
  DetectPlatformAction(),
];
