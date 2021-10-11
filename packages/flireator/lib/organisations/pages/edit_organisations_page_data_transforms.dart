import 'package:flireator/organisations/pages/edit_organisations_page.dart';
import 'package:flireator/organisations/pages/edit_organisations_page_data.dart';
import 'package:flutter/material.dart';
import 'package:redfire/types.dart';

class EditOrganisationsPageDataTransforms extends PageDataTransforms {
  EditOrganisationsPageDataTransforms()
      : super(
          typeName: EditOrganisationsPageData.staticTypeName,
          toMaterialPage: (pageData) =>
              const MaterialPage<EditOrganisationsPage>(
                  key: ValueKey(EditOrganisationsPage),
                  child: EditOrganisationsPage()),
          fromJson: (json) => EditOrganisationsPageData.fromJson(json),
        );
}
