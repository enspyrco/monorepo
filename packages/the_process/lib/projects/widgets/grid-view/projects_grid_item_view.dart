import 'package:flutter/material.dart';
import 'package:redfire/actions.dart';
import 'package:the_process/projects/models/project_model.dart';
import 'package:the_process/projects/pages/project_detail_page.dart';
import 'package:the_process/utils/build_context_extensions.dart';

class ProjectsGridItemView extends StatelessWidget {
  const ProjectsGridItemView(this.project, {Key? key}) : super(key: key);

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue[100]!, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () =>
              context.dispatch(const PushPageAction(ProjectDetailPageData())),
          child: Center(
              child: Text(project.name,
                  style: Theme.of(context).textTheme.headline5)),
        ),
      ),
    );
  }
}
