import 'package:flireator/organisations/pages/edit_organisations_page_data.dart';
import 'package:flireator/organisations/pages/edit_organisations_page_view.dart';
import 'package:flutter/material.dart';
import 'package:redfire/types.dart';

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
