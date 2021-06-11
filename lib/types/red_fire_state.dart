import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/auth/enums/auth_step_enum.dart';
import 'package:redfire/auth/models/auth_user_data.dart';
import 'package:redfire/navigation/models/red_fire_page.dart';
import 'package:redfire/problems/models/problem_info.dart';
import 'package:redfire/settings/models/settings.dart';

abstract class RedFireState {
  IList<ProblemInfo> get problems;
  Settings get settings;
  AuthStepEnum get authStep;
  AuthUserData? get authUserData;

  /// Navigation
  IList<RedFirePage> get redFirePages;

  Map<String, Object?> toJson();
}
