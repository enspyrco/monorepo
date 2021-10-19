import 'package:flutter/material.dart';
import 'package:the_process/projects/widgets/project-detail/sections_view.dart';
import 'package:the_process/sections/widgets/section-detail/section_detail_page.dart';
import 'package:the_process/shared/widgets/empty_app_bar.dart';

class ProjectDetailPageView extends StatelessWidget {
  const ProjectDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) return const SectionsView();
      return Scaffold(
        appBar: EmptyAppBar(),
        body: Row(
          children: const [
            SizedBox(width: 300, child: SectionsView()),
            SectionDetailPage()
          ],
        ),
      );
    });
  }
}
