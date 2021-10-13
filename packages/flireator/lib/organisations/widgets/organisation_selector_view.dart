import 'package:flireator/main.dart';
import 'package:flireator/organisations/actions/update_organisations_view_action.dart';
import 'package:flireator/organisations/models/organisation_model.dart';
import 'package:flireator/organisations/models/organisation_selector_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/extensions.dart';

class OrganisationSelectorView extends StatelessWidget {
  const OrganisationSelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OrganisationSelectorViewModel>(
        distinct: true,
        converter: (store) => store.state.organisations.editor.selector,
        builder: (context, selector) {
          return DropdownButton<OrganisationModel>(
            value: selector.selected,
            icon: const Icon(Icons.arrow_downward),
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
