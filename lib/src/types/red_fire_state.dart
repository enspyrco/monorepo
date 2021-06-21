import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/src/auth/enums/auth_step_enum.dart';
import 'package:redfire/src/auth/models/auth_user_data.dart';
import 'package:redfire/src/navigation/models/red_fire_page.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/settings/models/settings.dart';

abstract class RedFireState {
  IList<ProblemInfo> get problems;
  Settings get settings;
  AuthStepEnum get authStep;
  AuthUserData? get authUserData;

  /// Navigation
  IList<RedFirePage> get redFirePages;

  Map<String, Object?> toJson();
}
