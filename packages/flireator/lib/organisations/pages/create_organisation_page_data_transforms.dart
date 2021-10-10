import 'package:flireator/organisations/pages/create_organisation_page.dart';
import 'package:flireator/organisations/pages/create_organisation_page_data.dart';
import 'package:flutter/material.dart';
import 'package:redfire/types.dart';

class CreateOrganisationPageDataTransforms extends PageDataTransforms {
  CreateOrganisationPageDataTransforms()
      : super(
            CreateOrganisationPageData.staticTypeName,
            (pageData) => const MaterialPage<CreateOrganisationPage>(
                key: ValueKey(CreateOrganisationPage),
                child: CreateOrganisationPage()),
            (json) => CreateOrganisationPageData.fromJson(json));
}
