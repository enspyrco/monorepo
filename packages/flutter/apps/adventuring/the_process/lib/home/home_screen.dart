import 'package:flutter/material.dart';

import '../organisations/widgets/organisation_selector.dart';
import '../projects/widgets/projects-grid/projects_grid.dart';
import 'account-avatar/account_avatar.dart';
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
        actions: const [NotificationsButton(), AccountAvatar()],
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
