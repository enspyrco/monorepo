import 'package:flutter/material.dart';
import 'package:the_process/organisations/actions/delete_organisation_action.dart';
import 'package:the_process/utils/build_context_extensions.dart';

class DeleteOrganisationButton extends StatelessWidget {
  const DeleteOrganisationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.dispatch(DeleteOrganisationAction());
        },
        icon: const Icon(Icons.delete_forever_rounded));
  }
}
