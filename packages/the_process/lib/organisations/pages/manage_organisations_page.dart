import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

import '../widgets/delete_organisation_button.dart';
import '../widgets/organisation_creator_view.dart';
import '../widgets/organisation_selector_view.dart';

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
          toMaterialPage: (pageData) => MaterialPage<dynamic>(
              key: const ValueKey(ManageOrganisationsPageData),
              child: ManageOrganisationsPage(
                  pageData as ManageOrganisationsPageData)),
          fromJson: (json) => ManageOrganisationsPageData.fromJson(json),
        );
}

class ManageOrganisationsPage extends StatelessWidget {
  const ManageOrganisationsPage(ManageOrganisationsPageData data, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              OrganisationSelectorView(),
              DeleteOrganisationButton(),
              OrganisationCreatorView()
            ],
          ),
        ],
      ),
    );
  }
}
