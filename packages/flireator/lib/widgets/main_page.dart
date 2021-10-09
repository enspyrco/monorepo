import 'package:flireator/organisations/models/organisation.dart';
import 'package:flireator/organisations/models/organisations_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

import '../main.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthUserData?>(
      distinct: true,
      converter: (store) => store.state.auth.userData,
      builder: (context, userData) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            actions: const [AccountButton<AppState>()],
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  OrganisationsDropdown(),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

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
