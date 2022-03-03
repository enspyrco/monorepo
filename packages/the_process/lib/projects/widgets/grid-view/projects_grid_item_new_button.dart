import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import '../../../app_state.dart';
import '../../../utils/build_context_extensions.dart';
import '../../actions/update_projects_view_action.dart';
import 'create_project_form.dart';

class ProjectsGridItemNewButton extends StatelessWidget {
  const ProjectsGridItemNewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
        distinct: true,
        converter: (store) => store.state.projects.creating,
        builder: (context, creating) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue[100]!, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: (creating)
                  ? const CreateProjectForm()
                  : InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () => context.dispatch(
                          const UpdateProjectsViewAction(creating: true)),
                      child: Center(
                          child: Text('+',
                              style: Theme.of(context).textTheme.headline5)),
                    ),
            ),
          );
        });
  }
}
