import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/projects/pages/create_project_page_view.dart';

part 'create_project_page.freezed.dart';
part 'create_project_page.g.dart';

@freezed
class CreateProjectPageData extends PageData
    with _$CreateProjectPageData, ReduxModel {
  static const String staticTypeName = 'CreateProjectPage';

  const CreateProjectPageData._();
  const factory CreateProjectPageData() = _CreateProjectPageData;

  factory CreateProjectPageData.fromJson(JsonMap json) =>
      _$CreateProjectPageDataFromJson(json);

  @override
  String get typeName => staticTypeName;
}

class CreateProjectPageTransforms extends PageDataTransforms {
  CreateProjectPageTransforms()
      : super(
          typeName: CreateProjectPageData.staticTypeName,
          toMaterialPage: (pageData) => const MaterialPage<dynamic>(
              key: ValueKey(CreateProjectPageData),
              child: CreateProjectPageView()),
          fromJson: (json) => CreateProjectPageData.fromJson(json),
        );
}
