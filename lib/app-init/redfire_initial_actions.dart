import 'package:redfire/actions/detect_platform_action.dart';
import 'package:redfire/actions/observe_auth_state_action.dart';

final redfireInitialActions = [
  ObserveAuthStateAction(),
  DetectPlatformAction(),
];
