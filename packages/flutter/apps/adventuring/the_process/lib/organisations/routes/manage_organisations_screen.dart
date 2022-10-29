import 'package:flutter/material.dart';

import '../../shared/widgets/empty_app_bar.dart';
import '../widgets/delete_organisation_button.dart';
import '../widgets/organisation_creator_view.dart';
import '../widgets/organisation_selector.dart';
import 'manage_organisations_page_state.dart';

class ManageOrganisationsScreen extends StatelessWidget {
  const ManageOrganisationsScreen(ManageOrganisationsPageState state,
      {Key? key})
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
              OrganisationSelector(),
              DeleteOrganisationButton(),
              OrganisationCreatorView()
            ],
          ),
        ],
      ),
    );
  }
}
