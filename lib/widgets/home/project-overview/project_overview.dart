import 'package:flutter/material.dart';
import 'package:the_process/widgets/home/project-overview/organisation-selection-view/organisation_selection_view.dart';
import 'package:the_process/widgets/home/project-overview/project-selection-view/project_selection_view.dart';
import 'package:the_process/widgets/home/project-overview/sections-view/sections_view.dart';
import 'package:the_process/widgets/home/project-overview/user-info-view/user_info_view.dart';

class ProjectOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          OrganisationSelectionView(),
          ProjectSelectionView(),
          SectionsView(),
          UserInfoView(),
        ],
      ),
    );
  }
}
