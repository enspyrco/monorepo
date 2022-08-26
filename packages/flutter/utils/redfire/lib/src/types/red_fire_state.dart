import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:json_types/json_types.dart';

import '../auth/models/auth_state.dart';
import '../navigation/models/page_data.dart';
import '../problems/models/problem_info.dart';
import '../profile/models/profile_data.dart';
import '../settings/models/settings.dart';

abstract class RedFireState {
  IList<ProblemInfo> get problems;
  Settings get settings;
  AuthState get auth;
  ProfileData? get profile;

  /// Navigation
  IList<PageData> get pages;

  JsonMap toJson();
}
