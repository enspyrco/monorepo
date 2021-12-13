import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/widgets.dart';

import '../../app_state.dart';
import '../../organisations/pages/manage_organisations_page.dart';

class AppAccountButton extends StatelessWidget {
  const AppAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccountButton<AppState>(
      options: ISet(
        [
          AccountButtonOption(
            'Edit Organisations',
            (context) => context.dispatch<AppState>(
              const PushPageAction(ManageOrganisationsPageData()),
            ),
          ),
        ],
      ),
    );
  }
}
