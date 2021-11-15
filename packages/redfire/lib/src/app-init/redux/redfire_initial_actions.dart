import 'package:redfire/src/auth/actions/observe_auth_state_action.dart';
import 'package:redfire/src/platform/actions/detect_platform_action.dart';

final redfireInitialActions = [
  const ObserveAuthStateAction(),
  const DetectPlatformAction(),
];
