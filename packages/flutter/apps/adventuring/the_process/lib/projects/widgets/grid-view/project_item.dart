import 'package:astro_navigation/astro_navigation.dart';
import 'package:flutter/material.dart';

import '../../../shared/extensions/build_context_extensions.dart';
import '../../models/project_state.dart';
import '../../routes/project_details/project_details_page_state.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem(this.project, {Key? key}) : super(key: key);

  final ProjectState project;

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
          onTap: () => context.land(const PushRoute(ProjectDetailsPageState())),
          child: Center(
              child: Text(project.name,
                  style: Theme.of(context).textTheme.headline5)),
        ),
      ),
    );
  }
}
