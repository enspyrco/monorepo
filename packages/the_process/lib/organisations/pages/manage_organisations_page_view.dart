import 'package:flutter/material.dart';
import 'package:the_process/organisations/widgets/delete_organisation_button.dart';
import 'package:the_process/organisations/widgets/organisation_creator_view.dart';
import 'package:the_process/organisations/widgets/organisation_selector_view.dart';
import 'package:the_process/shared/widgets/empty_app_bar.dart';

class ManageOrganisationsPageView extends StatelessWidget {
  const ManageOrganisationsPageView({Key? key}) : super(key: key);

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
