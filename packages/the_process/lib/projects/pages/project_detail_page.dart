import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/widgets/home/project-overview/project_overview.dart';
import 'package:the_process/widgets/home/section-detail/section_detail_page.dart';

part 'project_detail_page.freezed.dart';
part 'project_detail_page.g.dart';

@freezed
class ProjectDetailPageData extends PageData
    with _$ProjectDetailPageData, ReduxModel {
  static const String staticTypeName = 'ProjectDetailPageData';

  ProjectDetailPageData._();
  factory ProjectDetailPageData() = _ProjectDetailPageData;

  factory ProjectDetailPageData.fromJson(JsonMap json) =>
      _$ProjectDetailPageDataFromJson(json);

  @override
  String get typeName => staticTypeName;
}

class ProjectDetailPageTransforms extends PageDataTransforms {
  ProjectDetailPageTransforms()
      : super(
          typeName: ProjectDetailPageData.staticTypeName,
          toMaterialPage: (pageData) => const MaterialPage<dynamic>(
              key: ValueKey(ProjectDetailPageData),
              child: ProjectDetailPageView()),
          fromJson: (json) => ProjectDetailPageData.fromJson(json),
        );
}

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
