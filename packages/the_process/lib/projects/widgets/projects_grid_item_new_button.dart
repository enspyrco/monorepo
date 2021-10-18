import 'package:flutter/material.dart';
import 'package:the_process/projects/models/project_model.dart';
import 'package:the_process/projects/widgets/projects_grid_item_view.dart';

class ProjectsGridItemNewButton extends ProjectsGridItemView {
  const ProjectsGridItemNewButton({Key? key})
      : super(const ProjectModel(name: '+'), newProjectButton: true, key: key);
}
