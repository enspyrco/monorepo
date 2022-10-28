import 'package:astro/astro.dart';
import 'package:flutter/material.dart';
import 'package:the_process/build_context_extensions.dart';

import '../../app/state/app_state.dart';
import '../../projects/missions/tap_projects.dart';
import '../missions/set_selected_organisation.dart';
import '../models/organisation_model.dart';
import '../models/organisation_selector_view_model.dart';

class OrganisationSelector extends StatelessWidget {
  const OrganisationSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, OrganisationSelectorViewModel>(
        transformer: (state) => state.organisations.selector,
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
                context.land(SetSelectedOrganisation(selected));
                context.launch(TapProjects(organisationId: selected.id));
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
