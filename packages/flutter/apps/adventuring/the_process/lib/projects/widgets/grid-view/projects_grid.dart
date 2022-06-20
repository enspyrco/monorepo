import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../app_state.dart';
import '../../models/project_state.dart';
import 'new_project_item.dart';
import 'project_item.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ISet<ProjectState>>(
        distinct: true,
        converter: (store) => store.state.projects.all,
        builder: (context, projects) {
          return GridView.count(
            shrinkWrap: true,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 3,
            // Generate 100 widgets that display their index in the List.
            children:
                projects.map<Widget>((project) => ProjectItem(project)).toList()
                  ..insert(0, const NewProjectItem()),
          );
        });
  }
}
