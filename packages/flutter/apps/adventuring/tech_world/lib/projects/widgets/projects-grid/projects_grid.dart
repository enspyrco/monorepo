import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../app_state.dart';
import '../../models/project_state.dart';
import 'new_project_item.dart';
import 'project_item.dart';

const kMobileBreakpoint = 576;
const kTabletBreakpoint = 1024;
const kDesktopBreakPoint = 1366;

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ISet<ProjectState>>(
        distinct: true,
        converter: (store) => store.state.projects.all,
        builder: (context, projects) {
          var gridItems =
              (projects.map<Widget>((project) => ProjectItem(project)).toList()
                ..insert(0, const NewProjectItem()));
          return LayoutBuilder(builder: ((context, constraints) {
            if (constraints.maxWidth <= kMobileBreakpoint) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 1,
                children: gridItems,
              );
            } else if (constraints.maxWidth > kMobileBreakpoint &&
                constraints.maxWidth <= kTabletBreakpoint) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: gridItems,
              );
            } else {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: gridItems,
              );
            }
          }));
        });
  }
}
