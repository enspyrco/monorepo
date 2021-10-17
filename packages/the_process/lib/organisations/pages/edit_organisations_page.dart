import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/organisations/pages/edit_organisations_page_view.dart';

part 'edit_organisations_page.freezed.dart';
part 'edit_organisations_page.g.dart';

@freezed
class EditOrganisationsPageData extends PageData
    with _$EditOrganisationsPageData, ReduxModel {
  static const String staticTypeName = 'EditOrganisationsPageData';

  EditOrganisationsPageData._();
  factory EditOrganisationsPageData() = _EditOrganisationsPageData;

  factory EditOrganisationsPageData.fromJson(JsonMap json) =>
      _$EditOrganisationsPageDataFromJson(json);

  @override
  String get typeName => staticTypeName;
}

class EditOrganisationsPageTransforms extends PageDataTransforms {
  EditOrganisationsPageTransforms()
      : super(
          typeName: EditOrganisationsPageData.staticTypeName,
          toMaterialPage: (pageData) => const MaterialPage<dynamic>(
              key: ValueKey(EditOrganisationsPageData),
              child: EditOrganisationsPageView()),
          fromJson: (json) => EditOrganisationsPageData.fromJson(json),
        );
}
