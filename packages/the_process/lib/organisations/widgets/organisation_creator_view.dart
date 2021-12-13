import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/extensions.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/organisations/actions/create_organisation_action.dart';
import 'package:the_process/organisations/models/organisation_model.dart';

class OrganisationCreatorView extends StatefulWidget {
  const OrganisationCreatorView({Key? key}) : super(key: key);

  @override
  State<OrganisationCreatorView> createState() =>
      _OrganisationCreatorViewState();
}

class _OrganisationCreatorViewState extends State<OrganisationCreatorView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
        distinct: true,
        converter: (store) => store.state.organisations.creator.creating,
        builder: (context, creating) {
          if (!creating) _controller.text = '';
          return SizedBox(
            height: 50,
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Name...'),
                  ),
                ),
                (creating)
                    ? const SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => context.dispatch<AppState>(
                            CreateOrganisationAction(OrganisationModel.init(
                                name: _controller.text))),
                        hoverColor: Colors.transparent,
                        splashRadius: 20,
                      ),
              ],
            ),
          );
        });
  }
}
