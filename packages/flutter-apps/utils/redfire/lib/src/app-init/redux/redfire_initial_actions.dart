import '../../auth/actions/observe_auth_state_action.dart';
import '../../platform/actions/detect_platform_action.dart';

final redfireInitialActions = [
  const ObserveAuthStateAction(),
  const DetectPlatformAction(),
];
