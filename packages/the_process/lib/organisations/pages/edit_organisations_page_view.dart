import 'package:flutter/material.dart';
import 'package:the_process/organisations/widgets/organisation_creator_view.dart';
import 'package:the_process/organisations/widgets/organisation_selector_view.dart';

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
