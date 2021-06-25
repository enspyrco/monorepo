import 'package:flutter/material.dart';
import 'package:the_process/widgets/home/project-overview/project_overview.dart';
import 'package:the_process/widgets/home/section-detail/section_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
