import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/src/auth/models/auth_state.dart';
import 'package:redfire/src/navigation/models/page_data.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/profile/models/profile_data.dart';
import 'package:redfire/src/settings/models/settings.dart';

abstract class RedFireState {
  IList<ProblemInfo> get problems;
  Settings get settings;
  AuthState get auth;
  ProfileData? get profile;

  /// Navigation
  IList<PageData> get pages;

  Map<String, Object?> toJson();
}
