import 'package:flutter/material.dart';
import 'package:the_process/projects/models/project_model.dart';
import 'package:the_process/projects/widgets/grid-view/projects_grid_item_new_button.dart';
import 'package:the_process/projects/widgets/grid-view/projects_grid_item_view.dart';

class ProjectsGridView extends StatelessWidget {
  const ProjectsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _projects = [
      const ProjectModel(name: '1'),
      const ProjectModel(name: '2')
    ];

    return GridView.count(
      shrinkWrap: true,
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 3,
      // Generate 100 widgets that display their index in the List.
      children: _projects
          .map<Widget>((project) => ProjectsGridItemView(project))
          .toList()
        ..insert(0, const ProjectsGridItemNewButton()),
    );
  }
}
