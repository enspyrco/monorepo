import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:redfire/src/app-init/widgets/initial_page.dart';
import 'package:redfire/src/navigation/models/page_data.dart';
import 'package:redfire/src/problems/widgets/problem_info_page.dart';
import 'package:redfire/src/profile/widgets/profile_page.dart';
import 'package:redfire/src/types/red_fire_state.dart';

/// We are using extensions in order to keep models as PODOs and avoid other
/// dependencies in the app state.
extension PageDataListExtension on IList<PageData> {
  /// Creates a list of [MaterialPage] from a list of [PageData]
  /// - used as the history for [Navigator]
  List<MaterialPage> toMaterialPages<T extends RedFireState>(
      Widget authPage, Widget mainPage) {
    final materialPages = <MaterialPage>[];

    for (final pageData in this) {
      if (pageData is InitialPageData) {
        materialPages.add(MaterialPage<InitialPage>(
          key: const ValueKey(InitialPage),
          child: InitialPage<T>(authPage, mainPage),
        ));
      } else if (pageData is ProfilePageData) {
        materialPages.add(MaterialPage<ProfilePage>(
          key: const ValueKey(ProfilePage),
          child: ProfilePage<T>(),
        ));
      } else if (pageData is ProblemPageData) {
        materialPages.add(MaterialPage<ProblemInfoPage>(
          key: const ValueKey(ProblemInfoPage),
          child: ProblemInfoPage<T>(pageData.problem),
        ));
      }
    }

    return materialPages;
  }
}
