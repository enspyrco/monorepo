import 'package:flutter/material.dart';

import '../../../sections/widgets/section-detail/section_detail_screen.dart';
import '../../../shared/widgets/empty_app_bar.dart';
import '../../widgets/project-detail/sections_view.dart';
import 'project_details_page_state.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen(ProjectDetailsPageState state, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) return const SectionsView();
      return Scaffold(
        appBar: EmptyAppBar(),
        body: Row(
          children: const [
            SizedBox(width: 300, child: SectionsView()),
            SectionDetailScreen()
          ],
        ),
      );
    });
  }
}
