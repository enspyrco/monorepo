library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/enums/navigation/nav_bar_selection.dart';
import 'package:the_process/models/auth/auth_user_data.dart';
import 'package:the_process/models/navigation/page_data/initial_page_data.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/models/profile/profile_data.dart';
import 'package:the_process/models/sections/sections_v_m.dart';
import 'package:the_process/models/settings/settings.dart';
import 'package:the_process/models/team/team_member.dart';
import 'package:the_process/serializers.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  /// Teams
  TeamMember? get teamMember;

  /// Auth
  AuthStep get authStep;
  AuthUserData? get authUserData;

  /// Navigation
  BuiltList<PageData> get pagesData;
  NavBarSelection get navSelection;

  /// Problems
  BuiltList<Problem> get problems;

  /// Profile
  ProfileData? get profileData;

  /// Sections
  SectionsVM? get sections;

  /// Settings
  Settings get settings;

  AppState._();

  factory AppState.init() => AppState((a) => a
    ..pagesData = ListBuilder<PageData>(<PageData>[InitialPageData()])
    ..settings = Settings.initBuilder()
    ..authStep = AuthStep.checking
    ..navSelection = NavBarSelection.sections
    ..sections = SectionsVM.initialBuilder);

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  Object toJson() => serializers.serializeWith(AppState.serializer, this);

  // static AppState fromJson(String jsonString) =>
  //     serializers.deserializeWith(AppState.serializer, json.decode(jsonString));

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
