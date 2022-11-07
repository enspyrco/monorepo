import 'package:astro_auth/astro_auth.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:flutter/material.dart';

import '../app/state/app_state.dart';
import '../organisations/routes/manage_organisations_page_state.dart';
import '../organisations/widgets/organisation_selector.dart';
import '../projects/widgets/grid-view/projects_grid.dart';
import 'logo_icon.dart';
import 'notifications-button/notifications_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [OrganisationSelector()],
          ),
          const ProjectsGrid()
        ],
      ),
    );
  }
}

class BasicAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BasicAppBar({Key? key}) : super(key: key);

  @override
  State<BasicAppBar> createState() => _BasicAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _BasicAppBarState extends State<BasicAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: const <Widget>[
              LogoIcon(),
              Spacer(),
              NotificationsButton(),
              AvatarMenuButton<AppState>(
                options: {
                  MenuOption('Sign Out', SignOut<AppState>()),
                  MenuOption('Manage Organisations',
                      PushRoute<AppState>(ManageOrganisationsPageState())),
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
