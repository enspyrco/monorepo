import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'project_detail_page_view.dart';

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
          toMaterialPage: (pageData) => const MaterialPage<dynamic>(
              key: ValueKey(ProjectDetailPageData),
              child: ProjectDetailPageView()),
          fromJson: (json) => ProjectDetailPageData.fromJson(json),
        );
}
