import 'package:astro_auth/astro_auth.dart';
import 'package:flutter/material.dart';

import '../../state/app_state.dart';
import '../../state/dependency.dart';
import 'select_packages_area.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({required this.dependencies, Key? key}) : super(key: key);

  final List<Dependency> dependencies;

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              SelectPackagesArea(
                dependencies: dependencies,
              ),
              const Spacer(),
              const AvatarMenuButton<AppState>(
                options: {
                  MenuOption('Sign Out', SignOut<AppState>()),
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
