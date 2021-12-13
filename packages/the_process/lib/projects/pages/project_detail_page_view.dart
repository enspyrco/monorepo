import 'package:flutter/material.dart';

import 'package:redfire/widgets.dart';

import '../../sections/widgets/section-detail/section_detail_page.dart';
import '../widgets/project-detail/sections_view.dart';

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
