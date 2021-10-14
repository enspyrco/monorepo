import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/extensions.dart';
import 'package:the_process/main.dart';
import 'package:the_process/organisations/actions/update_organisations_view_action.dart';
import 'package:the_process/organisations/models/organisation_model.dart';
import 'package:the_process/organisations/models/organisation_selector_view_model.dart';

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
              context.dispatch<AppState>(
                  UpdateOrganisationsViewAction(selected: selected));
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
