import 'package:flutter/material.dart';
import 'package:the_process/widgets/home/project-overview/project-selection-view/create_project_button.dart';
import 'package:the_process/widgets/home/project-overview/project-selection-view/project_selection_dropdown.dart';
import 'package:the_process/widgets/home/project-overview/shared_widgets/selection_container.dart';
import 'package:the_process/widgets/home/project-overview/shared_widgets/selection_label.dart';

class ProjectSelectionView extends StatelessWidget {
  const ProjectSelectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SelectionContainer(
      widgets: [
        SelectionLabel(iconData: Icons.fact_check),
        ProjectSelectionDropdown(),
        CreateProjectButton(),
      ],
    );
  }
}
