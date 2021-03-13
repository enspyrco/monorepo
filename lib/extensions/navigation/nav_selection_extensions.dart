import 'package:flireator/enums/navigation/nav_selection.dart';
import 'package:flireator/widgets/git_hub/git_hub_page.dart';
import 'package:flireator/widgets/local/local_page.dart';
import 'package:flireator/widgets/profile/profile_page.dart';
import 'package:flutter/widgets.dart';

extension NavSelectionExt on NavSelection {
  static const Map<NavSelection, Widget> _$widgetMap = {
    NavSelection.local: LocalPage(),
    NavSelection.github: GitHubPage(),
    NavSelection.profile: ProfilePage(),
  };

  Widget get widget => _$widgetMap[this] ?? LocalPage();
}
