import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

import '../../sections/widgets/section-detail/section_detail_page.dart';
import '../widgets/project-detail/sections_view.dart';

part 'project_detail_page.freezed.dart';
part 'project_detail_page.g.dart';

@freezed
class ProjectDetailPageData extends PageData
    with _$ProjectDetailPageData, ReduxState {
  static const String className = 'ProjectDetailPageData';

  const ProjectDetailPageData._();
  const factory ProjectDetailPageData() = _ProjectDetailPageData;

  factory ProjectDetailPageData.fromJson(JsonMap json) =>
      _$ProjectDetailPageDataFromJson(json);

  @override
  String get typeName => className;
}

class ProjectDetailPageTransforms extends PageDataTransforms {
  ProjectDetailPageTransforms()
      : super(
          typeName: ProjectDetailPageData.className,
          toMaterialPage: (pageData) => MaterialPage<dynamic>(
              key: const ValueKey(ProjectDetailPageData),
              child: ProjectDetailPage(pageData as ProjectDetailPageData)),
          fromJson: (json) => ProjectDetailPageData.fromJson(json),
        );
}

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage(ProjectDetailPageData data, {Key? key})
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
            SectionDetailPage()
          ],
        ),
      );
    });
  }
}
