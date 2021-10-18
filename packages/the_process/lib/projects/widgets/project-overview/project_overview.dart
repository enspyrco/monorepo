import 'package:flutter/material.dart';
import 'package:the_process/projects/widgets/project-overview/sections-view/sections_view.dart';
import 'package:the_process/shared/widgets/empty_app_bar.dart';

class ProjectOverview extends StatelessWidget {
  const ProjectOverview({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: Column(
        children: const <Widget>[
          SectionsView(),
        ],
      ),
    );
  }
}
