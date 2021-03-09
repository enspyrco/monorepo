import 'package:flutter/material.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';
import 'package:the_process/utils/immutable_collections/immutable_list.dart';
import 'package:the_process/widgets/app_widget/initial_page.dart';
import 'package:the_process/widgets/profile/profile_page.dart';
import 'package:the_process/widgets/shared/problem_page.dart';

/// We are using extensions in order to keep models as PODOs and avoid other
/// dependencies in the app state.
extension NavigatorEntriesExt on ImmutableList<PageData> {
  /// Creates a list of [MaterialPage]s from [PagesData] used as the history
  /// for [Navigator]
  List<MaterialPage> toPages() {
    final materialPages = <MaterialPage>[];

    for (final pageData in this) {
      if (pageData is InitialPageData) {
        materialPages.add(MaterialPage<InitialPage>(
          key: ValueKey(InitialPage),
          child: InitialPage(),
        ));
      } else if (pageData is ProfilePageData) {
        materialPages.add(MaterialPage<ProfilePage>(
          key: ValueKey(ProfilePage),
          child: ProfilePage(),
        ));
      } else if ((pageData is ProblemPageData)) {
        materialPages.add(MaterialPage<ProblemPage>(
          key: ValueKey(ProblemPage),
          child: ProblemPage(pageData.problem),
        ));
      }
    }

    return materialPages;
  }
}
