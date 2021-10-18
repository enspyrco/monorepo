import 'package:flutter/material.dart';
import 'package:the_process/projects/widgets/project-overview/project_overview.dart';
import 'package:the_process/sections/widgets/section-detail/section_detail_page.dart';

class ProjectDetailPageView extends StatelessWidget {
  const ProjectDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) return const ProjectOverview();
      return Row(
        children: const [
          SizedBox(width: 300, child: ProjectOverview()),
          SectionDetailPage()
        ],
      );
    });
  }
}
