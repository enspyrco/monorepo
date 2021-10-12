import 'package:flireator/main.dart';
import 'package:flireator/organisations/models/organisations_view_model.dart';
import 'package:flireator/organisations/widgets/create_organisation_input.dart';
import 'package:flireator/organisations/widgets/organisations_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EditOrganisationsPage extends StatelessWidget {
  const EditOrganisationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OrganisationsViewModel>(
      distinct: true,
      converter: (store) => store.state.organisations,
      builder: (context, vm) {
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
                  OrganisationsDropdown(),
                  CreateOrganisationInput()
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
