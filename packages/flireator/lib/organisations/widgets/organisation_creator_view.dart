import 'package:flireator/main.dart';
import 'package:flireator/organisations/actions/create_organisation_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/extensions.dart';

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
        converter: (store) => store.state.organisations.editor.creator.creating,
        builder: (context, creating) {
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
                            CreateOrganisationAction(_controller.text)),
                        hoverColor: Colors.transparent,
                        splashRadius: 20,
                      ),
              ],
            ),
          );
        });
  }
}
