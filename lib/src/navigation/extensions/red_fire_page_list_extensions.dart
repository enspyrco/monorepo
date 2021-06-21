import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:redfire/src/app-init/widgets/initial_page.dart';
import 'package:redfire/src/navigation/models/red_fire_page.dart';
import 'package:redfire/src/problems/widgets/problem_indo_page.dart';
import 'package:redfire/src/types/red_fire_state.dart';

/// We are using extensions in order to keep models as PODOs and avoid other
/// dependencies in the app state.
extension RedFirePageListExtension on IList<RedFirePage> {
  /// Creates a list of [MaterialPage]s from [PagesData] used as the history
  /// for [Navigator]
  List<MaterialPage> toMaterialPages<T extends RedFireState>(
      Widget authPage, Widget mainPage) {
    final materialPages = <MaterialPage>[];

    for (final redFirePage in this) {
      if (redFirePage is RedFireInitialPage) {
        materialPages.add(MaterialPage<InitialPage>(
          key: ValueKey(InitialPage),
          child: InitialPage<T>(authPage, mainPage),
        ));
      } else if ((redFirePage is RedFireProblemPage)) {
        materialPages.add(MaterialPage<ProblemInfoPage>(
          key: ValueKey(ProblemInfoPage),
          child: ProblemInfoPage(redFirePage.info),
        ));
      }
    }

    return materialPages;
  }
}
