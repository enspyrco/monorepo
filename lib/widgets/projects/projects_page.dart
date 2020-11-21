import 'package:flutter/material.dart';
import 'package:the_process/actions/auth/get_authorized.dart';
import 'package:the_process/extensions/flutter_extensions.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: MaterialButton(
          child: Text('Give Authorization'),
          onPressed: () => context.dispatch(GetAuthorized()),
        ),
      ),
    );
  }
}
