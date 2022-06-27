import 'package:flutter/material.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/widgets.dart';

import '../../app_state.dart';
import '../../organisations/pages/manage_organisations_page.dart';
import '../../utils/build_context_extensions.dart';

class AccountAvatar extends StatelessWidget {
  const AccountAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvatarMenuButton<AppState>(options: {
      MenuButtonOption(
        'Edit Organisations',
        (context) => context.dispatch(
          const PushPageAction(ManageOrganisationsPageData()),
        ),
      ),
    });
  }
}
