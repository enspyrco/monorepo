import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/main.dart';
import 'package:the_process/organisations/actions/delete_organisation_action.dart';
import 'package:the_process/utils/build_context_extensions.dart';

class DeleteOrganisationButton extends StatelessWidget {
  const DeleteOrganisationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
        distinct: true,
        converter: (store) => store.state.organisations.deleting,
        builder: (context, deleting) => (deleting)
            ? const SizedBox(
                width: 30,
                height: 30,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : IconButton(
                onPressed: () {
                  context.dispatch(const DeleteOrganisationAction());
                },
                icon: const Icon(Icons.delete_forever_rounded)));
  }
}
