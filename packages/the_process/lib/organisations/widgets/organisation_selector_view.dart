import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/extensions.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/organisations/actions/set_selected_organisation_action.dart';
import 'package:the_process/organisations/models/organisation_model.dart';
import 'package:the_process/organisations/models/organisation_selector_view_model.dart';
import 'package:the_process/projects/actions/tap_projects_action.dart';

class OrganisationSelectorView extends StatelessWidget {
  const OrganisationSelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OrganisationSelectorViewModel>(
        distinct: true,
        converter: (store) => store.state.organisations.selector,
        builder: (context, selector) {
          return DropdownButton<OrganisationModel>(
            value: selector.selected,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (OrganisationModel? selected) {
              if (selected != null) {
                context.dispatch<AppState>(
                    SetSelectedOrganisationAction(selected));
                context.dispatch<AppState>(
                    TapProjectsAction(organisationId: selected.id));
              }
            },
            items: selector.all.map<DropdownMenuItem<OrganisationModel>>(
                (OrganisationModel value) {
              return DropdownMenuItem<OrganisationModel>(
                value: value,
                child: Text(value.name),
              );
            }).toList(),
          );
        });
  }
}
