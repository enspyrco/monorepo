import 'package:flireator/main.dart';
import 'package:flireator/organisations/models/organisation.dart';
import 'package:flireator/organisations/models/organisations_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class OrganisationsDropdown extends StatelessWidget {
  const OrganisationsDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OrganisationsViewModel>(
        distinct: true,
        converter: (store) => store.state.organisations,
        builder: (context, organisations) {
          return DropdownButton<Organisation>(
            value: organisations.selected,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (Organisation? newValue) {
              context;
            },
            items: organisations.all
                .map<DropdownMenuItem<Organisation>>((Organisation value) {
              return DropdownMenuItem<Organisation>(
                value: value,
                child: Text(value.name),
              );
            }).toList(),
          );
        });
  }
}
