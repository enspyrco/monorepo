import 'package:flutter/material.dart';
import 'package:redfire/widgets.dart';

import '../app_state.dart';
import '../organisations/widgets/organisation_selector.dart';
import '../projects/widgets/grid-view/projects_grid.dart';
import 'logo_icon.dart';
import 'notifications-button/notifications_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: const LogoIcon(),
        actions: const [
          NotificationsButton(),
          AvatarMenuButton<AppState>(options: {
            MenuOptionPreset.accountDetails,
            MenuOptionPreset.signOut
          })
        ],
      ),
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
