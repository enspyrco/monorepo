import 'package:flutter/material.dart';
import 'package:redfire/actions.dart';
import 'package:the_process/projects/models/project_model.dart';
import 'package:the_process/projects/pages/create_project_page.dart';
import 'package:the_process/projects/pages/project_detail_page.dart';
import 'package:the_process/utils/build_context_extensions.dart';

class ProjectsGridItemView extends StatelessWidget {
  const ProjectsGridItemView(this.project,
      {this.newProjectButton = false, Key? key})
      : super(key: key);

  final ProjectModel project;
  final bool newProjectButton; // flag to make item act as a 'new' button

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue[100]!, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            if (newProjectButton) {
              context.dispatch(const PushPageAction(CreateProjectPageData()));
            } else {
              context.dispatch(PushPageAction(ProjectDetailPageData()));
            }
          },
          child: Center(
              child: Text(project.name,
                  style: Theme.of(context).textTheme.headline5)),
        ),
      ),
    );
  }
}
