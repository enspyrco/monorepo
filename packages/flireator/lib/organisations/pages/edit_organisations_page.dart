import 'package:flireator/main.dart';
import 'package:flireator/organisations/actions/create_organisation_action.dart';
import 'package:flireator/organisations/models/organisations_view_model.dart';
import 'package:flireator/organisations/widgets/organisations_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';

class EditOrganisationsPage extends StatefulWidget {
  const EditOrganisationsPage({Key? key}) : super(key: key);

  @override
  State<EditOrganisationsPage> createState() => _EditOrganisationsPageState();
}

class _EditOrganisationsPageState extends State<EditOrganisationsPage> {
  final _controller = TextEditingController();
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
              Row(children: [
                const OrganisationsDropdown(),
                SizedBox(
                    width: 400,
                    height: 50,
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name of new organisation...'),
                    )),
                SizedBox(
                    height: 50, child: CreateOrganisationButton(_controller)),
              ]),
              const DismissButton(),
            ],
          ),
        );
      },
    );
  }
}

class DismissButton extends StatelessWidget {
  const DismissButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => context.dispatch<AppState>(RemoveCurrentPageAction()),
      child: const Text('Dismiss'),
    );
  }
}

class CreateOrganisationButton extends StatelessWidget {
  const CreateOrganisationButton(this.controller, {Key? key}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () =>
          context.dispatch<AppState>(CreateOrganisationAction(controller.text)),
      child: const Text('+'),
    );
  }
}
