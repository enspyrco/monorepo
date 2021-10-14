import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/organisations/widgets/organisation_creator_view.dart';
import 'package:the_process/organisations/widgets/organisation_selector_view.dart';

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

class EditOrganisationsPageView extends StatelessWidget {
  const EditOrganisationsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              OrganisationSelectorView(),
              OrganisationCreatorView()
            ],
          ),
        ],
      ),
    );
  }
}
