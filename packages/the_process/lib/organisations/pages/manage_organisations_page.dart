import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/organisations/pages/manage_organisations_page_view.dart';

part 'manage_organisations_page.freezed.dart';
part 'manage_organisations_page.g.dart';

@freezed
class ManageOrganisationsPageData extends PageData
    with _$ManageOrganisationsPageData, ReduxState {
  static const String className = 'ManageOrganisationsPageData';

  const ManageOrganisationsPageData._();
  const factory ManageOrganisationsPageData() = _ManageOrganisationsPageData;

  factory ManageOrganisationsPageData.fromJson(JsonMap json) =>
      _$ManageOrganisationsPageDataFromJson(json);

  @override
  String get typeName => className;
}

class ManageOrganisationsPageTransforms extends PageDataTransforms {
  ManageOrganisationsPageTransforms()
      : super(
          typeName: ManageOrganisationsPageData.className,
          toMaterialPage: (pageData) => const MaterialPage<dynamic>(
              key: ValueKey(ManageOrganisationsPageData),
              child: ManageOrganisationsPageView()),
          fromJson: (json) => ManageOrganisationsPageData.fromJson(json),
        );
}
